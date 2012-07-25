// This file is subject to a 1-clause BSD license.
// Its contents can be found in the enclosed LICENSE file.

package magic

// No flags
const (
	FlagNone          = 0x000000
	FlagDebug         = 0x000001 // Turn on debugging
	FlagSymlink       = 0x000002 // Follow symlinks 
	FlagCompress      = 0x000004 // Check inside compressed files 
	FlagDevices       = 0x000008 // Look at the contents of devices 
	FlagMimeType      = 0x000010 // Return the MIME type 
	FlagContinue      = 0x000020 // Return all matches 
	FlagCheck         = 0x000040 // Print warnings to stderr 
	FlagPreserveATime = 0x000080 // Restore access time on exit 
	FlagRaw           = 0x000100 // Don't translate unprintable chars 
	FlagError         = 0x000200 // Handle ENOENT etc as real errors 
	FlagMimeEncoding  = 0x000400 // Return the MIME encoding 
	FlagApple         = 0x000800 // Return the Apple creator and type 
	FlagNoCompress    = 0x001000 // Don't check for compressed files 
	FlagNoTar         = 0x002000 // Don't check for tar files 
	FlagNoSoft        = 0x004000 // Don't check magic entries 
	FlagNoAppType     = 0x008000 // Don't check application type 
	FlagNoElf         = 0x010000 // Don't check for elf details 
	FlagNoText        = 0x020000 // Don't check for text files 
	FlagNoCDF         = 0x040000 // Don't check for cdf files 
	FlagNoTokens      = 0x100000 // Don't check tokens 
	FlagNoEncoding    = 0x200000 // Don't check text encodings 

	FlagMime = FlagMimeType | FlagMimeEncoding

	// No built-in tests; only consult the magic file
	FlagNoBuiltin = FlagNoCompress | FlagNoTar | FlagNoAppType |
		FlagNoElf | FlagNoText | FlagNoCDF | FlagNoTokens | FlagNoEncoding
)
