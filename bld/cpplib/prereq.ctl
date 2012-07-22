# C++ Reference Compilers Prerequisite Tool Build Control File
# ============================================================

    echo Building C++ reference compilers
    cdsay <DEVDIR>/plusplus/rpp.i86
    wmake -h -k
    cdsay <DEVDIR>/plusplus/rpp.386
    wmake -h -k
    cdsay <DEVDIR>/plusplus/rpp.axp
    wmake -h -k
    cdsay <PROJDIR>
