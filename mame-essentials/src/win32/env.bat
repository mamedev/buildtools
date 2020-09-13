:: Find root dir
@if not defined MSYS2_ROOT (
    for /f %%i in ("%~dp0\..") do @set MSYS2_ROOT=%%~fi
)

:: Add aliases
@doskey /macrofile="%MSYS2_ROOT%\win32\aliases"

@set MINGW32=
@set MINGW64=
@set ADD_PATH=
@set PATH=C:\Windows\System32;C:\Windows
:: Enhance Path
@if "%CONFIG_ARCHITECTURE%"=="x86" (
	@set MINGW32=%MSYS2_ROOT%\mingw32
	@set MINGW=%MSYS2_ROOT%\mingw32
	@set prompt=[MINGW32] $p$g
) else (
	@set MINGW64=%MSYS2_ROOT%\mingw64
	@set MINGW=%MSYS2_ROOT%\mingw64
	@set prompt=[MINGW64] $p$g
)
@set MINGW_PATH=%MINGW%\bin

@set PATH=%ADD_PATH%;%MSYS2_ROOT%\win32;%MINGW_PATH%;%MSYS2_ROOT%\usr\bin;%PATH%

@set PYTHON_EXECUTABLE=%MINGW%\bin\python.exe

@if not exist "%MSYS2_ROOT%\home" (
	@bash --login /win32/init.sh
)