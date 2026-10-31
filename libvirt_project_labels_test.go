package main

import (
	"github.com/prometheus/client_golang/prometheus"
	"strings"
	"testing"
)

func TestEveryDomainMetricDescribesProjectUUID(t *testing.T) {
	exporter, _ := NewLibvirtExporter("")
	descriptions := make(chan *prometheus.Desc, 256)
	exporter.Describe(descriptions)
	close(descriptions)
	count := 0
	for desc := range descriptions {
		text := desc.String()
		if strings.Contains(text, `fqName: "libvirt_domain_`) {
			count++
			if !strings.Contains(text, "project_uuid") {
				t.Errorf("domain metric cannot be routed to its project: %s", text)
			}
		}
	}
	if count == 0 {
		t.Fatalf("domain metric descriptors missing: %d", count)
	}
}
