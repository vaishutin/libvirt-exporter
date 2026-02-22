.PHONY: build clean fmt tidy vendor deps check-deps

GO ?= go
BINARY ?= libvirt_exporter
VERSION ?= $(shell git describe --tags --dirty --always 2>/dev/null || echo dev)
GOFLAGS ?= -mod=vendor
LDFLAGS ?= -s -w -X main.Version=$(VERSION)
SUDO ?= sudo

build: check-deps
	$(GO) build $(GOFLAGS) -o $(BINARY) -ldflags "$(LDFLAGS)"

fmt:
	$(GO) fmt ./...

tidy:
	$(GO) mod tidy

vendor:
	$(GO) mod vendor

check-deps:
	@command -v $(GO) >/dev/null 2>&1 || { echo "go not found. Run: make deps"; exit 1; }
	@command -v pkg-config >/dev/null 2>&1 || { echo "pkg-config not found. Run: make deps"; exit 1; }
	@pkg-config --exists libvirt >/dev/null 2>&1 || { echo "libvirt.pc not found. Run: make deps"; exit 1; }

deps:
	@set -e; \
	if command -v apt-get >/dev/null 2>&1; then \
		$(SUDO) apt-get update -y; \
		$(SUDO) apt-get install -y build-essential pkg-config libvirt-dev golang; \
	elif command -v dnf >/dev/null 2>&1; then \
		$(SUDO) dnf install -y @'Development Tools' pkgconf-pkg-config libvirt-devel golang; \
	elif command -v yum >/dev/null 2>&1; then \
		$(SUDO) yum install -y gcc gcc-c++ make pkgconfig libvirt-devel golang; \
	elif command -v pacman >/dev/null 2>&1; then \
		$(SUDO) pacman -Syu --noconfirm base-devel pkgconf libvirt go; \
	elif command -v zypper >/dev/null 2>&1; then \
		$(SUDO) zypper install -y -t pattern devel_basis; \
		$(SUDO) zypper install -y pkg-config libvirt-devel go; \
	elif command -v brew >/dev/null 2>&1; then \
		brew install go pkg-config libvirt; \
	else \
		echo "No supported package manager found. Install Go, pkg-config, and libvirt development headers."; \
		exit 1; \
	fi

clean:
	rm -f $(BINARY)
