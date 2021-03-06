#--------------------File Systems---------------------

# Minix filesystems - Juan Cespedes <cespedes@debian.org>
# Disabled for now until better signatures can be created. Too many false positives.
#0x410   leshort         0x137f          Minix filesystem
#>0x402  beshort         !0              \b, %d zones
#>0x1e   string          minix           \b, bootable
#0x410   leshort         0x138f          Minix filesystem, 30 char names
#0x410   leshort         0x2468          Minix filesystem, version 2
#0x410   leshort         0x2478          Minix filesystem, version 2, 30 char names

#0x410   beshort         0x137f          Minix filesystem (big endian)
#>0x402  beshort         !0              \b, %d zones
#>0x1e   string          minix           \b, bootable
#0x410   beshort         0x138f          Minix filesystem (big endian), 30 char names
#0x410   beshort         0x2468          Minix filesystem (big endian), version 2
#0x410   beshort         0x2478          Minix filesystem (big endian), version 2, 30 char names

# YAFFS
0	belong 	0x03000000
>4	belong 	0x01000000
>>8	beshort	0xFFFF		YAFFS filesystem

# EFS2 file system - jojo@utulsa.edu
8       string EFSSuper         EFS2 Qualcomm filesystem super block,
>0      lelong 0x53000000	little endian,
>>4     leshort &1              NAND
>>4     leshort ^1              NOR
>>4     leshort x               version 0x%x,
>>24    lelong  x               %d blocks,
>>16    lelong  x               0x%x pages per block,
>>20    lelong  x               0x%x bytes per page

8	string SSFErepu		EFS2 Qualcomm filesystem super block,
>0      belong 0x53000000	big endian,
>>4     beshort &1              NAND
>>4     beshort ^1              NOR
>>4     beshort x               version 0x%x,
>>24    belong  x               %d blocks,
>>16    belong  x               0x%x pages per block,
>>20    belong  x               0x%x bytes per page

# TROC file system
0	string	TROC		TROC filesystem,
>4	lelong	x		%d file entries

# PFS file system
0	string	PFS/		PFS filesystem,
>4	string	x		version %s,
>14	leshort	x		%d files

# MPFS file system
0	string	MPFS		MPFS (Microchip) filesystem,
>4	byte	x		version %d.
>5	byte	x		\b%d,
>6	leshort	x		%d file entries

# cramfs filesystem - russell@coker.com.au
0       lelong  0x28cd3d45      CramFS filesystem, little endian
>4	lelong	<0		invalid
>4      lelong  x 		size %lu
>8      lelong  &1 		version #2
>8      lelong  &2 		sorted_dirs
>8      lelong  &4 		hole_support
>32     lelong  x 		CRC 0x%x,
>36     lelong  x 		edition %lu,
>40	lelong	<0		invalid
>40     lelong  x 		%lu blocks,
>44	lelong	<0		invalid
>44     lelong  x 		%lu files

0       belong  0x28cd3d45      CramFS filesystem, big endian
>4	belong	<0		invalid
>4      belong  x 		size %lu
>8      belong  &1 		version #2
>8      belong  &2 		sorted_dirs
>8      belong  &4 		hole_support
>32     belong  x 		CRC 0x%x,
>36     belong  x 		edition %lu,
>40	belong	<0		invalid
>40     belong  x 		%lu blocks,
>44	belong	<0		invalid
>44     belong  x 		%lu files



# JFFS2 file system
0       leshort 0x1984          JFFS2 filesystem (old) data little endian,
>4	lelong	>1000000	invalid
>4	lelong	<0		invalid
>4	lelong	0		invalid
>4	lelong	x		JFFS node length: %d

0       beshort 0x1984          JFFS2 filesystem (old) data big endian,
>4      belong  >1000000        invalid
>4      belong  <0              invalid
>4	belong	0		invalid
>4      belong  x               JFFS node length: %d

0       leshort 0x1985          JFFS2 filesystem data little endian,
>4      lelong  >1000000        invalid
>4      lelong  <0              invalid
>4	lelong	0		invalid
>4	lelong	x		JFFS node length: %d

0       beshort 0x1985          JFFS2 filesystem data big endian,
>4      belong  >1000000        invalid
>4      belong  <0              invalid
>4	belong	0		invalid
>4      belong  x               JFFS node length: %d


# Squashfs
0       string  sqsh    Squashfs filesystem, big endian,
>28	beshort	>100	invalid
>28	beshort <1	invalid
>28     beshort x       version %d.
>30     beshort x       \b%d,
>28     beshort <3
>>8     belong  x       size: %d bytes,
>28     beshort >2
>>63    bequad x        size: %lld bytes,
#>>67   belong  x       %d bytes,
>4      belong  x       %d inodes,
>28     beshort <2
>>32    beshort x       blocksize: %d bytes,
>28     beshort >1
>>51    belong  x       blocksize: %d bytes,
>39     bedate  x       created: %s

0       string  hsqs    Squashfs filesystem, little endian,
>28     leshort >100    invalid
>28     leshort <1      invalid
>28     leshort x       version %d.
>30     leshort x       \b%d,
>28     leshort <3
>>8     lelong  x       size: %d bytes,
>28     leshort >2
>>63    lequad x        size: %lld bytes,
#>>63   lelong  x       %d bytes,
>4      lelong  x       %d inodes,
>28     leshort <2
>>32    leshort x       blocksize: %d bytes,
>28     leshort >1
>>51    lelong  x       blocksize: %d bytes,
>39     ledate  x       created: %s

# Squashfs with LZMA compression
0       string  sqlz    Squashfs filesystem, big endian, lzma compression, 
>28     beshort >100    invalid
>28     beshort <1      invalid
>28     beshort x       version %d.
>30     beshort x       \b%d,
>28     beshort <3
>>8     belong  x       size: %d bytes,
>28     beshort >2
>>63    bequad x        size: %lld bytes,
#>>67   belong  x       %d bytes,
>4      belong  x       %d inodes,
>28     beshort <2
>>32    beshort x       blocksize: %d bytes,
>28     beshort >1
>>51    belong  x       blocksize: %d bytes,
>39     bedate  x       created: %s

# Squashfs 3.3 LZMA signature
0       string  qshs    Squashfs filesystem, big endian, lzma signature,
>28     beshort >100    invalid
>28     beshort <1      invalid
>28     beshort x       version %d.
>30     beshort x       \b%d,
>28     beshort <3
>>8     belong  x       size: %d bytes,
>28     beshort >2
>>63    bequad x        size: %lld bytes,
#>>67   belong  x       %d bytes,
>4      belong  x       %d inodes,
>28     beshort <2
>>32    beshort x       blocksize: %d bytes,
>28     beshort >1
>>51    belong  x       blocksize: %d bytes,
>39     bedate  x       created: %s

# Squashfs for DD-WRT
0       string  tqsh    Squashfs filesystem, big endian, DD-WRT signature,
>28     beshort >100    invalid
>28     beshort <1      invalid
>28     beshort x       version %d.
>30     beshort x       \b%d,
>28     beshort <3
>>8     belong  x       size: %d bytes,
>28     beshort >2
>>63    bequad x        size: %lld bytes,
#>>67   belong  x       %d bytes,
>4      belong  x       %d inodes,
>28     beshort <2
>>32    beshort x       blocksize: %d bytes,
>28     beshort >1
>>51    belong  x       blocksize: %d bytes,
>39     bedate  x       created: %s

# Squashfs for DD-WRT
0       string  hsqt    Squashfs filesystem, little endian, DD-WRT signature,
>28     leshort >100    invalid
>28     leshort <1      invalid
>28     leshort x       version %d.
>30     leshort x       \b%d,
>28     leshort <3
>>8     lelong  x       size: %d bytes,
>28     leshort >2
>>63    lequad x        size: %lld bytes,
#>>63   lelong  x       %d bytes,
>4      lelong  x       %d inodes,
>28     leshort <2
>>32    leshort x       blocksize: %d bytes,
>28     leshort >1
>>51    lelong  x       blocksize: %d bytes,
>39     ledate  x       created: %s

