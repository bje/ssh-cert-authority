package util

import (
	"testing"
)

func TestMakeCert(t *testing.T) {
	cert := MakeCertificate()
	PrintForInspection(cert)
}
