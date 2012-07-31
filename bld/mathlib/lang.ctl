# MATHLIB Builder Control file
# ============================

set PROJDIR=<CWD>

[ INCLUDE <OWROOT>/bat/master.ctl ]
[ LOG <LOGFNAME>.<LOGEXT> ]

cdsay .

[ BLOCK <1> build rel2 ]
#=======================
    pmake -d build <2> <3> <4> <5> <6> <7> <8> <9> -h

[ BLOCK <1> rel2 ]
#=================
    cdsay <PROJDIR>

[ BLOCK <1> rel2 cprel2 acprel2 ]
#================================
    <CPCMD> library/msdos.286/mc/mathc.lib          <RELROOT>/lib286/mathc.lib
    <CPCMD> library/msdos.286/mh/mathh.lib          <RELROOT>/lib286/mathh.lib
    <CPCMD> library/msdos.286/ml/mathl.lib          <RELROOT>/lib286/mathl.lib
    <CPCMD> library/msdos.286/mm/mathm.lib          <RELROOT>/lib286/mathm.lib
    <CPCMD> library/msdos.286/ms/maths.lib          <RELROOT>/lib286/maths.lib
    <CPCMD> library/msdos.287/mc/math87c.lib        <RELROOT>/lib286/math87c.lib
    <CPCMD> library/msdos.287/mh/math87h.lib        <RELROOT>/lib286/math87h.lib
    <CPCMD> library/msdos.287/ml/math87l.lib        <RELROOT>/lib286/math87l.lib
    <CPCMD> library/msdos.287/mm/math87m.lib        <RELROOT>/lib286/math87m.lib
    <CPCMD> library/msdos.287/ms/math87s.lib        <RELROOT>/lib286/math87s.lib
    <CPCMD> library/windows.286/mc/mathc.lib        <RELROOT>/lib286/win/mathc.lib
    <CPCMD> library/windows.286/ml/mathl.lib        <RELROOT>/lib286/win/mathl.lib
    <CPCMD> library/windows.287/mc/math87c.lib      <RELROOT>/lib286/win/math87c.lib
    <CPCMD> library/windows.287/ml/math87l.lib      <RELROOT>/lib286/win/math87l.lib

