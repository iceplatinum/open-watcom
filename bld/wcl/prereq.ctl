# wcl Builder Control file
# ==========================

set PROJDIR=<CWD>

[ INCLUDE <OWROOT>/bat/master.ctl ]
[ LOG <LOGFNAME>.<LOGEXT> ]

cdsay .

set TMP_BUILD_PLATFORM=<BUILD_PLATFORM>

[ BLOCK <BUILD_PLATFORM> dos386 os2386 nt386 linux386 ]
#======================================================
    cd 386

[ BLOCK <BUILD_PLATFORM> ntaxp ]
#===============================
    cd axp

[ BLOCK . . ]
#============

[ BLOCK <OWLINUXBUILD> bootstrap ]
#=================================
    set BUILD_PLATFORM=<BUILD_PLATFORM>boot

[ BLOCK <1> clean ]
#==================
    echo rm -f -r <PREOBJDIR>
    rm -f -r <PREOBJDIR>
    rm -f <OWBINDIR>/bwcl386<CMDEXT>
    rm -f <OWBINDIR>/wcl386<CMDEXT>
    set BUILD_PLATFORM=

[ BLOCK <BUILD_PLATFORM> dos386 ]
#================================
    mkdir <PREOBJDIR>
    cdsay <PREOBJDIR>
    wmake -h -f ../dosi86/makefile prebuild=1
    <CPCMD> wcl386.exe <OWBINDIR>/bwcl386<CMDEXT>

[ BLOCK <BUILD_PLATFORM> os2386 nt386 linux386 ]
#===============================================
    mkdir <PREOBJDIR>
    cdsay <PREOBJDIR>
    wmake -h -f ../<BUILD_PLATFORM>/makefile prebuild=1
    <CPCMD> wcl386.exe <OWBINDIR>/bwcl386<CMDEXT>

[ BLOCK <BUILD_PLATFORM> ntaxp ]
#===============================
    mkdir <PREOBJDIR>
    cdsay <PREOBJDIR>
    wmake -h -f ../<BUILD_PLATFORM>/makefile prebuild=1
    <CPCMD> wclaxp.exe <OWBINDIR>/bwclaxp<CMDEXT>

[ BLOCK <BUILD_PLATFORM> linux386boot ]
#======================================
    echo Building the wcl bootstrap
    mkdir <OBJDIR>
    cdsay <OBJDIR>
    wmake -h -f ../linux386/makefile bootstrap=1
    <CPCMD> wcl386.exe <OWBINDIR>/bwcl386<CMDEXT>
    <CPCMD> wcl386.exe <OWBINDIR>/wcl386<CMDEXT>

[ BLOCK . . ]
#==================
set BUILD_PLATFORM=<TMP_BUILD_PLATFORM>
set TMP_BUILD_PLATFORM=

cdsay <PROJDIR>
