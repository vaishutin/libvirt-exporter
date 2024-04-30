# Prometheus libvirt exporter

Docker image is available at [dockerhub](https://hub.docker.com/r/alekseizakharov/libvirt-exporter).

 - `Dockerfile` - creates a docker container with dynamically linked libvirt-exporter. Make an image and run with `docker container run -p9177:9177 -v /var/run/libvirt:/var/run/libvirt yourcontainername`. Based on the latest golang:alpine.
 - `build-with` - builds dynamically linked libvirt-exporter in the container based on Dockerfile specified as an argument. Ex.: `build-with ./build_container/Dockerfile.ubuntu2004` will build libvirt-exporter for Ubuntu 20.04.

# Metrics
The following metrics/labels are being exported:

```

# HELP libvirt_domain_block_meta Block device metadata info. Device name, source file, serial.
# TYPE libvirt_domain_block_meta gauge
libvirt_domain_block_meta{bus="virtio",cache="none",discard="",disk_type="file",domain="instance-00000001",driver_type="qcow2",instance_name="t2-1",project_name="admin",serial="",source_file="/var/lib/nova/instances/f6b6310a-cf50-443a-8499-a383b9bbc51c/disk",target_device="vda"} 1

# HELP libvirt_domain_block_stats_allocation Offset of the highest written sector on a block device.
# TYPE libvirt_domain_block_stats_allocation gauge
libvirt_domain_block_stats_allocation{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 1.7498112e+07

# HELP libvirt_domain_block_stats_capacity_bytes Logical size in bytes of the block device	backing image.
# TYPE libvirt_domain_block_stats_capacity_bytes gauge
libvirt_domain_block_stats_capacity_bytes{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 4.6137344e+07

# HELP libvirt_domain_block_stats_flush_requests_total Total flush requests from a block device.
# TYPE libvirt_domain_block_stats_flush_requests_total counter
libvirt_domain_block_stats_flush_requests_total{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 37

# HELP libvirt_domain_block_stats_flush_time_seconds_total Total time in seconds spent on cache flushing to a block device
# TYPE libvirt_domain_block_stats_flush_time_seconds_total counter
libvirt_domain_block_stats_flush_time_seconds_total{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 0.075812694

# HELP libvirt_domain_block_stats_limit_burst_length_read_requests_seconds Read requests per second burst time in seconds
# TYPE libvirt_domain_block_stats_limit_burst_length_read_requests_seconds gauge
libvirt_domain_block_stats_limit_burst_length_read_requests_seconds{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 0

# HELP libvirt_domain_block_stats_limit_burst_length_total_requests_seconds Total requests per second burst time in seconds
# TYPE libvirt_domain_block_stats_limit_burst_length_total_requests_seconds gauge
libvirt_domain_block_stats_limit_burst_length_total_requests_seconds{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 0

# HELP libvirt_domain_block_stats_limit_burst_length_write_requests_seconds Write requests per second burst time in seconds
# TYPE libvirt_domain_block_stats_limit_burst_length_write_requests_seconds gauge
libvirt_domain_block_stats_limit_burst_length_write_requests_seconds{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 0

# HELP libvirt_domain_block_stats_limit_burst_read_bytes Read throughput burst limit in bytes per second
# TYPE libvirt_domain_block_stats_limit_burst_read_bytes gauge
libvirt_domain_block_stats_limit_burst_read_bytes{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 0

# HELP libvirt_domain_block_stats_limit_burst_read_bytes_length_seconds Read throughput burst time in seconds
# TYPE libvirt_domain_block_stats_limit_burst_read_bytes_length_seconds gauge
libvirt_domain_block_stats_limit_burst_read_bytes_length_seconds{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 0

# HELP libvirt_domain_block_stats_limit_burst_read_requests Read requests per second burst limit
# TYPE libvirt_domain_block_stats_limit_burst_read_requests gauge
libvirt_domain_block_stats_limit_burst_read_requests{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 0

# HELP libvirt_domain_block_stats_limit_burst_total_bytes Total throughput burst limit in bytes per second
# TYPE libvirt_domain_block_stats_limit_burst_total_bytes gauge
libvirt_domain_block_stats_limit_burst_total_bytes{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 0

# HELP libvirt_domain_block_stats_limit_burst_total_bytes_length_seconds Total throughput burst time in seconds
# TYPE libvirt_domain_block_stats_limit_burst_total_bytes_length_seconds gauge
libvirt_domain_block_stats_limit_burst_total_bytes_length_seconds{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 0

# HELP libvirt_domain_block_stats_limit_burst_total_requests Total requests per second burst limit
# TYPE libvirt_domain_block_stats_limit_burst_total_requests gauge
libvirt_domain_block_stats_limit_burst_total_requests{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 0

# HELP libvirt_domain_block_stats_limit_burst_write_bytes Write throughput burst limit in bytes per second
# TYPE libvirt_domain_block_stats_limit_burst_write_bytes gauge
libvirt_domain_block_stats_limit_burst_write_bytes{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 0

# HELP libvirt_domain_block_stats_limit_burst_write_bytes_length_seconds Write throughput burst time in seconds
# TYPE libvirt_domain_block_stats_limit_burst_write_bytes_length_seconds gauge
libvirt_domain_block_stats_limit_burst_write_bytes_length_seconds{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 0

# HELP libvirt_domain_block_stats_limit_burst_write_requests Write requests per second burst limit
# TYPE libvirt_domain_block_stats_limit_burst_write_requests gauge
libvirt_domain_block_stats_limit_burst_write_requests{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 0

# HELP libvirt_domain_block_stats_limit_read_bytes Read throughput limit in bytes per second
# TYPE libvirt_domain_block_stats_limit_read_bytes gauge
libvirt_domain_block_stats_limit_read_bytes{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 0

# HELP libvirt_domain_block_stats_limit_read_requests Read requests per second limit
# TYPE libvirt_domain_block_stats_limit_read_requests gauge
libvirt_domain_block_stats_limit_read_requests{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 0

# HELP libvirt_domain_block_stats_limit_total_bytes Total throughput limit in bytes per second
# TYPE libvirt_domain_block_stats_limit_total_bytes gauge
libvirt_domain_block_stats_limit_total_bytes{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 0

# HELP libvirt_domain_block_stats_limit_total_requests Total requests per second limit
# TYPE libvirt_domain_block_stats_limit_total_requests gauge
libvirt_domain_block_stats_limit_total_requests{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 0

# HELP libvirt_domain_block_stats_limit_write_bytes Write throughput limit in bytes per second
# TYPE libvirt_domain_block_stats_limit_write_bytes gauge
libvirt_domain_block_stats_limit_write_bytes{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 0

# HELP libvirt_domain_block_stats_limit_write_requests Write requests per second limit
# TYPE libvirt_domain_block_stats_limit_write_requests gauge
libvirt_domain_block_stats_limit_write_requests{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 0

# HELP libvirt_domain_block_stats_physicalsize_bytes Physical size in bytes of the container of the backing image.
# TYPE libvirt_domain_block_stats_physicalsize_bytes gauge
libvirt_domain_block_stats_physicalsize_bytes{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 1.7440768e+07

# HELP libvirt_domain_block_stats_read_bytes_total Number of bytes read from a block device, in bytes.
# TYPE libvirt_domain_block_stats_read_bytes_total counter
libvirt_domain_block_stats_read_bytes_total{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 2.0077568e+07

# HELP libvirt_domain_block_stats_read_requests_total Number of read requests from a block device.
# TYPE libvirt_domain_block_stats_read_requests_total counter
libvirt_domain_block_stats_read_requests_total{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 972

# HELP libvirt_domain_block_stats_read_time_seconds_total Total time spent on reads from a block device, in seconds.
# TYPE libvirt_domain_block_stats_read_time_seconds_total counter
libvirt_domain_block_stats_read_time_seconds_total{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 0.458728941

# HELP libvirt_domain_block_stats_size_iops_bytes The size of IO operations per second permitted through a block device
# TYPE libvirt_domain_block_stats_size_iops_bytes gauge
libvirt_domain_block_stats_size_iops_bytes{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 0

# HELP libvirt_domain_block_stats_write_bytes_total Number of bytes written to a block device, in bytes.
# TYPE libvirt_domain_block_stats_write_bytes_total counter
libvirt_domain_block_stats_write_bytes_total{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 1.2453888e+07

# HELP libvirt_domain_block_stats_write_requests_total Number of write requests to a block device.
# TYPE libvirt_domain_block_stats_write_requests_total counter
libvirt_domain_block_stats_write_requests_total{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 401

# HELP libvirt_domain_block_stats_write_time_seconds_total Total time spent on writes on a block device, in seconds
# TYPE libvirt_domain_block_stats_write_time_seconds_total counter
libvirt_domain_block_stats_write_time_seconds_total{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="vda"} 10.668975581

# HELP libvirt_domain_info_cpu_time_seconds_total Amount of CPU time used by the domain, in seconds.
# TYPE libvirt_domain_info_cpu_time_seconds_total counter
libvirt_domain_info_cpu_time_seconds_total{domain="instance-00000001",instance_name="t2-1",project_name="admin"} 965.22

# HELP libvirt_domain_info_maximum_memory_bytes Maximum allowed memory of the domain, in bytes.
# TYPE libvirt_domain_info_maximum_memory_bytes gauge
libvirt_domain_info_maximum_memory_bytes{domain="instance-00000001",instance_name="t2-1",project_name="admin"} 1.073741824e+09

# HELP libvirt_domain_info_memory_usage_bytes Memory usage of the domain, in bytes.
# TYPE libvirt_domain_info_memory_usage_bytes gauge
libvirt_domain_info_memory_usage_bytes{domain="instance-00000001",instance_name="t2-1",project_name="admin"} 1.073741824e+09

# HELP libvirt_domain_info_meta Domain metadata
# TYPE libvirt_domain_info_meta gauge
libvirt_domain_info_meta{domain="instance-00000001",flavor="m1.small",instance_name="t2-1",project_name="admin",project_uuid="1cf66f88857148fb83586839709bef77",root_type="image",root_uuid="d3974d38-36cb-4817-8b35-c5d2afcc90f6",user_name="admin",user_uuid="2598e2a4606e4bff8f6957ca016a9e36",uuid="f6b6310a-cf50-443a-8499-a383b9bbc51c"} 1

# HELP libvirt_domain_info_virtual_cpus Number of virtual CPUs for the domain.
# TYPE libvirt_domain_info_virtual_cpus gauge
libvirt_domain_info_virtual_cpus{domain="instance-00000001",instance_name="t2-1",project_name="admin"} 1

# HELP libvirt_domain_info_vstate Virtual domain state. 0: no state, 1: the domain is running, 2: the domain is blocked on resource, 3: the domain is paused by user, 4: the domain is being shut down, 5: the domain is shut off,6: the domain is crashed, 7: the domain is suspended by guest power management
# TYPE libvirt_domain_info_vstate gauge
libvirt_domain_info_vstate{domain="instance-00000001",instance_name="t2-1",project_name="admin"} 1

# HELP libvirt_domain_interface_meta Interfaces metadata. Source bridge, target device, interface uuid
# TYPE libvirt_domain_interface_meta gauge
libvirt_domain_interface_meta{domain="instance-00000001",instance_name="t2-1",project_name="admin",source_bridge="brqcc6a0d5f-8f",target_device="tapc82feb09-83",virtual_interface=""} 1

# HELP libvirt_domain_interface_stats_receive_bytes_total Number of bytes received on a network interface, in bytes.
# TYPE libvirt_domain_interface_stats_receive_bytes_total counter
libvirt_domain_interface_stats_receive_bytes_total{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="tapc82feb09-83"} 9991

# HELP libvirt_domain_interface_stats_receive_drops_total Number of packet receive drops on a network interface.
# TYPE libvirt_domain_interface_stats_receive_drops_total counter
libvirt_domain_interface_stats_receive_drops_total{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="tapc82feb09-83"} 0

# HELP libvirt_domain_interface_stats_receive_errors_total Number of packet receive errors on a network interface.
# TYPE libvirt_domain_interface_stats_receive_errors_total counter
libvirt_domain_interface_stats_receive_errors_total{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="tapc82feb09-83"} 0

# HELP libvirt_domain_interface_stats_receive_packets_total Number of packets received on a network interface.
# TYPE libvirt_domain_interface_stats_receive_packets_total counter
libvirt_domain_interface_stats_receive_packets_total{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="tapc82feb09-83"} 100

# HELP libvirt_domain_interface_stats_transmit_bytes_total Number of bytes transmitted on a network interface, in bytes.
# TYPE libvirt_domain_interface_stats_transmit_bytes_total counter
libvirt_domain_interface_stats_transmit_bytes_total{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="tapc82feb09-83"} 10529

# HELP libvirt_domain_interface_stats_transmit_drops_total Number of packet transmit drops on a network interface.
# TYPE libvirt_domain_interface_stats_transmit_drops_total counter
libvirt_domain_interface_stats_transmit_drops_total{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="tapc82feb09-83"} 0

# HELP libvirt_domain_interface_stats_transmit_errors_total Number of packet transmit errors on a network interface.
# TYPE libvirt_domain_interface_stats_transmit_errors_total counter
libvirt_domain_interface_stats_transmit_errors_total{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="tapc82feb09-83"} 0

# HELP libvirt_domain_interface_stats_transmit_packets_total Number of packets transmitted on a network interface.
# TYPE libvirt_domain_interface_stats_transmit_packets_total counter
libvirt_domain_interface_stats_transmit_packets_total{domain="instance-00000001",instance_name="t2-1",project_name="admin",target_device="tapc82feb09-83"} 121

# HELP libvirt_domain_memory_stats_actual_balloon_bytes Current balloon value (in bytes).
# TYPE libvirt_domain_memory_stats_actual_balloon_bytes gauge
libvirt_domain_memory_stats_actual_balloon_bytes{domain="instance-00000001",instance_name="t2-1",project_name="admin"} 1.073741824e+09

# HELP libvirt_domain_memory_stats_available_bytes The total amount of usable memory as seen by the domain. This value may be less than the amount of memory assigned to the domain if a balloon driver is in use or if the guest OS does not initialize all assigned pages. This value is expressed in bytes.
# TYPE libvirt_domain_memory_stats_available_bytes gauge
libvirt_domain_memory_stats_available_bytes{domain="instance-00000001",instance_name="t2-1",project_name="admin"} 1.040617472e+09

# HELP libvirt_domain_memory_stats_disk_cache_bytes The amount of memory, that can be quickly reclaimed without additional I/O (in bytes).Typically these pages are used for caching files from disk.
# TYPE libvirt_domain_memory_stats_disk_cache_bytes gauge
libvirt_domain_memory_stats_disk_cache_bytes{domain="instance-00000001",instance_name="t2-1",project_name="admin"} 0

# HELP libvirt_domain_memory_stats_major_fault_total Page faults occur when a process makes a valid access to virtual memory that is not available. When servicing the page fault, if disk IO is required, it is considered a major fault.
# TYPE libvirt_domain_memory_stats_major_fault_total counter
libvirt_domain_memory_stats_major_fault_total{domain="instance-00000001",instance_name="t2-1",project_name="admin"} 0

# HELP libvirt_domain_memory_stats_minor_fault_total Page faults occur when a process makes a valid access to virtual memory that is not available. When servicing the page not fault, if disk IO is required, it is considered a minor fault.
# TYPE libvirt_domain_memory_stats_minor_fault_total counter
libvirt_domain_memory_stats_minor_fault_total{domain="instance-00000001",instance_name="t2-1",project_name="admin"} 43829

# HELP libvirt_domain_memory_stats_rss_bytes Resident Set Size of the process running the domain. This value is in bytes
# TYPE libvirt_domain_memory_stats_rss_bytes gauge
libvirt_domain_memory_stats_rss_bytes{domain="instance-00000001",instance_name="t2-1",project_name="admin"} 1.49323776e+08

# HELP libvirt_domain_memory_stats_unused_bytes The amount of memory left completely unused by the system. Memory that is available but used for reclaimable caches should NOT be reported as free. This value is expressed in bytes.
# TYPE libvirt_domain_memory_stats_unused_bytes gauge
libvirt_domain_memory_stats_unused_bytes{domain="instance-00000001",instance_name="t2-1",project_name="admin"} 1.0029056e+09

# HELP libvirt_domain_memory_stats_usable_bytes How much the balloon can be inflated without pushing the guest system to swap, corresponds to 'Available' in /proc/meminfo
# TYPE libvirt_domain_memory_stats_usable_bytes gauge
libvirt_domain_memory_stats_usable_bytes{domain="instance-00000001",instance_name="t2-1",project_name="admin"} 9.40511232e+08

# HELP libvirt_domain_memory_stats_used_percent The amount of memory in percent, that used by domain.
# TYPE libvirt_domain_memory_stats_used_percent gauge
libvirt_domain_memory_stats_used_percent{domain="instance-00000001",instance_name="t2-1",project_name="admin"} 9.619888450229672

# HELP libvirt_domain_vcpu_cpu Real CPU number, or one of the values from virVcpuHostCpuState
# TYPE libvirt_domain_vcpu_cpu gauge
libvirt_domain_vcpu_cpu{domain="instance-00000001",instance_name="t2-1",project_name="admin",vcpu="0"} 6

# HELP libvirt_domain_vcpu_delay_seconds_total Amount of CPU time used by the domain's VCPU, in seconds. Vcpu's delay metric. Time the vcpu thread was enqueued by the host scheduler, but was waiting in the queue instead of running. Exposed to the VM as a steal time.
# TYPE libvirt_domain_vcpu_delay_seconds_total counter
libvirt_domain_vcpu_delay_seconds_total{domain="instance-00000001",instance_name="t2-1",project_name="admin",vcpu="0"} 0.0839009

# HELP libvirt_domain_vcpu_state VCPU state. 0: offline, 1: running, 2: blocked
# TYPE libvirt_domain_vcpu_state gauge
libvirt_domain_vcpu_state{domain="instance-00000001",instance_name="t2-1",project_name="admin",vcpu="0"} 1

# HELP libvirt_domain_vcpu_time_seconds_total Amount of CPU time used by the domain's VCPU, in seconds.
# TYPE libvirt_domain_vcpu_time_seconds_total counter
libvirt_domain_vcpu_time_seconds_total{domain="instance-00000001",instance_name="t2-1",project_name="admin",vcpu="0"} 49.79

# HELP libvirt_domain_vcpu_wait_seconds_total Vcpu's wait_sum metric. CONFIG_SCHEDSTATS has to be enabled
# TYPE libvirt_domain_vcpu_wait_seconds_total counter
libvirt_domain_vcpu_wait_seconds_total{domain="instance-00000001",instance_name="t2-1",project_name="admin",vcpu="0"} 0

# HELP libvirt_up Whether scraping libvirt's metrics was successful.
# TYPE libvirt_up gauge
libvirt_up 1

# HELP libvirt_versions_info Versions of virtualization components
# TYPE libvirt_versions_info gauge
libvirt_versions_info{hypervisor_running="6.2.0",libvirt_library="7.9.0",libvirtd_running="8.0.0"} 1

```

## Libvirt/qemu version notice
Some of the above might be exposed only with:

`libvirt >= v7.2.0`:
libvirt_domain_vcpu_delay_seconds_total

# Historical
Project forked from https://github.com/kumina/libvirt_exporter and substantially rewritten.
Implemented support for several additional metrics, ceph rbd (and network block devices), ovs.
Implemented statistics collection using GetAllDomainStats

And then forked again from https://github.com/rumanzo/libvirt_exporter_improved and rewritten.
Implemented meta metrics and more info about disks, interfaces and domain.

This repository provides code for a Prometheus metrics exporter
for [libvirt](https://libvirt.org/). This exporter connects to any
libvirt daemon and exports per-domain metrics related to CPU, memory,
disk and network usage. By default, this exporter listens on TCP port
9177.

This exporter makes use of
[libvirt-go](https://gitlab.com/libvirt/libvirt-go-module), the official Go
bindings for libvirt. This exporter make use of the
`GetAllDomainStats()`

