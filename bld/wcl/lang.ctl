# wcl Builder Control file
# ========================

set PROJDIR=<CWD>

[ INCLUDE <OWROOT>/bat/master.ctl ]
[ LOG <LOGFNAME>.<LOGEXT> ]

cdsay .

[ BLOCK <1> build rel2 ]
#=======================
    echo wsplice -k Pspecs <OWROOT>/bld/wl/specs.sp specs.owc
    wsplice -k Pspecs <OWROOT>/bld/wl/specs.sp specs.owc
    pmake -d build <2> <3> <4> <5> <6> <7> <8> <9> -h

[ BLOCK <1> rel2 ]
#=================
    cdsay <PROJDIR>

[ BLOCK <1> rel2 cprel2 acprel2 ]
#================================

    <CPCMD> specs.owc                 <RELROOT>/binw/specs.owc
    
  [ IFDEF (os_dos "") <2*> ]
    <CPCMD> owcc/dosi86/owcc.exe      <RELROOT>/binw/owcc.exe
    <CPCMD> owcc/dosi86/owcc.sym      <RELROOT>/binw/owcc.sym
    <CPCMD> i86/dosi86/wcl.exe        <RELROOT>/binw/wcl.exe
    <CPCMD> i86/dosi86/wcl.sym        <RELROOT>/binw/wcl.sym
    <CPCMD> 386/dosi86/wcl386.exe     <RELROOT>/binw/wcl386.exe
    <CPCMD> 386/dosi86/wcl386.sym     <RELROOT>/binw/wcl386.sym
    <CPCMD> axp/dosi86/wclaxp.exe     <RELROOT>/binw/wclaxp.exe
    <CPCMD> axp/dosi86/wclaxp.sym     <RELROOT>/binw/wclaxp.sym
    <CPCMD> ppc/dosi86/wclppc.exe     <RELROOT>/binw/wclppc.exe
    <CPCMD> ppc/dosi86/wclppc.sym     <RELROOT>/binw/wclppc.sym

  [ IFDEF (os_nt "") <2*> ]
    <CPCMD> owcc/nt386/owcc.exe       <RELROOT>/binnt/owcc.exe
    <CPCMD> owcc/nt386/owcc.sym       <RELROOT>/binnt/owcc.sym
    <CPCMD> i86/nt386/wcl.exe         <RELROOT>/binnt/wcl.exe
    <CPCMD> i86/nt386/wcl.sym         <RELROOT>/binnt/wcl.sym
    <CPCMD> 386/nt386/wcl386.exe      <RELROOT>/binnt/wcl386.exe
    <CPCMD> 386/nt386/wcl386.sym      <RELROOT>/binnt/wcl386.sym
    <CPCMD> axp/nt386/wclaxp.exe      <RELROOT>/binnt/wclaxp.exe
    <CPCMD> axp/nt386/wclaxp.sym      <RELROOT>/binnt/wclaxp.sym
    <CPCMD> ppc/nt386/wclppc.exe      <RELROOT>/binnt/wclppc.exe
    <CPCMD> ppc/nt386/wclppc.sym      <RELROOT>/binnt/wclppc.sym
    <CPCMD> mps/nt386/wclmps.exe      <RELROOT>/binnt/wclmps.exe
    <CPCMD> mps/nt386/wclmps.sym      <RELROOT>/binnt/wclmps.sym

  [ IFDEF (os_os2 "") <2*> ]
    <CPCMD> owcc/os2386/owcc.exe      <RELROOT>/binp/owcc.exe
    <CPCMD> owcc/os2386/owcc.sym      <RELROOT>/binp/owcc.sym
    <CPCMD> i86/os2386/wcl.exe        <RELROOT>/binp/wcl.exe
    <CPCMD> i86/os2386/wcl.sym        <RELROOT>/binp/wcl.sym
    <CPCMD> 386/os2386/wcl386.exe     <RELROOT>/binp/wcl386.exe
    <CPCMD> 386/os2386/wcl386.sym     <RELROOT>/binp/wcl386.sym
    <CPCMD> axp/os2386/wclaxp.exe     <RELROOT>/binp/wclaxp.exe
    <CPCMD> axp/os2386/wclaxp.sym     <RELROOT>/binp/wclaxp.sym
    <CPCMD> ppc/os2386/wclppc.exe     <RELROOT>/binp/wclppc.exe
    <CPCMD> ppc/os2386/wclppc.sym     <RELROOT>/binp/wclppc.sym
    <CPCMD> mps/os2386/wclmps.exe     <RELROOT>/binp/wclmps.exe
    <CPCMD> mps/os2386/wclmps.sym     <RELROOT>/binp/wclmps.sym

  [ IFDEF (os_linux "") <2*> ]
    <CPCMD> specs.owc                 <RELROOT>/binl/specs.owc
    <CPCMD> owcc/linux386/owcc.exe    <RELROOT>/binl/owcc
    <CPCMD> owcc/linux386/owcc.sym    <RELROOT>/binl/owcc.sym
    <CPCMD> i86/linux386/wcl.exe      <RELROOT>/binl/wcl
    <CPCMD> i86/linux386/wcl.sym      <RELROOT>/binl/wcl.sym
    <CPCMD> 386/linux386/wcl386.exe   <RELROOT>/binl/wcl386
    <CPCMD> 386/linux386/wcl386.sym   <RELROOT>/binl/wcl386.sym
    <CPCMD> axp/linux386/wclaxp.exe   <RELROOT>/binl/wclaxp
    <CPCMD> axp/linux386/wclaxp.sym   <RELROOT>/binl/wclaxp.sym
    <CPCMD> mps/linux386/wclmps.exe   <RELROOT>/binl/wclmps
    <CPCMD> mps/linux386/wclmps.sym   <RELROOT>/binl/wclmps.sym

  [ IFDEF (cpu_axp) <2*> ]
    <CPCMD> i86/ntaxp/wcl.exe         <RELROOT>/axpnt/wcl.exe
    <CPCMD> 386/ntaxp/wcl386.exe      <RELROOT>/axpnt/wcl386.exe
    <CPCMD> axp/ntaxp/wclaxp.exe      <RELROOT>/axpnt/wclaxp.exe

[ BLOCK <1> clean ]
#==================
    rm  -f specs.owc
    pmake -d build <2> <3> <4> <5> <6> <7> <8> <9> -h clean

[ BLOCK . . ]
#============

cdsay <PROJDIR>