# Non-standard Squashfs signature found on some D-Link routers
0       string  shsq    Squashfs filesystem, little endian, non-standard signature, 
>28     leshort >100    invalid
>28     leshort <1      invalid
>28     leshort x       version %d.
>30     leshort x       \b%d,
>28     leshort <3
>>8     lelong  x       size: %d bytes,
>28     leshort >2
>>63    lequad x        size: %lld bytes,
#>>63   lelong  x       %d bytes,
>4      lelong  x       %d inodes,
>28     leshort <2
>>32    leshort x       blocksize: %d bytes,
>28     leshort >1
>>51    lelong  x       blocksize: %d bytes,
>39     ledate  x       created: %s

# Commented out for now - unlikely to be found in firmware
# CDROM Filesystems
# Modified for UDF by gerardo.cacciari@gmail.com
#32769   string    CD001     #
#!:mime  application/x-iso9660-image
#>38913  string   !NSR0      ISO 9660 CD-ROM filesystem data
#>38913  string    NSR0      UDF filesystem data
#>>38917 string    1         (version 1.0)
#>>38917 string    2         (version 1.5)
#>>38917 string    3         (version 2.0)
#>>38917 byte     >0x33      (unknown version, ID 0x%X)
#>>38917 byte     <0x31      (unknown version, ID 0x%X)
# "application id" which appears to be used as a volume label
#>32808  string    >\0       '%s'
#>34816  string    \000CD001\001EL\ TORITO\ SPECIFICATION    (bootable)
#37633   string    CD001     ISO 9660 CD-ROM filesystem data (raw 2352 byte sectors)
#!:mime  application/x-iso9660-image
#32776   string    CDROM     High Sierra CD-ROM filesystem data

# reiserfs - russell@coker.com.au
0x10034         string  ReIsErFs        ReiserFS filesystem V3.5
0x10034         string  ReIsEr2Fs       ReiserFS filesystem V3.6
0x10034         string  ReIsEr3Fs       ReiserFS filesystem V3.6.19
>0x1002c        leshort x               block size %d
>0x10032        leshort &2              (mounted or unclean)
>0x10000        lelong  x               num blocks %d
>0x10040        lelong  1               tea hash
>0x10040        lelong  2               yura hash
>0x10040        lelong  3               r5 hash


# ext2/ext3 filesystems - Andreas Dilger <adilger@dilger.ca>
# ext4 filesystem - Eric Sandeen <sandeen@sandeen.net>
# volume label and UUID Russell Coker
# http://etbe.coker.com.au/2008/07/08/label-vs-uuid-vs-device/
0x438   leshort         0xEF53          Linux
>0x44c  lelong          x               rev %d
>0x43e  leshort         x               \b.%d
# No journal?  ext2
>0x45c  lelong          ^0x0000004      ext2 filesystem data
>>0x43a leshort         ^0x0000001      (mounted or unclean)
# Has a journal?  ext3 or ext4
>0x45c  lelong          &0x0000004
#  and small INCOMPAT?
>>0x460 lelong          <0x0000040
#   and small RO_COMPAT?
>>>0x464 lelong         <0x0000008      ext3 filesystem data
#   else large RO_COMPAT?
>>>0x464 lelong         >0x0000007      ext4 filesystem data
#  else large INCOMPAT?
>>0x460 lelong          >0x000003f      ext4 filesystem data
>0x468  belong          x               \b, UUID=%08x
>0x46c  beshort         x               \b-%04x
>0x46e  beshort         x               \b-%04x
>0x470  beshort         x               \b-%04x
>0x472  belong          x               \b-%08x
>0x476  beshort         x               \b%04x
>0x478  string          >0              \b, volume name "%s"
# General flags for any ext* fs
>0x460  lelong          &0x0000004      (needs journal recovery)
>0x43a  leshort         &0x0000002      (errors)
# INCOMPAT flags
>0x460  lelong          &0x0000001      (compressed)
#>0x460 lelong          &0x0000002      (filetype)
#>0x460 lelong          &0x0000010      (meta bg)
>0x460  lelong          &0x0000040      (extents)
>0x460  lelong          &0x0000080      (64bit)
#>0x460 lelong          &0x0000100      (mmp)
#>0x460 lelong          &0x0000200      (flex bg)
# RO_INCOMPAT flags
#>0x464 lelong          &0x0000001      (sparse super)
>0x464  lelong          &0x0000002      (large files)
>0x464  lelong          &0x0000008      (huge files)
#>0x464 lelong          &0x0000010      (gdt checksum)


#romfs filesystems - Juan Cespedes <cespedes@debian.org>
0       string          -rom1fs-        romfs filesystem, version 1
>8	belong	>10000000		invalid
>8      belong  x                       size: %d bytes,
>16     string  x                       named %s.

# JFFS - russell@coker.com.au           
0       lelong  0x34383931      Linux Journalled Flash filesystem, little endian
0       belong  0x34383931      Linux Journalled Flash filesystem, big endian

# Wind River MemFS file system, found in some VxWorks devices
0	string	owowowowowowowowowowowowowowow		Wind River management filesystem,
>32	belong	0					uncompressed
>32	belong	1					compressed,
>36	belong	x					%d files


# FATX 
0		string		FATX		FATX filesystem data





