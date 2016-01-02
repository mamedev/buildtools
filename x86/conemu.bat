:
@echo off

rem ember value of GOTO: is used to know recursion has happened.
if "%1" == "GOTO:" goto %2

if NOT "x%WD%" == "x" set WD=

rem ember command.com only uses the first eight characters of the label.
goto _WindowsNT

start /min %COMSPEC% /e:4096 /c %0 GOTO: _Resume %0 %1 %2 %3 %4 %5 %6 %7 %8 %9
goto EOF

rem ember that we execute here if we recursed.
:_Resume
for %%F in (1 2 3) do shift
if NOT EXIST %WD%msys-2.0.dll set WD=.\usr\bin\

rem ember that we get here even in command.com.
:_WindowsNT

if NOT EXIST %WD%opt\bin\CmdInit.cmd  %WD%usr\bin\touch.exe > %WD%opt\bin\CmdInit.cmd 

if NOT EXIST %WD%msys-2.0.dll set WD=%~dp0usr\bin\
set MSYSTEM=MINGW32
set MINGW32=/mingw32
set MINGW64=/mingw64
set PATH=%PATH%;.
@if defined VS120COMNTOOLS (
	@call "%VS120COMNTOOLS%vsvars32.bat"
)
@if defined VS140COMNTOOLS (
	@call "%VS140COMNTOOLS%vsvars32.bat"
)
rem To activate windows native symlinks uncomment next line
rem set MSYS=winsymlinks:nativestrict
rem Set debugging program for errors
rem set MSYS=error_start:%WD%../../mingw64/bin/qtcreator.exe^|-debug^|^<process-id^>

start %WD%..\..\opt\bin\ConEmu -cmd %WD%bash --login %*

:EOF
