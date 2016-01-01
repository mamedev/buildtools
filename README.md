# MAME Build Tools

1. Download MSYS2. You can do that by downloading from http://msys2.github.io/ or
   from our mirror [for 64-bit Windows](https://github.com/mamedev/buildtools/releases/download/1.0/msys2-x86_64-20150916.exe) or [for 32-bit Windows](https://github.com/mamedev/buildtools/releases/download/1.0/msys2-i686-20150916.exe)
2. Run installation and let it finish and start command prompt, change default location by your needs
3. Update initial installation

  ```
  pacman --needed -Sy bash pacman pacman-mirrors msys2-runtime
  ```
4. Type exit to close current window and start "MSYS2 Shell" again
5. Now upgrade rest of packages

  ```
  pacman -Su
  ```
6. Install ConEmu console,make, wget and git tools

  ```
  pacman -S conemu-git make wget git
  ```
7. Go to top folder and download new startup batch file, and exit 

  ```
  cd /
  wget https://raw.githubusercontent.com/mamedev/buildtools/master/buildtools.bat
  exit
  ```
8. Start  ```buildtools.bat ``` from installed folder (by default it is C:\msys64 or c:\msys32)
9. Now it is time to install mingw and python

    For x64
  ```
  pacman -S mingw-w64-x86_64-gcc python
  ```

    For x86
  ```
  pacman -S mingw-w64-i686-gcc python
  ```

10. Download MAME source

  ```
  git clone https://github.com/mamedev/mame.git
  ```

11. To update anytime in future just use:

  ```
  pacman -Su
  ```
