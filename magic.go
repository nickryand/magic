// This file is subject to a 1-clause BSD license.
// Its contents can be found in the enclosed LICENSE file.

// Go bindings for libmagic.
package magic

//#cgo LDFLAGS: -lmagic
//#include <stdlib.h>
//#include <magic.h>
import "C"
import (
	"errors"
	"unsafe"
)

var (
	ConnectionError   = errors.New("Magic: Connection is closed.")
	ConnectionFailure = errors.New("Magic: Failed to open magic database.")
)

// Path is not documented anywhere, so I have no idea what it does.
// Use at your own discretion.
func Path(file string, flags int) string {
	cf := C.CString(file)
	defer C.free(unsafe.Pointer(cf))

	cr := C.magic_getpath(cf, C.int(flags))
	if cr == nil {
		return ""
	}

	r := C.GoString(cr)
	C.free(unsafe.Pointer(cr))
	return r, nil
}

// Magic exposes a set of methods which allow us to interact with the
// magic database as defined by libmagic.
type Magic struct {
	ptr C.magic_t // Holds the database descriptor.
}

// Open attempts to create a new connection to the magic database.
func Open(flags int) (*Magic, error) {
	ptr := C.magic_open(C.int(flags))
	if ptr == nil {
		return nil, ConnectionFailure
	}

	return &Magic{ptr}, nil
}

// Close closes the database connection.
func (m *Magic) Close() (err error) {
	if m.ptr == nil {
		return ConnectionError
	}

	C.magic_close(m.ptr)
	m.ptr = nil
	return
}

// File returns a textual description of the contents of the filename argument.
// If the filename is nil, then stdin is used.
func (m *Magic) File(file string) (string, error) {
	if m.ptr == nil {
		return "", ConnectionError
	}

	cf := C.CString(file)
	defer C.free(unsafe.Pointer(cf))

	cr := C.magic_file(m.ptr, cf)
	if cr == nil {
		return "", m.check()
	}

	r := C.GoString(cr)
	C.free(unsafe.Pointer(cr))
	return r, nil
}

// Descriptor returns a textual description of the contents of the
// file descriptor argument.
func (m *Magic) Descriptor(fd int) (string, error) {
	if m.ptr == nil {
		return "", ConnectionError
	}

	cr := C.magic_descriptor(m.ptr, C.int(fd))
	if cr == nil {
		return "", m.check()
	}

	r := C.GoString(cr)
	C.free(unsafe.Pointer(cr))
	return r, nil
}

// Buffer returns a textual description of the contents of the buffer argument.
func (m *Magic) Buffer(data []byte) (string, error) {
	if m.ptr == nil {
		return "", ConnectionError
	}
	if len(data) == 0 {
		return "", nil
	}

	ptr := unsafe.Pointer(&data[0])
	sz := C.size_t(len(data))
	cr := C.magic_buffer(m.ptr, ptr, sz)

	if cr == nil {
		return "", m.check()
	}

	r := C.GoString(cr)
	C.free(unsafe.Pointer(cr))
	return r, nil
}

// SetFlags sets the given flags.
//
// Note that using both MIME flags together can also return extra
// information on the charset.
func (m *Magic) SetFlags(flags int) error {
	if m.ptr == nil {
		return ConnectionError
	}

	if C.magic_setflags(m.ptr, C.int(flags)) < 0 {
		return errors.New("Magic: FlagPreserveATime is not supported by this system.")
	}

	return m.check()
}

// Load must be used to load database files before any magic queries can
// be performed.
// 
// We expect either a colon separated list of database file paths, or an
// empty string ("") to use the default, system-installed database.
func (m *Magic) Load(file string) error {
	if m.ptr == nil {
		return ConnectionError
	}

	var cf *C.char

	if file != "" {
		cf = C.CString(file)
		defer C.free(unsafe.Pointer(cf))
	}

	C.magic_load(m.ptr, cf)
	return m.check()
}

// Compile can be used to compile the specified database files.
//
// The created files are named from the basename(1) of each
// file argument with `.mgc` appended to it.
// 
// We expect a colon separated list of database file paths.
func (m *Magic) Compile(file string) error {
	if m.ptr == nil {
		return ConnectionError
	}

	cf := C.CString(file)
	defer C.free(unsafe.Pointer(cf))

	C.magic_compile(m.ptr, cf)
	return m.check()
}

// Check can be used to check the validity of entries in the given
// database files.
// 
// We expect a colon separated list of database file paths.
func (m *Magic) Check(file string) error {
	if m.ptr == nil {
		return ConnectionError
	}

	cf := C.CString(file)
	defer C.free(unsafe.Pointer(cf))

	C.magic_check(m.ptr, cf)
	return m.check()
}

// List dumps all magic entries in a human readable format, dumping first the
// entries that are matched against binary files and then the ones that match
// text files.
// 
// We expect either a colon separated list of database file paths, or an
// empty string ("") to use the default, system-installed database.
func (m *Magic) List(file string) error {
	if m.ptr == nil {
		return ConnectionError
	}

	cf := C.CString(file)
	defer C.free(unsafe.Pointer(cf))

	C.magic_list(m.ptr, cf)
	return m.check()
}

// check checks libmagic for any pending errors.
func (m *Magic) check() error {
	if m.ptr == nil {
		return ConnectionError
	}

	cr := C.magic_error(m.ptr)
	if cr == nil {
		return nil
	}

	r := C.GoString(cr)
	C.free(unsafe.Pointer(cr))
	return errors.New(r)
}