# updated by Joerg Jenderek at Sep 2007
# only for sector sizes with 512 or more Bytes
0x1FE	leshort	0xAA55			start boot sector
# to do also for sectors < than 512 Bytes and some other files, GRR
#30	search/481	\x55\xAA	start boot sector / filesystem
# not for BeOS floppy 1440k, MBRs
#(11.s-2) uleshort	0xAA55		start boot sector / filesystem
>2	string	OSBS			\b, OS/BS MBR
# J\xf6rg Jenderek <joerg dot jenderek at web dot de>
>0x8C	string	Invalid\ partition\ table	\b, MS-DOS MBR
# dr-dos with some upper-, lowercase variants
>0x9D	string	Invalid\ partition\ table$	
>>181	string	No\ Operating\ System$		
>>>201	string	Operating\ System\ load\ error$	\b, DR-DOS MBR, Version 7.01 to 7.03
>0x9D	string	Invalid\ partition\ table$	
>>181	string	No\ operating\ system$		
>>>201	string	Operating\ system\ load\ error$	\b, DR-DOS MBR, Version 7.01 to 7.03
>342	string	Invalid\ partition\ table$	
>>366	string	No\ operating\ system$		
>>>386	string	Operating\ system\ load\ error$	\b, DR-DOS MBR, version 7.01 to 7.03
>295	string	NEWLDR\0				
>>302	string	Bad\ PT\ $				
>>>310	string	No\ OS\ $				
>>>>317	string	OS\ load\ err$				
>>>>>329	string	Moved\ or\ missing\ IBMBIO.LDR\n\r	
>>>>>>358	string	Press\ any\ key\ to\ continue.\n\r$	
>>>>>>>387	string	Copyright\ (c)\ 1984,1998	
>>>>>>>>411	string	Caldera\ Inc.\0		\b, DR-DOS MBR (IBMBIO.LDR)
>0x10F	string	Ung\201ltige\ Partitionstabelle	\b, MS-DOS MBR, german version 4.10.1998, 4.10.2222
>>0x1B8	ubelong	>0				\b, Serial 0x%-.4x
>0x8B	string	Ung\201ltige\ Partitionstabelle	\b, MS-DOS MBR, german version 5.00 to 4.00.950
>271	string	Invalid\ partition\ table\0		
>>295	string	Error\ loading\ operating\ system\0	
>>>326	string	Missing\ operating\ system\0		\b, mbr
#
>139	string	Invalid\ partition\ table\0		
>>163	string	Error\ loading\ operating\ system\0	
>>>194	string	Missing\ operating\ system\0		\b, Microsoft Windows XP mbr
# http://www.heise.de/ct/05/09/006/ page 184
#HKEY_LOCAL_MACHINE\SYSTEM\MountedDevices\DosDevices\?:=Serial4Bytes+8Bytes
>>>>0x1B8	ulelong	>0				\b,Serial 0x%-.4x
>300	string	Invalid\ partition\ table\0	
>>324	string	Error\ loading\ operating\ system\0
>>>355	string	Missing\ operating\ system\0		\b, Microsoft Windows XP MBR
#??>>>389	string	Invalid\ system\ disk		
>>>>0x1B8	ulelong	>0				\b, Serial 0x%-.4x
>300	string	Ung\201ltige\ Partitionstabelle
#split string to avoid error: String too long
>>328	string	Fehler\ beim\ Laden\ 	
>>>346	string	des\ Betriebssystems	
>>>>366	string	Betriebssystem\ nicht\ vorhanden	\b, Microsoft Windows XP MBR (german)
>>>>>0x1B8	ulelong	>0				\b, Serial 0x%-.4x
#>0x145	string	Default:\ F				\b, FREE-DOS MBR
#>0x14B	string	Default:\ F				\b, FREE-DOS 1.0 MBR
>0x145	search/7	Default:\ F			\b, FREE-DOS MBR
#>>313		string	F0\ .\ .\ .			
#>>>322		string	disk\ 1				
#>>>>382	string	FAT3				
>64	string	no\ active\ partition\ found	
>>96	string	read\ error\ while\ reading\ drive	\b, FREE-DOS Beta 0.9 MBR
# Ranish Partition Manager http://www.ranish.com/part/
>387	search/4	\0\ Error!\r			
>>378	search/7	Virus! 				
>>>397	search/4	Booting\ 			
>>>>408	search/4	HD1/\0	 			\b, Ranish MBR (
>>>>>416	string	Writing\ changes...		\b2.37
>>>>>>438	ubyte		x			\b,0x%x dots
>>>>>>440	ubyte		>0			\b,virus check
>>>>>>441	ubyte		>0			\b,partition %c
#2.38,2.42,2.44
>>>>>416	string	!Writing\ changes...		\b
>>>>>>418	ubyte	1				\bvirus check,
>>>>>>419	ubyte	x				\b0x%x seconds
>>>>>>420	ubyte&0x0F	>0			\b,partition
>>>>>>>420	ubyte&0x0F	<5			\b %x
>>>>>>>420	ubyte&0x0F	0Xf			\b ask
>>>>>420	ubyte		x			\b)
#
>271	string	Operating\ system\ loading 		
>>296	string	error\r					\b, SYSLINUX MBR (2.10)
# http://www.acronis.de/
>362	string	MBR\ Error\ \0\r			
>>376	string	ress\ any\ key\ to\ 			
>>>392	string	boot\ from\ floppy...\0			\b, Acronis MBR
# added by Joerg Jenderek
# http://www.visopsys.org/
# http://partitionlogic.org.uk/
>309	string	No\ bootable\ partition\ found\r	
>>339	string	I/O\ Error\ reading\ boot\ sector\r	\b, Visopsys MBR
>349	string	No\ bootable\ partition\ found\r	
>>379	string	I/O\ Error\ reading\ boot\ sector\r	\b, simple Visopsys MBR
# bootloader, bootmanager
>0x40	string	SBML				
# label with 11 characters of FAT 12 bit filesystem
>>43	string	SMART\ BTMGR			
>>>430	string	SBMK\ Bad!\r			\b, Smart Boot Manager
# OEM-ID not always "SBM"
#>>>>3	strings	SBM				
>>>>6	string	>\0                             \b, version %s
>382	string	XOSLLOADXCF			\b, eXtended Operating System Loader
>6	string	LILO				\b, LInux i386 boot LOader
>>120	string	LILO				\b, version 22.3.4 SuSe
>>172	string	LILO				\b, version 22.5.8 Debian
# updated by Joerg Jenderek at Oct 2008
# variables according to grub-0.97/stage1/stage1.S or
# http://www.gnu.org/software/grub/manual/grub.html#Embedded-data
# usual values are marked with comments to get only informations of strange GRUB loaders
>342		search/60	\0Geom\0	
#>0		ulelong		x		%x=0x009048EB ,	0x2a9048EB  0
>>0x41		ubyte		<2		
>>>0x3E		ubyte		>2		\b; GRand Unified Bootloader
# 0x3 for 0.5.95,0.93,0.94,0.96 0x4 for 1.90 
>>>>0x3E	ubyte		x		\b, stage1 version 0x%x
#If it is 0xFF, use a drive passed by BIOS
>>>>0x40	ubyte		<0xFF		\b, boot drive 0x%x
# in most case 0,1,0x2e for GRUB 0.5.95
>>>>0x41	ubyte		>0		\b, LBA flag 0x%x
>>>>0x42	uleshort	<0x8000		\b, stage2 address 0x%x
#>>>>0x42	uleshort	=0x8000		\b, stage2 address 0x%x (usual)
>>>>0x42	uleshort	>0x8000		\b, stage2 address 0x%x
#>>>>0x44	ulelong		=1		\b, 1st sector stage2 0x%x (default)
>>>>0x44	ulelong		>1		\b, 1st sector stage2 0x%x
>>>>0x48	uleshort	<0x800		\b, stage2 segment 0x%x
#>>>>0x48	uleshort	=0x800		\b, stage2 segment 0x%x (usual)
>>>>0x48	uleshort	>0x800		\b, stage2 segment 0x%x
>>>>402		string	Geom\0Hard\ Disk\0Read\0\ Error\0
>>>>>394	string	stage1			\b, GRUB version 0.5.95
>>>>382		string	Geom\0Hard\ Disk\0Read\0\ Error\0
>>>>>376	string	GRUB\ \0		\b, GRUB version 0.93 or 1.94
>>>>383		string	Geom\0Hard\ Disk\0Read\0\ Error\0
>>>>>377	string	GRUB\ \0		\b, GRUB version 0.94
>>>>385		string	Geom\0Hard\ Disk\0Read\0\ Error\0
>>>>>379	string	GRUB\ \0		\b, GRUB version 0.95 or 0.96
>>>>391		string	Geom\0Hard\ Disk\0Read\0\ Error\0
>>>>>385	string	GRUB\ \0		\b, GRUB version 0.97
#unkown version
>>>343		string	Geom\0Read\0\ Error\0	
>>>>321		string	Loading\ stage1.5	\b, GRUB version x.y
>>>380		string	Geom\0Hard\ Disk\0Read\0\ Error\0
>>>>374		string	GRUB\ \0		\b, GRUB version n.m
# http://syslinux.zytor.com/
>478	string	Boot\ failed\r			
>>495	string	LDLINUX\ SYS			\b, SYSLINUX bootloader (1.62)
>480	string	Boot\ failed\r			
>>495	string	LDLINUX\ SYS			\b, SYSLINUX bootloader (2.06 or 2.11)
>484	string	Boot\ error\r			\b, SYSLINUX bootloader (3.11)
>395	string	chksum\0\ ERROR!\0		\b, Gujin bootloader
# http://www.bcdwb.de/bcdw/index_e.htm
>3	string	BCDL				
>>498	string	BCDL\ \ \ \ BIN			\b, Bootable CD Loader (1.50Z)
# mbr partion table entries
# OEM-ID does not contain MicroSoft,NEWLDR,DOS,SYSLINUX,or MTOOLs
>3			string		!MS
>>3			string		!SYSLINUX
>>>3			string		!MTOOL
>>>>3			string		!NEWLDR
>>>>>5			string		!DOS
# not FAT (32 bit)
>>>>>>82		string		!FAT32
#not Linux kernel
>>>>>>>514		string		!HdrS
#not BeOS
>>>>>>>>422		string		!Be\ Boot\ Loader
# active flag 0 or 0x80 and type > 0
>>>>>>>>>446		ubyte		<0x81	
>>>>>>>>>>446		ubyte&0x7F	0	
>>>>>>>>>>>450		ubyte		>0	\b; partition 1: ID=0x%x
>>>>>>>>>>>>446		ubyte		0x80	\b, active
>>>>>>>>>>>>447		ubyte		x	\b, starthead %u
#>>>>>>>>>>>>448		ubyte		x	\b, start C_S: 0x%x
#>>>>>>>>>>>>448		ubeshort&1023	x	\b, startcylinder? %d
>>>>>>>>>>>>454		ulelong		x	\b, startsector %u
>>>>>>>>>>>>458		ulelong		x	\b, %u sectors
#
>>>>>>>>>462		ubyte		<0x81	
>>>>>>>>>>462		ubyte&0x7F	0		
>>>>>>>>>>>466		ubyte		>0	\b; partition 2: ID=0x%x
>>>>>>>>>>>>462		ubyte		0x80	\b, active
>>>>>>>>>>>>463		ubyte		x	\b, starthead %u
#>>>>>>>>>>>>464		ubyte		x	\b, start C_S: 0x%x
#>>>>>>>>>>>>464		ubeshort&1023	x	\b, startcylinder? %d
>>>>>>>>>>>>470		ulelong		x	\b, startsector %u
>>>>>>>>>>>>474		ulelong		x	\b, %u sectors
#
>>>>>>>>>478		ubyte		<0x81		
>>>>>>>>>>478		ubyte&0x7F	0		
>>>>>>>>>>>482		ubyte		>0	\b; partition 3: ID=0x%x
>>>>>>>>>>>>478		ubyte		0x80	\b, active
>>>>>>>>>>>>479		ubyte		x	\b, starthead %u
#>>>>>>>>>>>>480		ubyte		x	\b, start C_S: 0x%x
#>>>>>>>>>>>>481		ubyte		x	\b, start C2S: 0x%x
#>>>>>>>>>>>>480		ubeshort&1023	x	\b, startcylinder? %d
>>>>>>>>>>>>486		ulelong		x	\b, startsector %u
>>>>>>>>>>>>490		ulelong		x	\b, %u sectors
#
>>>>>>>>>494		ubyte		<0x81	
>>>>>>>>>>494		ubyte&0x7F	0		
>>>>>>>>>>>498		ubyte		>0	\b; partition 4: ID=0x%x
>>>>>>>>>>>>494		ubyte		0x80	\b, active
>>>>>>>>>>>>495		ubyte		x	\b, starthead %u
#>>>>>>>>>>>>496		ubyte		x	\b, start C_S: 0x%x
#>>>>>>>>>>>>496		ubeshort&1023	x	\b, startcylinder? %d
>>>>>>>>>>>>502		ulelong		x	\b, startsector %u
>>>>>>>>>>>>506		ulelong		x	\b, %u sectors
# mbr partion table entries end
# http://www.acronis.de/
#FAT label=ACRONIS\ SZ
#OEM-ID=BOOTWIZ0
>442	string	Non-system\ disk,\ 	
>>459	string	press\ any\ key...\x7\0		\b, Acronis Startup Recovery Loader
# DOS names like F11.SYS are 8 right space padded bytes+3 bytes
>>>477		ubyte&0xDF	>0		
>>>>477		string		x 		\b %-.3s
>>>>>480	ubyte&0xDF	>0		
>>>>>>480	string		x 		\b%-.5s
>>>>485		ubyte&0xDF	>0		
>>>>>485	string		x 		\b.%-.3s
#
>185	string	FDBOOT\ Version\ 			
>>204	string	\rNo\ Systemdisk.\ 			
>>>220	string	Booting\ from\ harddisk.\n\r		
>>>245	string	Cannot\ load\ from\ harddisk.\n\r	
>>>>273 string	Insert\ Systemdisk\ 			
>>>>>291 string and\ press\ any\ key.\n\r		\b, FDBOOT harddisk Bootloader
>>>>>>200 string	>\0                             \b, version %-3s
>242	string	Bootsector\ from\ C.H.\ Hochst\204	
>>278	string	No\ Systemdisk.\ 			
>>>293	string	Booting\ from\ harddisk.\n\r		
>>>441	string	Cannot\ load\ from\ harddisk.\n\r	
>>>>469 string	Insert\ Systemdisk\ 			
>>>>>487 string and\ press\ any\ key.\n\r		\b, WinImage harddisk Bootloader
>>>>>>209 string	>\0                             \b, version %-4.4s
>(1.b+2)	ubyte		0xe			
>>(1.b+3)	ubyte		0x1f			
>>>(1.b+4)	ubyte		0xbe			
>>>>(1.b+5)	ubyte		0x77			
>>>>(1.b+6)	ubyte		0x7c			
>>>>>(1.b+7)	ubyte		0xac			
>>>>>>(1.b+8)	ubyte		0x22			
>>>>>>>(1.b+9)	ubyte		0xc0			
>>>>>>>>(1.b+10)	ubyte	0x74			
>>>>>>>>>(1.b+11)	ubyte	0xb			
>>>>>>>>>>(1.b+12)	ubyte	0x56			
>>>>>>>>>>(1.b+13)	ubyte	0xb4			\b, mkdosfs boot message display
>214	string	Please\ try\ to\ install\ FreeDOS\ 	\b, DOS Emulator boot message display
#>>244	string	from\ dosemu-freedos-*-bin.tgz\r	
#>>>170	string	Sorry,\ could\ not\ load\ an\ 		
#>>>>195	string	operating\ system.\r\n		
#
>103	string	This\ is\ not\ a\ bootable\ disk.\ 	
>>132	string	Please\ insert\ a\ bootable\ 		
>>>157	string	floppy\ and\r\n				
>>>>169	string	press\ any\ key\ to\ try\ again...\r	\b, FREE-DOS message display
#
>66	string	Solaris\ Boot\ Sector    		
>>99	string	Incomplete\ MDBoot\ load.		
>>>89	string	Version 				\b, Sun Solaris Bootloader
>>>>97	byte	x					version %c
#
>408	string	OS/2\ !!\ SYS01475\r\0			
>>429	string	OS/2\ !!\ SYS02025\r\0			
>>>450	string	OS/2\ !!\ SYS02027\r\0			
>>>469	string	OS2BOOT\ \ \ \ 				\b, IBM OS/2 Warp bootloader
#
>409	string	OS/2\ !!\ SYS01475\r\0			
>>430	string	OS/2\ !!\ SYS02025\r\0			
>>>451	string	OS/2\ !!\ SYS02027\r\0			
>>>470	string	OS2BOOT\ \ \ \ 				\b, IBM OS/2 Warp Bootloader
>112		string	This\ disk\ is\ not\ bootable\r			
>>142		string	If\ you\ wish\ to\ make\ it\ bootable		
>>>176		string	run\ the\ DOS\ program\ SYS\  			
>>>200		string	after\ the\r					
>>>>216		string	system\ has\ been\ loaded\r\n			
>>>>>242	string	Please\ insert\ a\ DOS\ diskette\ 		
>>>>>271	string	into\r\n\ the\ drive\ and\ 			
>>>>>>292	string	strike\ any\ key...\0		\b, IBM OS/2 Warp message display
# XP
>430	string	NTLDR\ is\ missing\xFF\r\n		
>>449	string	Disk\ error\xFF\r\n			
>>>462	string	Press\ any\ key\ to\ restart\r		\b, Microsoft Windows XP Bootloader
# DOS names like NTLDR,CMLDR,$LDR$ are 8 right space padded bytes+3 bytes
>>>>417		ubyte&0xDF	>0			
>>>>>417	string		x			%-.5s
>>>>>>422	ubyte&0xDF	>0			
>>>>>>>422	string		x 			\b%-.3s
>>>>>425	ubyte&0xDF	>0			
>>>>>>425	string		>\ 			\b.%-.3s
#
>>>>371		ubyte		>0x20			
>>>>>368	ubyte&0xDF	>0			
>>>>>>368	string		x 			%-.5s
>>>>>>>373	ubyte&0xDF	>0			
>>>>>>>>373	string		x 			\b%-.3s
>>>>>>376	ubyte&0xDF	>0			
>>>>>>>376	string		x 			\b.%-.3s
#
>430	string	NTLDR\ nicht\ gefunden\xFF\r\n		
>>453	string	Datentr\204gerfehler\xFF\r\n		
>>>473	string	Neustart\ mit\ beliebiger\ Taste\r	\b, Microsoft Windows XP Bootloader (german)
>>>>417		ubyte&0xDF	>0			
>>>>>417	string		x			%-.5s
>>>>>>422	ubyte&0xDF	>0			
>>>>>>>422	string		x 			\b%-.3s
>>>>>425	ubyte&0xDF	>0			
>>>>>>425	string		>\ 			\b.%-.3s
# offset variant
>>>>379	string	\0					
>>>>>368	ubyte&0xDF	>0			
>>>>>>368	string		x 			%-.5s
>>>>>>>373	ubyte&0xDF	>0			
>>>>>>>>373	string		x 			\b%-.3s
#
>430	string	NTLDR\ fehlt\xFF\r\n			
>>444	string	Datentr\204gerfehler\xFF\r\n		
>>>464	string	Neustart\ mit\ beliebiger\ Taste\r	\b, Microsoft Windows XP Bootloader (2.german)
>>>>417		ubyte&0xDF	>0			
>>>>>417	string		x			%-.5s
>>>>>>422	ubyte&0xDF	>0			
>>>>>>>422	string		x 			\b%-.3s
>>>>>425	ubyte&0xDF	>0			
>>>>>>425	string		>\ 			\b.%-.3s
# variant
>>>>371		ubyte		>0x20			
>>>>>368	ubyte&0xDF	>0			
>>>>>>368	string		x 			%-.5s
>>>>>>>373	ubyte&0xDF	>0			
>>>>>>>>373	string		x 			\b%-.3s
>>>>>>376	ubyte&0xDF	>0			
>>>>>>>376	string		x 			\b.%-.3s
#
>430	string	NTLDR\ fehlt\xFF\r\n			
>>444	string	Medienfehler\xFF\r\n			
>>>459	string	Neustart:\ Taste\ dr\201cken\r		\b, Microsoft Windows XP Bootloader (3.german)
>>>>371		ubyte		>0x20			
>>>>>368	ubyte&0xDF	>0			
>>>>>>368	string		x 			%-.5s
>>>>>>>373	ubyte&0xDF	>0			
>>>>>>>>373	string		x 			\b%-.3s
>>>>>>376	ubyte&0xDF	>0			
>>>>>>>376	string		x 			\b.%-.3s
# variant
>>>>417		ubyte&0xDF	>0			
>>>>>417	string		x			%-.5s
>>>>>>422	ubyte&0xDF	>0			
>>>>>>>422	string		x 			\b%-.3s
>>>>>425	ubyte&0xDF	>0			
>>>>>>425	string		>\ 			\b.%-.3s
#
>430	string	Datentr\204ger\ entfernen\xFF\r\n	
>>454	string	Medienfehler\xFF\r\n			
>>>469	string	Neustart:\ Taste\ dr\201cken\r		\b, Microsoft Windows XP Bootloader (4.german)
>>>>379		string		\0			
>>>>>368	ubyte&0xDF	>0			
>>>>>>368	string		x 			%-.5s
>>>>>>>373	ubyte&0xDF	>0			
>>>>>>>>373	string		x 			\b%-.3s
>>>>>>376	ubyte&0xDF	>0			
>>>>>>>376	string		x 			\b.%-.3s
# variant
>>>>417		ubyte&0xDF	>0			
>>>>>417	string		x			%-.5s
>>>>>>422	ubyte&0xDF	>0			
>>>>>>>422	string		x 			\b%-.3s
>>>>>425	ubyte&0xDF	>0			
>>>>>>425	string		>\ 			\b.%-.3s
#

