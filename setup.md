# Setup: libvirt host 10.10.0.11

Host: `10.10.0.11` (Ubuntu 22.04.5 LTS)

## 1) Install libvirt/qemu
```bash
sudo apt-get update -y
sudo apt-get install -y qemu-kvm libvirt-daemon-system libvirt-clients virtinst bridge-utils
```

## 2) Copy VM XML to host
```bash
scp vm.xml vaishutin@10.10.0.11:/tmp/vm.xml
```

## 3) Prepare bridge + disk image
```bash
# Create a dummy bridge referenced by vm.xml
sudo ip link add name portal-test type bridge 2>/dev/null || true
sudo ip link set portal-test up

# Create a local qcow2 backing file
sudo mkdir -p /var/lib/libvirt/images
sudo qemu-img create -f qcow2 /var/lib/libvirt/images/ovirt-test.qcow2 10G
sudo chown libvirt-qemu:kvm /var/lib/libvirt/images/ovirt-test.qcow2
```

## 4) Adapt vm.xml to run on a clean Ubuntu host
The original `vm.xml` is oVirt-specific. For a clean host we generate a local version `/tmp/vm-local.xml` that preserves the oVirt metadata but removes unsupported pieces and points storage to the local qcow2.

```bash
python3 - <<'PY'
import re, pathlib
p = pathlib.Path('/tmp/vm.xml')
s = p.read_text()
# Disk: use local qcow2 file instead of oVirt block device
s = s.replace("type='block' device='disk'", "type='file' device='disk'")
s = re.sub(r"source dev='[^']+'", "source file='/var/lib/libvirt/images/ovirt-test.qcow2'", s)
# VNC listen: remove oVirt network dependency
s = s.replace("listen='10.11.0.11'", "listen='0.0.0.0'")
s = re.sub(r"<listen type='network'[^>]*/>", "<listen type='address' address='0.0.0.0'/>", s)
# Drop oVirt filterref (not present in vanilla libvirt)
s = re.sub(r"\n\s*<filterref[^>]+/>", "", s)
# Drop SELinux/DAC seclabel blocks (Ubuntu uses AppArmor)
s = re.sub(r"\n\s*<seclabel type='dynamic' model='selinux'[^>]*>.*?</seclabel>", "", s, flags=re.S)
s = re.sub(r"\n\s*<seclabel type='dynamic' model='dac'[^>]*>.*?</seclabel>", "", s, flags=re.S)
# Drop watchdog (unsupported model on this host)
s = re.sub(r"\n\s*<watchdog\b[^>]*>.*?</watchdog>", "", s, flags=re.S)
# Use software emulation (no KVM on this host)
s = s.replace("<domain type='kvm'", "<domain type='qemu'")
# Drop CPU model/NUMA (host lacks required features)
s = re.sub(r"\n\s*<cpu\b[^>]*>.*?</cpu>", "", s, flags=re.S)
# Drop memory hotplug requirement
s = re.sub(r"\n\s*<maxMemory\b[^>]*>.*?</maxMemory>", "", s)
# Drop cputune pinning (cpuset out of range)
s = re.sub(r"\n\s*<cputune\b[^>]*>.*?</cputune>", "", s, flags=re.S)
# Drop guest agent channel (path missing on clean host)
s = re.sub(r"\n\s*<channel\b[^>]*>.*?</channel>", "", s, flags=re.S)

path = pathlib.Path('/tmp/vm-local.xml')
path.write_text(s)
PY
```

## 5) Define + start VM
```bash
sudo virsh define /tmp/vm-local.xml
sudo virsh start pyryakov-console
sudo virsh list --all
```

Expected output:
```
Id   Name               State
----------------------------------
4    pyryakov-console   running
```

## 6) Useful checks
```bash
sudo virsh dominfo pyryakov-console
sudo virsh dumpxml pyryakov-console > /tmp/vm-local.xml
```

## Notes
- This host does not expose KVM, so the VM is running under TCG (`type='qemu'`).
- The oVirt metadata under `<metadata>` is preserved, which is what the exporter uses.
- The local XML is `/tmp/vm-local.xml` and can be redefined any time.