#    <CPCMD> library/msdos.386/ms_r/math3r.lib       <RELROOT>/lib386/math3r.lib
#    <CPCMD> library/msdos.386/ms_rd/math3r.lib      <RELROOT>/lib386/math3rd.lib
#    <CPCMD> library/msdos.386/ms_s/math3s.lib       <RELROOT>/lib386/math3s.lib
#    <CPCMD> library/msdos.387/ms_r/math387r.lib     <RELROOT>/lib386/math387r.lib
#    <CPCMD> library/msdos.387/ms_rd/math387r.lib    <RELROOT>/lib386/mth387rd.lib
#    <CPCMD> library/msdos.387/ms_s/math387s.lib     <RELROOT>/lib386/math387s.lib
    <CPCMD> library/msdos.386/mf_r/math3r.lib       <RELROOT>/lib386/math3r.lib
    <CPCMD> library/msdos.386/mf_rd/math3r.lib      <RELROOT>/lib386/math3rd.lib
    <CPCMD> library/msdos.386/mf_s/math3s.lib       <RELROOT>/lib386/math3s.lib
    <CPCMD> library/msdos.387/mf_r/math387r.lib     <RELROOT>/lib386/math387r.lib
    <CPCMD> library/msdos.387/mf_rd/math387r.lib    <RELROOT>/lib386/mth387rd.lib
    <CPCMD> library/msdos.387/mf_s/math387s.lib     <RELROOT>/lib386/math387s.lib
    <CPCMD> library/msdos.386/ms_r/math3r.lib       <RELROOT>/lib386/dos/math3r.lib
    <CPCMD> library/msdos.386/ms_rd/math3r.lib      <RELROOT>/lib386/dos/math3rd.lib
    <CPCMD> library/msdos.386/ms_s/math3s.lib       <RELROOT>/lib386/dos/math3s.lib
    <CPCMD> library/msdos.387/ms_r/math387r.lib     <RELROOT>/lib386/dos/math387r.lib
    <CPCMD> library/msdos.387/ms_rd/math387r.lib    <RELROOT>/lib386/dos/mth387rd.lib
    <CPCMD> library/msdos.387/ms_s/math387s.lib     <RELROOT>/lib386/dos/math387s.lib
    <CPCMD> library/msdos.386/ms_s/math3s.lib       <RELROOT>/lib386/netware/math3s.lib
    <CPCMD> library/msdos.387/ms_s/math387s.lib     <RELROOT>/lib386/netware/math387s.lib

    <CCCMD> library/winnt.axp/_s/mathaxp.lib        <RELROOT>/libaxp/nt/math.lib

    <CPCMD> rtdll/os2.386/mf_r/mt*.lib              <RELROOT>/lib386/os2/
    <CPCMD> rtdll/os2.386/mf_r/mt*.dll              <RELROOT>/binp/dll/
    <CPCMD> rtdll/os2.386/mf_r/mt*.sym              <RELROOT>/binp/dll/
    <CPCMD> rtdll/os2.386/mf_rd/mt*.lib             <RELROOT>/lib386/os2/
    <CPCMD> rtdll/os2.386/mf_rd/mt*.dll             <RELROOT>/binp/dll/
    <CPCMD> rtdll/os2.386/mf_s/mt*.lib              <RELROOT>/lib386/os2/
    <CPCMD> rtdll/os2.386/mf_s/mt*.dll              <RELROOT>/binp/dll/
    <CPCMD> rtdll/os2.386/mf_s/mt*.sym              <RELROOT>/binp/dll/

    <CPCMD> rtdll/os2.387/mf_r/mt*.lib              <RELROOT>/lib386/os2/
    <CPCMD> rtdll/os2.387/mf_r/mt*.dll              <RELROOT>/binp/dll/
    <CPCMD> rtdll/os2.387/mf_r/mt*.sym              <RELROOT>/binp/dll/
    <CPCMD> rtdll/os2.387/mf_rd/mt*.lib             <RELROOT>/lib386/os2/
    <CPCMD> rtdll/os2.387/mf_rd/mt*.dll             <RELROOT>/binp/dll/
    <CPCMD> rtdll/os2.387/mf_s/mt*.lib              <RELROOT>/lib386/os2/
    <CPCMD> rtdll/os2.387/mf_s/mt*.dll              <RELROOT>/binp/dll/
    <CPCMD> rtdll/os2.387/mf_s/mt*.sym              <RELROOT>/binp/dll/

    <CPCMD> rtdll/winnt.386/mf_r/mt*.lib            <RELROOT>/lib386/nt/
    <CPCMD> rtdll/winnt.386/mf_r/mt*.dll            <RELROOT>/binnt/
    <CPCMD> rtdll/winnt.386/mf_r/mt*.sym            <RELROOT>/binnt/
    <CPCMD> rtdll/winnt.386/mf_rd/mt*.lib           <RELROOT>/lib386/nt/
    <CPCMD> rtdll/winnt.386/mf_rd/mt*.dll           <RELROOT>/binnt/
    <CPCMD> rtdll/winnt.386/mf_rp/mt*.lib           <RELROOT>/lib386/nt/
    <CPCMD> rtdll/winnt.386/mf_rp/mt*.dll           <RELROOT>/binnt/
    <CPCMD> rtdll/winnt.386/mf_s/mt*.lib            <RELROOT>/lib386/nt/
    <CPCMD> rtdll/winnt.386/mf_s/mt*.dll            <RELROOT>/binnt/
    <CPCMD> rtdll/winnt.386/mf_s/mt*.sym            <RELROOT>/binnt/

    <CPCMD> rtdll/winnt.387/mf_r/mt*.lib            <RELROOT>/lib386/nt/
    <CPCMD> rtdll/winnt.387/mf_r/mt*.dll            <RELROOT>/binnt/
    <CPCMD> rtdll/winnt.387/mf_r/mt*.sym            <RELROOT>/binnt/
    <CPCMD> rtdll/winnt.387/mf_rd/mt*.lib           <RELROOT>/lib386/nt/
    <CPCMD> rtdll/winnt.387/mf_rd/mt*.dll           <RELROOT>/binnt/
    <CPCMD> rtdll/winnt.387/mf_rp/mt*.lib           <RELROOT>/lib386/nt/
    <CPCMD> rtdll/winnt.387/mf_rp/mt*.dll           <RELROOT>/binnt/
    <CPCMD> rtdll/winnt.387/mf_s/mt*.lib            <RELROOT>/lib386/nt/
    <CPCMD> rtdll/winnt.387/mf_s/mt*.dll            <RELROOT>/binnt/
    <CPCMD> rtdll/winnt.387/mf_s/mt*.sym            <RELROOT>/binnt/

[ BLOCK <1> clean ]
#==================
    pmake -d build <2> <3> <4> <5> <6> <7> <8> <9> -h clean

[ BLOCK . . ]
#============

cdsay <PROJDIR>
