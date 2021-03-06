'*****************************************************************
' OWCONFIG.VBS - automatically generate batch file to set
' environment variables
'*****************************************************************

WScript.StdOut.WriteLine "Open Watcom Build Configurator"

' Initialize boolean variables for command line switches to the default values.
ShowUsage = False
DebugBuild = False
DefaultWindowing = False
Documentation = True
OutFileName = "myvars.cmd"

' Parse the command line.
For i = 0 To WScript.Arguments.Count - 1
    Select Case WScript.Arguments(i)
    Case "-d", "/d"
        DebugBuild = True
    Case "-w", "/w"
        DefaultWindowing = True
    Case "-n", "/n"
        Documentation = False
    Case Else
        If Left(WScript.Arguments(i), 1) = "-" Or Left(WScript.Arguments(i), 1) = "/" Then
            ShowUsage = True
        Else
            OutFileName = WScript.Arguments(i)
        End If
    End Select
Next

' If there was an invalid command line option, print the usage message.
If ShowUsage Then
    WScript.StdOut.WriteLine "Usage: owconfig [options] [filename] [options]"
    WScript.StdOut.WriteLine "Options:"
    WScript.StdOut.WriteLine "            ( /option is also accepted )"
    WScript.StdOut.WriteLine "-d            debug build"
    WScript.StdOut.WriteLine "-n            suppress documentation build"
    WScript.StdOut.WriteLine "-w            default windowing support in clib"
    WScript.StdOut.WriteLine
Else
    ' Otherwise, do the work.
    ' Check for each needed tool in the path.
    WScript.StdOut.Write "Checking for Open Watcom... "
    OpenWatcomPath = FindFile("wcc386.exe")
    WScript.StdOut.WriteLine OpenWatcomPath
    If Len(OpenWatcomPath) = 0 Then
        WScript.StdOut.WriteLine "You must place the binnt folder of your Open Watcom installation in"
        WScript.StdOut.WriteLine "the PATH environment variable before running owconfig."
        WScript.Quit 1
    End If
    WScript.StdOut.Write "Checking for hcrtf... "
    HcrtfPath = FindFile("hcrtf.exe")
    WScript.StdOut.WriteLine HcrtfPath
    WScript.StdOut.Write "Checking for hhc... "
    HhcPath = FindFile("hhc.exe")
    WScript.StdOut.WriteLine HhcPath
    
    ' Output a batch file to set the environment.
    Set FSO = CreateObject("Scripting.FileSystemObject")
    Set WshShell = CreateObject("WScript.Shell")
    Set OutFile = FSO.CreateTextFile(OutFileName)
    OutFile.WriteLine "@echo off"
    OutFile.WriteLine "REM *****************************************************************"
    OutFile.WriteLine "REM " + UCase(OutFileName) + " - Windows NT version"
    OutFile.WriteLine "REM *****************************************************************"
    OutFile.WriteLine "REM NOTE: This batch file was automatically generated by owconfig."
    OutFile.WriteLine "REM       DO NOT EDIT!"
    OutFile.WriteLine
    OutFile.WriteLine "set OWROOT=" + WshShell.CurrentDirectory
    OutFile.WriteLine "set WATCOM=" + Left(OpenWatcomPath, InStrRev(OpenWatcomPath, "\") - 1)
    OutFile.WriteLine
    OutFile.WriteLine "REM Set this variable to 1 to get debug build"
    If DebugBuild Then
        OutFile.WriteLine "set DEBUG_BUILD=1"
    Else
        OutFile.WriteLine "set DEBUG_BUILD=0"
    End If
    OutFile.WriteLine
    OutFile.WriteLine "REM Set this variable to 1 to get default windowing support in clib"
    If DefaultWindowing Then
        OutFile.WriteLine "set DEFAULT_WINDOWING=1"
    Else
        OutFile.WriteLine "set DEFAULT_WINDOWING=0"
    End If
    OutFile.WriteLine
    OutFile.WriteLine "REM Set this variable to 0 to suppress documentation build"
    If Documentation Then
        OutFile.WriteLine "set DOC_BUILD=1"
    Else
        OutFile.WriteLine "set DOC_BUILD=0"
    End If
    OutFile.WriteLine
    OutFile.WriteLine "REM Documentation related variables"
    If Len(HcrtfPath) > 0 Then
        OutFile.WriteLine "set WIN95HC=hcrtf"
        OutFile.WriteLine "set PATH=%PATH%;" + HcrtfPath
    Else
        OutFile.WriteLine "set WIN95HC="
    End If
    If Len(HhcPath) > 0 Then
        OutFile.WriteLine "set HHC=hhc"
        OutFile.WriteLine "set PATH=%PATH%;" + HhcPath
    Else
        OutFile.WriteLine "set HHC="
    End If
    OutFile.WriteLine
    OutFile.WriteLine "REM Subdirectory to be used for bootstrapping"
    OutFile.WriteLine "set OBJDIR=bootstrp"
    OutFile.WriteLine
    OutFile.WriteLine "REM Subdirectory to be used for building prerequisite utilities"
    OutFile.WriteLine "set PREOBJDIR=prebuild"
    OutFile.WriteLine
    OutFile.WriteLine "REM Invoke the batch file for the common environment"
    OutFile.WriteLine "call %OWROOT%\cmnvars.bat"
    OutFile.WriteLine
    OutFile.WriteLine "cd %DEVDIR%"
    OutFile.Close
End If

Function FindFile(FileName)
'**************************
    Set FSO = CreateObject("Scripting.FileSystemObject")
    Set WshShell = CreateObject("WScript.Shell")
    PathDirs = Split(WshShell.ExpandEnvironmentStrings("%PATH%"), ";")
    For Each Dir In PathDirs
        If Right(Dir, 1) = "\" Then
            Dir = Left(Dir, Len(Dir) - 1)
        End If
        If FSO.FileExists(Dir + "\" + FileName) Then
            FindFile = Dir
            Exit Function
        End If
    Next
    FindFile = ""
End Function

