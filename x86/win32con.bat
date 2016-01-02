@if not exist src (
	mkdir src
)
@cd src

start ..\opt\bin\ConEmu  -cmd cmd /k ..\win32\env.bat
