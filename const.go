// This file is subject to a 1-clause BSD license.
// Its contents can be found in the enclosed LICENSE file.

package magic

// No flags
const FlagNone = 0

const (
	FlagDebug         = 1 << iota // Turn on debugging
	FlagSymlink                   // Follow symlinks 
	FlagCompress                  // Check inside compressed files 
	FlagDevices                   // Look at the contents of devices 
	FlagMimeType                  // Return the MIME type 
	FlagContinue                  // Return all matches 
	FlagCheck                     // Print warnings to stderr 
	FlagPreserveATime             // Restore access time on exit 
	FlagRaw                       // Don't translate unprintable chars 
	FlagError                     // Handle ENOENT etc as real errors 
	FlagMimeEncoding              // Return the MIME encoding 
	FlagApple                     // Return the Apple creator and type 

	FlagMime = FlagMimeType | FlagMimeEncoding

	FlagNoCompress // Don't check for compressed files 
	FlagNoTar      // Don't check for tar files 
	FlagNoSoft     // Don't check magic entries 
	FlagNoAppType  // Don't check application type 
	FlagNoElf      // Don't check for elf details 
	FlagNoText     // Don't check for text files 
	FlagNoCDF      // Don't check for cdf files 
	FlagNoTokens   // Don't check tokens 
	FlagNoEncoding // Don't check text encodings 

	// No built-in tests; only consult the magic file
	FlagNoBuiltin = FlagNoCompress | FlagNoTar | FlagNoAppType |
		FlagNoElf | FlagNoText | FlagNoCDF | FlagNoTokens | FlagNoEncoding
)
