:: Find root dir
@if not defined MSYS2_ROOT (
    for /f %%i in ("%~dp0\..") do @set MSYS2_ROOT=%%~fi
)

:: Enhance Path
@set MINGW32=%MSYS2_ROOT%\mingw32
@set MINGW64=%MSYS2_ROOT%\mingw64

@set MINGW=%MINGW32%

@if defined VS120COMNTOOLS (
	@call "%VS120COMNTOOLS%vsvars32.bat"
)
@if defined VS140COMNTOOLS (
	@call "%VS140COMNTOOLS%vsvars32.bat"
)
@set PYTHON_EXECUTABLE=%MINGW%\bin\python.exe
@set MINGW_PATH=%MINGW%\bin
@set PATH=%MSYS2_ROOT%\win32;%MINGW_PATH%;%MSYS2_ROOT%\usr\bin;C:\Windows\System32;C:\Windows
@if EXIST %MSYS2_ROOT%\usr\bin\sh.exe move /Y %MSYS2_ROOT%\usr\bin\sh.exe %MSYS2_ROOT%\usr\bin\sh.exe.old > NUL
