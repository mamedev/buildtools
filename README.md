# MAME Build Tools

##### Table of Contents  
* [Introduction](#introduction)
* [Automatic installer](#automatic)  
* [Updating build tools](#updating)  
* [Optional additional packages](#optional)  
  * [SDL](#optional-sdl)  
  * [QT5](#optional-qt5)  
  * [QT4](#optional-qt4)  
  * [CCache](#optional-ccache)  
  * [DOxygen](#optional-doxygen)  
* [Manual Steps](#manual)

<a name="introduction"/>
## Introduction
The MAME development environment for Windows consists of the GCC compiler (by way of MinGW), and the MSYS2 (POSIX/Unix compatability layer), plus various utilities such as Python and Git. It is available as a prepackaged installer, or can be assembled from upstream components. 

Source control is handled by github (***https://github.com/mamedev/mame.git***), so you'll need to check out a copy.
Various modules are disabled by default, such as the MAME interactive debugger, but can be enabled through arguments when building and may require additional MSYS2 packages to be installed.

<a name="automatic"/>
## Automatic installer

Download [msys64-2016-01-03.exe](https://github.com/mamedev/buildtools/releases/download/1.2/msys64-2016-01-03.exe) if you are on 64-bit Windows
or [msys32-2016-01-03.exe](https://github.com/mamedev/buildtools/releases/download/1.2/msys32-2016-01-03.exe) is you are on 32 bit Windows.
If you are on 64-bit Windows but wish to produce binaries for both 32-bit and 64-bit download [msys64-32-2016-01-03.exe](https://github.com/mamedev/buildtools/releases/download/1.2/msys64-32-2016-01-03.exe)
To switch between different mingw versions use **config32.bat** and **config64.bat**

If you are installing it in a location other than the default (*c:\msys64* or *c:\msys32*), after you unpack double-click : **autorebase.bat**

In case you wish to use non-posix environment there are two additional batch files: **win32env.bat** for regular windows console, and **win32con.bat** for fancy looking conemu console.

For a simple terminal use **buildtools.bat**  to start. For a fancy looking one use **conemu.bat**. For more information about Msys2, see [MSYS2 Introduction](http://sourceforge.net/p/msys2/wiki/MSYS2%20introduction/). There are also **buildtools_32.bat** and **conemu_32.bat** enforcing mingw32 on 64-bit tools (makes sense if you use combined distribution).

Since it can be that some of configuration file have altered, first pull latest from root of your tools:
```sh
git pull
```

**Important** thing is to setup your git environment first
```sh
git config --global core.autocrlf true
```

And if you are contributor
```sh
git config --global user.email=youremail@something.com
git config --global user.name=FirstName Lastname
```

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

<a name="updating"/>
## Updating build tools

Similar to package managers on Linux like apt-get, yum etc. MSYS2 can automatically update packages for fixes, security updates etc.
To update all installed packages to current:

```sh
pacman -Su
```

<a name="optional"/>
## Optional additional packages

<a name="optional-sdl"/>
### SDL
If you wish to build with the SDL renderer:

   **For x64**
   ```sh
   pacman -S mingw-w64-x86_64-SDL2 mingw-w64-x86_64-SDL2_ttf
   ```

   **For x86**
   ```sh
   pacman -S mingw-w64-i686-SDL2 mingw-w64-i686-SDL2_ttf
   ```

<a name="optional-qt5"/>
### QT5
If you wish to build with the QT5 debugger:

   **For x64**
   ```sh
   pacman -S mingw-w64-x86_64-qt5
   ```

   **For x86**
   ```sh
   pacman -S mingw-w64-i686-qt5
   ```

<a name="optional-qt4"/>
### QT4
If you with to build the QMC2 frontend or similar:

   **For x64**
   ```sh
   pacman -S mingw-w64-x86_64-qt4
   ```

   **For x86**
   ```sh
   pacman -S mingw-w64-i686-qt4
   ```

<a name="optional-doxygen"/>
### Doxygen
To be able to generate the documentation from the source:

   ```sh
   pacman -S doxygen 
   ```

<a name="optional-ccache"/>
### CCache
To be able to use ccache to speed-up (re)compilation

   **For x64**
   ```sh
   pacman -S mingw-w64-x86_64-ccache 
   ```

   **For x86**
   ```sh
   pacman -S mingw-w64-i686-ccache 
   ```

<a name="optional-clang"/>
### Clang
If you wish to compile/link with the alternative Clang, go ahead and download **STILL EXPERIMENTAL**:
 
   **For x64**
   ```sh
   pacman -S mingw-w64-x86_64-clang mingw-w64-x86_64-clang-analyzer mingw-w64-x86_64-clang-tools-extra 
   ```

   **For x86**
   ```sh
   pacman -S mingw-w64-i686-clang mingw-w64-i686-clang-analyzer mingw-w64-i686-clang-tools-extra
   ```

<a name="manual"/>
## Manual steps

1. Download MSYS2. You can do that by downloading from http://msys2.github.io/ or
   from our mirror [for 64-bit Windows](https://github.com/mamedev/buildtools/releases/download/1.0/msys2-x86_64-20150916.exe) or [for 32-bit Windows](https://github.com/mamedev/buildtools/releases/download/1.0/msys2-i686-20150916.exe)

2. Run the installer (location can be changed to suite) and let it complete and it will launch an Msys shell

3. Update initial installation

   ```sh
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

7. Install `mingw` and `gdb` including `python`

   **For x64**
   ```sh
   pacman -S mingw-w64-x86_64-gcc mingw-w64-x86_64-gdb
   ```

   **For x86**
   ```sh
   pacman -S mingw-w64-i686-gcc mingw-w64-i686-gdb
   ```

8. Go to root folder and download MAME development environment shell scripts

   
   **For x86**
   ```sh
   cd /
   git clone https://github.com/mamedev/buildtools_x86.git build
   cd build
   mv * ..
   cd ..
   rm -r -f build
   exit
   ```

   **For x64**
   ```sh
   cd /
   git clone https://github.com/mamedev/buildtools_x64.git build
   cd build
   mv * ..
   cd ..
   rm -r -f build
   exit
   ```

9. Finally, start  ```buildtools.bat``` from installed folder (by default it is *C:\msys64* or *c:\msys32*)