#>3	string	NTFS\ \ \ \ 				
>389	string	Fehler\ beim\ Lesen\ 
>>407	string	des\ Datentr\204gers
>>>426	string	NTLDR\ fehlt				
>>>>440	string	NTLDR\ ist\ komprimiert
>>>>>464 string	Neustart\ mit\ Strg+Alt+Entf\r		\b, Microsoft Windows XP Bootloader NTFS (german)
#>3	string	NTFS\ \ \ \ 				
>313	string	A\ disk\ read\ error\ occurred.\r
>>345	string	A\ kernel\ file\ is\ missing\ 	
>>>370	string	from\ the\ disk.\r		
>>>>484	string	NTLDR\ is\ compressed		
>>>>>429 string	Insert\ a\ system\ diskette\ 	
>>>>>>454 string and\ restart\r\nthe\ system.\r		\b, Microsoft Windows XP Bootloader NTFS
# DOS loader variants different languages,offsets
>472	ubyte&0xDF	>0
>>389	string	Invalid\ system\ disk\xFF\r\n		
>>>411	string	Disk\ I/O\ error			
>>>>428	string	Replace\ the\ disk,\ and\ 		
>>>>>455 string	press\ any\ key				\b, Microsoft Windows 98 Bootloader
#IO.SYS
>>>>>>472	ubyte&0xDF	>0			
>>>>>>>472	string		x 			\b %-.2s
>>>>>>>>474	ubyte&0xDF	>0			
>>>>>>>>>474	string		x 			\b%-.5s
>>>>>>>>>>479	ubyte&0xDF	>0			
>>>>>>>>>>>479 string		x 			\b%-.1s
>>>>>>>480	ubyte&0xDF	>0			
>>>>>>>>480	string		x 			\b.%-.3s
#MSDOS.SYS
>>>>>>>483	ubyte&0xDF	>0			\b+
>>>>>>>>483	string		x 			\b%-.5s
>>>>>>>>>488	ubyte&0xDF	>0			
>>>>>>>>>>488	string		x 			\b%-.3s
>>>>>>>>491	ubyte&0xDF	>0			
>>>>>>>>>491	string		x 			\b.%-.3s
#
>>390	string	Invalid\ system\ disk\xFF\r\n		
>>>412	string	Disk\ I/O\ error\xFF\r\n		
>>>>429	string	Replace\ the\ disk,\ and\ 		
>>>>>451 string	then\ press\ any\ key\r			\b, Microsoft Windows 98 Bootloader
>>388	string	Ungueltiges\ System\ \xFF\r\n		
>>>410	string	E/A-Fehler\ \ \ \ \xFF\r\n		
>>>>427	string	Datentraeger\ wechseln\ und\ 		
>>>>>453 string	Taste\ druecken\r			\b, Microsoft Windows 95/98/ME Bootloader (german)
#WINBOOT.SYS only not spaces (0xDF)
>>>>>>497	ubyte&0xDF	>0			
>>>>>>>497	string		x 			%-.5s
>>>>>>>>502	ubyte&0xDF	>0			
>>>>>>>>>502	string		x 			\b%-.1s
>>>>>>>>>>503	ubyte&0xDF	>0			
>>>>>>>>>>>503	string		x 			\b%-.1s
>>>>>>>>>>>>504	ubyte&0xDF	>0			
>>>>>>>>>>>>>504 string		x 			\b%-.1s
>>>>>>505	ubyte&0xDF	>0			
>>>>>>>505	string		x 			\b.%-.3s
#IO.SYS
>>>>>>472	ubyte&0xDF	>0			or
>>>>>>>472	string		x 			\b %-.2s
>>>>>>>>474	ubyte&0xDF	>0			
>>>>>>>>>474	string		x 			\b%-.5s
>>>>>>>>>>479	ubyte&0xDF	>0			
>>>>>>>>>>>479 string		x 			\b%-.1s
>>>>>>>480	ubyte&0xDF	>0			
>>>>>>>>480	string		x 			\b.%-.3s
#MSDOS.SYS
>>>>>>>483	ubyte&0xDF	>0			\b+
>>>>>>>>483	string		x 			\b%-.5s
>>>>>>>>>488	ubyte&0xDF	>0			
>>>>>>>>>>488	string		x 			\b%-.3s
>>>>>>>>491	ubyte&0xDF	>0			
>>>>>>>>>491	string		x 			\b.%-.3s
#
>>390	string	Ungueltiges\ System\ \xFF\r\n		
>>>412	string	E/A-Fehler\ \ \ \ \xFF\r\n		
>>>>429	string	Datentraeger\ wechseln\ und\ 		
>>>>>455 string	Taste\ druecken\r			\b, Microsoft Windows 95/98/ME Bootloader (German)
#WINBOOT.SYS only not spaces (0xDF)
>>>>>>497	ubyte&0xDF	>0			
>>>>>>>497	string		x 			%-.7s
>>>>>>>>504	ubyte&0xDF	>0			
>>>>>>>>>504	string		x 			\b%-.1s
>>>>>>505	ubyte&0xDF	>0			
>>>>>>>505	string		x 			\b.%-.3s
#IO.SYS
>>>>>>472	ubyte&0xDF	>0			or
>>>>>>>472	string		x 			\b %-.2s
>>>>>>>>474	ubyte&0xDF	>0			
>>>>>>>>>474	string		x 			\b%-.6s
>>>>>>>480	ubyte&0xDF	>0			
>>>>>>>>480	string		x 			\b.%-.3s
#MSDOS.SYS
>>>>>>>483	ubyte&0xDF	>0			\b+
>>>>>>>>483	string		x 			\b%-.5s
>>>>>>>>>488	ubyte&0xDF	>0			
>>>>>>>>>>488	string		x 			\b%-.3s
>>>>>>>>491	ubyte&0xDF	>0			
>>>>>>>>>491	string		x 			\b.%-.3s
#
>>389	string	Ungueltiges\ System\ \xFF\r\n		
>>>411	string	E/A-Fehler\ \ \ \ \xFF\r\n		
>>>>428	string	Datentraeger\ wechseln\ und\ 		
>>>>>454 string	Taste\ druecken\r			\b, Microsoft Windows 95/98/ME Bootloader (GERMAN)
# DOS names like IO.SYS,WINBOOT.SYS,MSDOS.SYS,WINBOOT.INI are 8 right space padded bytes+3 bytes
>>>>>>472	string		x 			%-.2s
>>>>>>>474	ubyte&0xDF	>0			
>>>>>>>>474	string		x 			\b%-.5s
>>>>>>>>479	ubyte&0xDF	>0			
>>>>>>>>>479	string		x 			\b%-.1s
>>>>>>480	ubyte&0xDF	>0			
>>>>>>>480	string		x 			\b.%-.3s
>>>>>>483	ubyte&0xDF	>0			\b+
>>>>>>>483	string		x 			\b%-.5s
>>>>>>>488	ubyte&0xDF	>0			
>>>>>>>>488	string		x 			\b%-.2s
>>>>>>>>490	ubyte&0xDF	>0			
>>>>>>>>>490	string		x 			\b%-.1s
>>>>>>>491	ubyte&0xDF	>0			
>>>>>>>>491	string		x 			\b.%-.3s
>479	ubyte&0xDF	>0
>>416	string	Kein\ System\ oder\ 			
>>>433	string	Laufwerksfehler				
>>>>450	string	Wechseln\ und\ Taste\ dr\201cken	\b, Microsoft DOS Bootloader (german)
#IO.SYS
>>>>>479	string		x 			\b %-.2s
>>>>>>481	ubyte&0xDF	>0			
>>>>>>>481	string		x 			\b%-.6s
>>>>>487	ubyte&0xDF	>0			
>>>>>>487	string		x 			\b.%-.3s
#MSDOS.SYS
>>>>>>490	ubyte&0xDF	>0			\b+
>>>>>>>490	string		x 			\b%-.5s
>>>>>>>>495	ubyte&0xDF	>0			
>>>>>>>>>495	string		x 			\b%-.3s
>>>>>>>498	ubyte&0xDF	>0			
>>>>>>>>498	string		x 			\b.%-.3s
#
>376	search/41	Non-System\ disk\ or\ 		
>>395	search/41	disk\ error\r			
>>>407	search/41	Replace\ and\ 			
>>>>419	search/41	press\ 				\b,
>>>>419	search/41	strike\ 			\b, old
>>>>426	search/41	any\ key\ when\ ready\r		MS or PC-DOS bootloader
#449			Disk\ Boot\ failure\r		MS 3.21
#466			Boot\ Failure\r			MS 3.30
>>>>>468 search/18	\0				
#IO.SYS,IBMBIO.COM
>>>>>>&0	string		x 			\b %-.2s
>>>>>>>&-20	ubyte&0xDF	>0			
>>>>>>>>&-1	string		x 			\b%-.4s
>>>>>>>>>&-16	ubyte&0xDF	>0			
>>>>>>>>>>&-1	string		x 			\b%-.2s
>>>>>>&8	ubyte&0xDF	>0			\b.
>>>>>>>&-1	string		x 			\b%-.3s
#MSDOS.SYS,IBMDOS.COM
>>>>>>&11	ubyte&0xDF	>0			\b+
>>>>>>>&-1	string		x 			\b%-.5s
>>>>>>>>&-6	ubyte&0xDF	>0			
>>>>>>>>>&-1	string		x 			\b%-.1s
>>>>>>>>>>&-5	ubyte&0xDF	>0			
>>>>>>>>>>>&-1	string		x 			\b%-.2s
>>>>>>>&7	ubyte&0xDF	>0			\b.
>>>>>>>>&-1	string		x 			\b%-.3s
>441	string	Cannot\ load\ from\ harddisk.\n\r
>>469	string	Insert\ Systemdisk\ 			
>>>487	string	and\ press\ any\ key.\n\r		\b, MS (2.11) DOS bootloader
#>43	string	\224R-LOADER\ \ SYS			=label					
>54	string	SYS
>>324	string	VASKK
>>>495	string	NEWLDR\0				\b, DR-DOS Bootloader (LOADER.SYS)
#
>98	string	Press\ a\ key\ to\ retry\0\r		
>>120	string	Cannot\ find\ file\ \0\r		
>>>139	string	Disk\ read\ error\0\r			
>>>>156	string	Loading\ ...\0				\b, DR-DOS (3.41) Bootloader
#DRBIOS.SYS
>>>>>44		ubyte&0xDF	>0			
>>>>>>44	string		x			\b %-.6s
>>>>>>>50	ubyte&0xDF	>0			
>>>>>>>>50	string		x 			\b%-.2s
>>>>>>52	ubyte&0xDF	>0			
>>>>>>>52	string		x 			\b.%-.3s
#
>70	string	IBMBIO\ \ COM				
>>472	string	Cannot\ load\ DOS!\ 			
>>>489	string	Any\ key\ to\ retry			\b, DR-DOS Bootloader
>>471	string	Cannot\ load\ DOS\ 			
>>487	string	press\ key\ to\ retry			\b, Open-DOS Bootloader
#??
>444	string	KERNEL\ \ SYS					
>>314	string	BOOT\ error!				\b, FREE-DOS Bootloader
>499	string	KERNEL\ \ SYS				
>>305	string	BOOT\ err!\0				\b, Free-DOS Bootloader
>449	string	KERNEL\ \ SYS				
>>319	string	BOOT\ error!				\b, FREE-DOS 0.5 Bootloader
#
>449	string	Loading\ FreeDOS			
>>0x1AF		ulelong		>0			\b, FREE-DOS 0.95,1.0 Bootloader
>>>497		ubyte&0xDF	>0			
>>>>497		string		x 			\b %-.6s
>>>>>503	ubyte&0xDF	>0			
>>>>>>503	string		x 			\b%-.1s
>>>>>>>504	ubyte&0xDF	>0			
>>>>>>>>504	string		x 			\b%-.1s
>>>>505		ubyte&0xDF	>0			
>>>>>505	string		x 			\b.%-.3s
#
>331	string	Error!.0				\b, FREE-DOS 1.0 bootloader
#
>125	string	Loading\ FreeDOS...\r			
>>311	string	BOOT\ error!\r				\b, FREE-DOS bootloader
>>>441		ubyte&0xDF	>0			
>>>>441		string		x 			\b %-.6s
>>>>>447	ubyte&0xDF	>0			
>>>>>>447	string		x 			\b%-.1s
>>>>>>>448	ubyte&0xDF	>0			
>>>>>>>>448	string		x 			\b%-.1s
>>>>449		ubyte&0xDF	>0			
>>>>>449	string		x 			\b.%-.3s
>124	string	FreeDOS\0				
>>331	string	\ err\0					\b, FREE-DOS BETa 0.9 Bootloader
# DOS names like KERNEL.SYS,KERNEL16.SYS,KERNEL32.SYS,METAKERN.SYS are 8 right space padded bytes+3 bytes
>>>497		ubyte&0xDF	>0			
>>>>497		string		x 			\b %-.6s
>>>>>503	ubyte&0xDF	>0			
>>>>>>503	string		x 			\b%-.1s
>>>>>>>504	ubyte&0xDF	>0			
>>>>>>>>504	string		x 			\b%-.1s
>>>>505		ubyte&0xDF	>0			
>>>>>505	string		x 			\b.%-.3s
>>333	string	\ err\0					\b, FREE-DOS BEta 0.9 Bootloader
>>>497		ubyte&0xDF	>0			
>>>>497		string		x 			\b %-.6s
>>>>>503	ubyte&0xDF	>0			
>>>>>>503	string		x 			\b%-.1s
>>>>>>>504	ubyte&0xDF	>0			
>>>>>>>>504	string		x 			\b%-.1s
>>>>505		ubyte&0xDF	>0			
>>>>>505	string		x 			\b.%-.3s
>>334	string	\ err\0					\b, FREE-DOS Beta 0.9 Bootloader
>>>497		ubyte&0xDF	>0			
>>>>497		string		x 			\b %-.6s
>>>>>503	ubyte&0xDF	>0			
>>>>>>503	string		x 			\b%-.1s
>>>>>>>504	ubyte&0xDF	>0			
>>>>>>>>504	string		x 			\b%-.1s
>>>>505		ubyte&0xDF	>0			
>>>>>505	string		x 			\b.%-.3s
>336	string	Error!\ 				
>>343	string	Hit\ a\ key\ to\ reboot.		\b, FREE-DOS Beta 0.9sr1 Bootloader
>>>497		ubyte&0xDF	>0			
>>>>497		string		x 			\b %-.6s
>>>>>503	ubyte&0xDF	>0			
>>>>>>503	string		x 			\b%-.1s
>>>>>>>504	ubyte&0xDF	>0			
>>>>>>>>504	string		x 			\b%-.1s
>>>>505		ubyte&0xDF	>0			
>>>>>505	string		x 			\b.%-.3s
# added by Joerg Jenderek
# http://www.visopsys.org/
# http://partitionlogic.org.uk/
# OEM-ID=Visopsys
>478		ulelong	0					
>>(1.b+326)	string	I/O\ Error\ reading\ 			
>>>(1.b+344)	string	Visopsys\ loader\r			
>>>>(1.b+361)	string	Press\ any\ key\ to\ continue.\r	\b, Visopsys loader
# http://alexfru.chat.ru/epm.html#bootprog
>494	ubyte	>0x4D					
>>495	string	>E					
>>>495	string	<S					
#OEM-ID is not reliable
>>>>3	string	BootProg				
# It just looks for a program file name at the root directory
# and loads corresponding file with following execution.
# DOS names like STARTUP.BIN,STARTUPC.COM,STARTUPE.EXE are 8 right space padded bytes+3 bytes
>>>>499			ubyte&0xDF	>0		\b, COM/EXE Bootloader
>>>>>499		string		x 		\b %-.1s
>>>>>>500		ubyte&0xDF	>0		
>>>>>>>500		string		x 		\b%-.1s
>>>>>>>>501		ubyte&0xDF	>0		
>>>>>>>>>501		string		x 		\b%-.1s
>>>>>>>>>>502		ubyte&0xDF	>0		
>>>>>>>>>>>502		string		x 		\b%-.1s
>>>>>>>>>>>>503		ubyte&0xDF	>0		
>>>>>>>>>>>>>503	string		x 		\b%-.1s
>>>>>>>>>>>>>>504	ubyte&0xDF	>0		
>>>>>>>>>>>>>>>504	string		x 		\b%-.1s
>>>>>>>>>>>>>>>>505	ubyte&0xDF	>0		
>>>>>>>>>>>>>>>>>505	string		x 		\b%-.1s
>>>>>>>>>>>>>>>>>>506	ubyte&0xDF	>0		
>>>>>>>>>>>>>>>>>>>506	string		x 		\b%-.1s
#name extension
>>>>>507		ubyte&0xDF	>0		\b.
>>>>>>507		string		x 		\b%-.1s
>>>>>>>508		ubyte&0xDF	>0		
>>>>>>>>508		string		x 		\b%-.1s
>>>>>>>>>509		ubyte&0xDF	>0		
>>>>>>>>>>509		string		x 		\b%-.1s
#If the boot sector fails to read any other sector,
#it prints a very short message ("RE") to the screen and hangs the computer.
#If the boot sector fails to find needed program in the root directory,
#it also hangs with another message ("NF").
>>>>>492		string		RENF		\b, FAT (12 bit)
>>>>>495		string		RENF		\b, FAT (16 bit)
# http://alexfru.chat.ru/epm.html#bootprog
>494	ubyte	>0x4D					
>>495	string	>E					
>>>495	string	<S					
#OEM-ID is not reliable
>>>>3	string	BootProg				
# It just looks for a program file name at the root directory
# and loads corresponding file with following execution.
# DOS names like STARTUP.BIN,STARTUPC.COM,STARTUPE.EXE are 8 right space padded bytes+3 bytes
>>>>499			ubyte&0xDF	>0		\b, COM/EXE Bootloader
>>>>>499		string		x 		\b %-.1s
>>>>>>500		ubyte&0xDF	>0		
>>>>>>>500		string		x 		\b%-.1s
>>>>>>>>501		ubyte&0xDF	>0		
>>>>>>>>>501		string		x 		\b%-.1s
>>>>>>>>>>502		ubyte&0xDF	>0		
>>>>>>>>>>>502		string		x 		\b%-.1s
>>>>>>>>>>>>503		ubyte&0xDF	>0		
>>>>>>>>>>>>>503	string		x 		\b%-.1s
>>>>>>>>>>>>>>504	ubyte&0xDF	>0		
>>>>>>>>>>>>>>>504	string		x 		\b%-.1s
>>>>>>>>>>>>>>>>505	ubyte&0xDF	>0		
>>>>>>>>>>>>>>>>>505	string		x 		\b%-.1s
>>>>>>>>>>>>>>>>>>506	ubyte&0xDF	>0		
>>>>>>>>>>>>>>>>>>>506	string		x 		\b%-.1s
#name extension
>>>>>507		ubyte&0xDF	>0		\b.
>>>>>>507		string		x 		\b%-.1s
>>>>>>>508		ubyte&0xDF	>0		
>>>>>>>>508		string		x 		\b%-.1s
>>>>>>>>>509		ubyte&0xDF	>0		
>>>>>>>>>>509		string		x 		\b%-.1s
#If the boot sector fails to read any other sector,
#it prints a very short message ("RE") to the screen and hangs the computer.
#If the boot sector fails to find needed program in the root directory,
#it also hangs with another message ("NF").
>>>>>492		string		RENF		\b, FAT (12 bit)
>>>>>495		string		RENF		\b, FAT (16 bit)
# x86 bootloader end
# updated by Joerg Jenderek at Sep 2007
>3	ubyte	0			
#no active flag
>>446	ubyte	0			
# partition 1 not empty
>>>450	ubyte	>0			
# partitions 3,4 empty
>>>>482		ubyte	0			
>>>>>498	ubyte	0			
# partition 2 ID=0,5,15
>>>>>>466	ubyte	<0x10			
>>>>>>>466	ubyte	0x05			\b, extended partition table
>>>>>>>466	ubyte	0x0F			\b, extended partition table (LBA)
>>>>>>>466	ubyte	0x0			\b, extended partition table (last)	
# JuMP short     bootcodeoffset NOP assembler instructions will usually be EB xx 90
# http://mirror.href.com/thestarman/asm/2bytejumps.htmm#FWD
# older drives may use Near JuMP instruction E9 xx xx
>0		lelong&0x009000EB	0x009000EB 
>0		lelong&0x000000E9	0x000000E9 
# minimal short forward jump found 03cx??
# maximal short forward jump is 07fx
>1		ubyte			<0xff	\b, code offset 0x%x
# mtools-3.9.8/msdos.h
# usual values are marked with comments to get only informations of strange FAT systems
# valid sectorsize must be a power of 2 from 32 to 32768
>>11		uleshort&0x000f	x		
>>>11		uleshort	<32769		
>>>>11		uleshort	>31		
>>>>>21		ubyte&0xf0	0xF0		
>>>>>>3		string		>\0		\b, OEM-ID "%8.8s"
#http://mirror.href.com/thestarman/asm/debug/debug2.htm#IHC
>>>>>>>8	string		IHC		\b cached by Windows 9M
>>>>>>11	uleshort	>512		\b, Bytes/sector %u
#>>>>>>11	uleshort	=512		\b, Bytes/sector %u=512 (usual)
>>>>>>11	uleshort	<512		\b, Bytes/sector %u
>>>>>>13	ubyte		>1		\b, sectors/cluster %u
#>>>>>>13	ubyte		=1		\b, sectors/cluster %u (usual on Floppies)
>>>>>>14	uleshort	>32		\b, reserved sectors %u
#>>>>>>14	uleshort	=32		\b, reserved sectors %u (usual Fat32)
#>>>>>>14	uleshort	>1		\b, reserved sectors %u
#>>>>>>14	uleshort	=1		\b, reserved sectors %u (usual FAT12,FAT16)
>>>>>>14	uleshort	<1		\b, reserved sectors %u
>>>>>>16	ubyte		>2		\b, FATs %u
#>>>>>>16	ubyte		=2		\b, FATs %u (usual)
>>>>>>16	ubyte		=1		\b, FAT  %u
>>>>>>16	ubyte		>0
>>>>>>17	uleshort	>0		\b, root entries %u
#>>>>>>17	uleshort	=0		\b, root entries %u=0 (usual Fat32)
>>>>>>19	uleshort	>0		\b, sectors %u (volumes <=32 MB) 
#>>>>>>19	uleshort	=0		\b, sectors %u=0 (usual Fat32)
>>>>>>21	ubyte		>0xF0		\b, Media descriptor 0x%x
#>>>>>>21	ubyte		=0xF0		\b, Media descriptor 0x%x (usual floppy)
>>>>>>21	ubyte		<0xF0		\b, Media descriptor 0x%x
>>>>>>22	uleshort	>0		\b, sectors/FAT %u
#>>>>>>22	uleshort	=0		\b, sectors/FAT %u=0 (usual Fat32)
>>>>>>26	ubyte		>2		\b, heads %u
#>>>>>>26	ubyte		=2		\b, heads %u (usual floppy)
>>>>>>26	ubyte		=1		\b, heads %u
#skip for Digital Research DOS (version 3.41) 1440 kB Bootdisk
>>>>>>38	ubyte		!0x70		
>>>>>>>28	ulelong		>0		\b, hidden sectors %u
#>>>>>>>28	ulelong		=0		\b, hidden sectors %u (usual floppy)
>>>>>>>32	ulelong		>0		\b, sectors %u (volumes > 32 MB) 
#>>>>>>>32	ulelong		=0		\b, sectors %u (volumes > 32 MB)
# FAT<32 specific 
>>>>>>82	string		!FAT32
#>>>>>>>36	ubyte		0x80		\b, physical drive 0x%x=0x80 (usual harddisk)
#>>>>>>>36	ubyte		0		\b, physical drive 0x%x=0 (usual floppy)
>>>>>>>36	ubyte		!0x80		
>>>>>>>>36	ubyte		!0		\b, physical drive 0x%x
>>>>>>>37	ubyte		>0		\b, reserved 0x%x
#>>>>>>>37	ubyte		=0		\b, reserved 0x%x
>>>>>>>38	ubyte		>0x29		\b, dos < 4.0 BootSector (0x%x)
>>>>>>>38	ubyte		<0x29		\b, dos < 4.0 BootSector (0x%x)
>>>>>>>38	ubyte		=0x29
>>>>>>>>39	ulelong		x		\b, serial number 0x%x
>>>>>>>>43	string		<NO\ NAME	\b, label: "%11.11s"
>>>>>>>>43	string		>NO\ NAME	\b, label: "%11.11s"
>>>>>>>>43	string		=NO\ NAME	\b, unlabeled
>>>>>>>54	string		FAT		\b, FAT
>>>>>>>>54	string		FAT12		\b (12 bit)
>>>>>>>>54	string		FAT16		\b (16 bit)
# FAT32 specific
>>>>>>82	string		FAT32		\b, FAT (32 bit)
>>>>>>>36	ulelong		x		\b, sectors/FAT %u
>>>>>>>40	uleshort	>0		\b, extension flags %u
#>>>>>>>40	uleshort	=0		\b, extension flags %u
>>>>>>>42	uleshort	>0		\b, fsVersion %u
#>>>>>>>42	uleshort	=0		\b, fsVersion %u (usual)
>>>>>>>44	ulelong		>2		\b, rootdir cluster %u
#>>>>>>>44	ulelong		=2		\b, rootdir cluster %u
#>>>>>>>44	ulelong		=1		\b, rootdir cluster %u
>>>>>>>48	uleshort	>1		\b, infoSector %u
#>>>>>>>48	uleshort	=1		\b, infoSector %u (usual)
>>>>>>>48	uleshort	<1		\b, infoSector %u
>>>>>>>50	uleshort	>6		\b, Backup boot sector %u
#>>>>>>>50	uleshort	=6		\b, Backup boot sector %u (usual) 
>>>>>>>50	uleshort	<6		\b, Backup boot sector %u
>>>>>>>54	ulelong		>0		\b, reserved1 0x%x
>>>>>>>58	ulelong		>0		\b, reserved2 0x%x
>>>>>>>62	ulelong		>0		\b, reserved3 0x%x
# same structure as FAT1X 
>>>>>>>64	ubyte		>0x80		\b, physical drive 0x%x
#>>>>>>>64	ubyte		=0x80		\b, physical drive 0x%x=80 (usual harddisk)
>>>>>>>64	ubyte&0x7F	>0		\b, physical drive 0x%x
#>>>>>>>64	ubyte		=0		\b, physical drive 0x%x=0 (usual floppy)
>>>>>>>65	ubyte		>0		\b, reserved 0x%x
>>>>>>>66	ubyte		>0x29		\b, dos < 4.0 BootSector (0x%x)
>>>>>>>66	ubyte		<0x29		\b, dos < 4.0 BootSector (0x%x)
>>>>>>>66	ubyte		=0x29
>>>>>>>>67	ulelong		x		\b, serial number 0x%x
>>>>>>>>71	string		<NO\ NAME	\b, label: "%11.11s"
>>>>>>>71	string		>NO\ NAME	\b, label: "%11.11s"
>>>>>>>71	string		=NO\ NAME	\b, unlabeled
### FATs end
>0x200	lelong	0x82564557		\b, BSD disklabel


