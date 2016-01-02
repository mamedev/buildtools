# MAME Build Tools

## Automatic installer

Just download [msys64-2016-01-01.exe](https://github.com/mamedev/buildtools/releases/download/1.0/msys64-2016-01-01.exe) if you are on 64-bit Windows
or [msys32-2016-01-01.exe](https://github.com/mamedev/buildtools/releases/download/1.0/msys32-2016-01-01.exe) is you are on 32 bit Windows.

If you are installing it in a location other than the default (*c:\msys64* or *c:\msys32*), after you unpack double-click : **autorebase.bat**

For simple terminal use **buildtools.bat**  to start, for fancy looking one **conemu.bat**. For more information about Msys2, see http://sourceforge.net/p/msys2/wiki/MSYS2%20introduction/.

Then, to download the MAME source under your Msys2 user's homedir:
```sh
git clone https://github.com/mamedev/mame.git
```

Alternatively, locate your existing source tree (drives are mapped to hidden dirs /c etc. under the virtual root):
```sh
cd /c/Projects/mame
```

And finally to build:
```sh
make
```

## Manual steps

1. Download MSYS2. You can do that by downloading from http://msys2.github.io/ or
   from our mirror [for 64-bit Windows](https://github.com/mamedev/buildtools/releases/download/1.0/msys2-x86_64-20150916.exe) or [for 32-bit Windows](https://github.com/mamedev/buildtools/releases/download/1.0/msys2-i686-20150916.exe)
2. Run the installer (location can be changed to suite) and let it complete and it will launch an Msys shell
3. Update initial installation
   ```
   pacman --needed -Sy bash pacman pacman-mirrors msys2-runtime
   ```
4. Type `exit` to close current window and start "MSYS2 Shell" again 
5. Now upgrade already installed packages to current
   ```sh
   pacman -Su
   ```
6. Install ConEmu console, `make`, `wget` and `git` tools
   ```sh
   pacman -S conemu-git make wget git
   ```
7. Go to root folder and download MAME development environment shell scripts
   ```sh
   cd /
   wget https://raw.githubusercontent.com/mamedev/buildtools/master/buildtools.bat
   wget https://raw.githubusercontent.com/mamedev/buildtools/master/conemu.bat
   exit
   ```
8. Start  ```buildtools.bat``` from installed folder (by default it is *C:\msys64* or *c:\msys32*)
9. Now it is time to install `mingw` and `python`

   **For x64**
   ```
   pacman -S mingw-w64-x86_64-gcc python
   ```

   **For x86**
   ```
   pacman -S mingw-w64-i686-gcc python
   ```

## Update of packages

To update all installed packages using the Msys2 package manager:

   ```
   pacman -Su
   ```

## Optional additional packages

### SDL
If you wish to build with the SDL renderer:

   **For x64**
   ```
   pacman -S mingw-w64-x86_64-SDL2 mingw-w64-x86_64-SDL2_ttf
   ```

   **For x86**
   ```
   pacman -S mingw-w64-i686-SDL2 mingw-w64-i686-SDL2_ttf
   ```

### QT5
If you wish to build with the QT5 debugger:

   **For x64**
   ```
   pacman -S mingw-w64-x86_64-qt5
   ```

   **For x86**
   ```
   pacman -S mingw-w64-i686-qt5
   ```

### QT4
If you with to build the QMC2 frontend or similar:

   **For x64**
   ```
   pacman -S mingw-w64-x86_64-qt4
   ```

   **For x86**
   ```
   pacman -S mingw-w64-i686-qt4
   ```

### Doxygen
To be able to generate the documentation from the source:

   ```
   pacman -S doxygen 
   ```

### CCache
To be able to use ccache to speed-up (re)compilation

   **For x64**
   ```
   pacman -S mingw-w64-x86_64-ccache 
   ```

   **For x86**
   ```
   pacman -S mingw-w64-i686-ccache 
   ```

### Clang
If you wish to compilelink with the alternative Clang, go ahead and download **STILL EXPERIMENTAL**:
 
   **For x64**
   ```
   pacman -S mingw-w64-x86_64-clang mingw-w64-x86_64-clang-analyzer mingw-w64-x86_64-clang-tools-extra 
   ```

   **For x86**
   ```
   pacman -S mingw-w64-i686-clang mingw-w64-i686-clang-analyzer mingw-w64-i686-clang-tools-extra
   ```
