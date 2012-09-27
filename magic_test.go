// This file is subject to a 1-clause BSD license.
// Its contents can be found in the enclosed LICENSE file.

package magic

import (
	"strings"
	"testing"
)

var magic_files = [...]string{
	"testdata/compiled/archives.mgc",
	"testdata/compiled/bootloaders.mgc",
	"testdata/compiled/compressed.mgc",
	"testdata/compiled/crypto.mgc",
	"testdata/compiled/executables.mgc",
	"testdata/compiled/filesystems.mgc",
	"testdata/compiled/firmware.mgc",
	"testdata/compiled/kernels.mgc",
	"testdata/compiled/sql.mgc",
}

func Test(t *testing.T) {
	conn, err := Open(FlagMime)
	if err != nil {
		t.Fatal(err)
	}

	defer conn.Close()

	err = conn.Load(strings.Join(magic_files[:], ":"))
	if err != nil {
		t.Fatal(err)
	}

	const want = "text/plain; charset=us-ascii"

	// Test mimetype for this source file.
	have, err := conn.File("magic_test.go")
	if err != nil {
		t.Fatal(err)
	}

	if have != want {
		t.Fatalf("Unexpected mime type. Want %q, have %q", want, have)
	}
}

func TestSystemMagic(t *testing.T) {
	conn, err := Open(FlagMime)
	if err != nil {
		t.Fatal(err)
	}

	defer conn.Close()

	err = conn.Load("")
	if err != nil {
		t.Fatal(err)
	}

	const want = "text/plain; charset=us-ascii"

	have, err := conn.File("magic_test.go")
	if err != nil {
		t.Fatal(err)
	}

	if have != want {
		t.Fatalf("Unexpected mime type. Want %q, have %q", want, have)
	}
}
