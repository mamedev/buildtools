# MAME Build Tools

##### Table of Contents  
* [Introduction](#introduction)
* [x86/32-bit Windows Builds](#32bitwindows)
* [Installation and building](#installandbuild)  
  * [Downloads](#downloads)  
  * [Installation](#installation)  
  * [Windows Terminal](#winterm)  
  * [Building](#building)  
* [Updating build tools](#updating)  
* [Alternative Shells for advanced usage](#advanced)
* [DOSKEY Aliases](#doskey)
* [Optional additional packages](#optional)  
  * [SDL](#optional-sdl)  
  * [QT5](#optional-qt5)  
  * [QT4](#optional-qt4)  
  * [CCache](#optional-ccache)  
  * [CMake](#optional-cmake)  
  * [DOxygen](#optional-doxygen)  

## Introduction
<a name="introduction"/>
The MAME development environment for Windows consists of the GCC compiler (by way of MinGW), and the MSYS2 POSIX/Unix compatibility layer, plus various utilities such as Python and Git. It is available as a prepackaged installer, or can be assembled from upstream components. 

Source control is handled by GitHub (***https://github.com/mamedev/mame.git***), so you'll need to check out a copy.
Various modules are disabled by default, but can be enabled through arguments when building and may require additional MSYS2 packages to be installed.

## x86/32-bit Builds
<a name="32bitwindows"/>
Please note that 32-bit (x86) builds for Windows are no longer officially supported.

## Installation and building
<a name="installandbuild"/>

<a name="downloads"/>

### Downloads
* [Latest 64-Bit Tools Download](https://github.com/mamedev/buildtools/releases/latest)

### Installation
<a name="installation"/>

If you are installing it in a location other than the default of ``*C:\Users\Public\msys64*``, after you unpack double-click ``autorebase.bat``

To open a non-POSIX shell, use the batch file ``win32env.bat`` for regular Windows console.

**Important** thing is to setup your Git environment first

```sh
git config --global core.autocrlf true
```

And if you are a contributor:

```sh
git config --global user.email youremail@something.com
git config --global user.name "Firstname Lastname"
```

### Windows Terminal
<a name="winterm"/>
If you are using Windows Terminal, you can use the following profile:

```json
            {
                "name": "Dev environment (cmd, 64-bit)",
                "guid": "{a2b7eb3f-22e4-4426-9803-64beab21c193}",
                "commandline": "cmd /c C:\\Users\\Public\\msys64\\win32\\win32env.bat",
                "startingDirectory": "C:\\Users\\Public\\msys64",
                "hidden": false,
            },
```

If you don't have MSYS2 installed in the default location, change the path ``C:\\Users\\Public\\msys64\\`` to wherever you installed the build tools to.

### Building
<a name="building"/>
Then, to download the MAME source under your MSYS2 user's home directory:

```sh
git clone https://github.com/mamedev/mame.git
```

Alternatively, locate your existing source tree (drives are mapped to hidden directories, ``/c`` ``/d`` etc. under the virtual root):
```sh
cd /c/Projects/mame
```

And finally to build:
```sh
make
```

## Updating build tools

<a name="updating"/>

Similar to package managers on Linux like apt-get, yum, etc. MSYS2 can automatically update packages for fixes, security updates etc.
To update all installed packages to current, from the regular Windows console run the following:

```sh
pacman -Sy
pacman -S bash pacman msys2-runtime --noconfirm --needed
```
Next, exit the console and restart MSYS2.

Finally, once back at the console, execute:
```sh
pacman -Su --noconfirm
```

## Alternative Shells for advanced usage

<a name="advanced"/>

For a simple MSYS2 terminal use ``mingw64.exe`` (for 64-bit builds) or ``mingw32.exe`` (for 32-bit builds) to start. 

For more information about MSYS2, see [MSYS2 Introduction](https://github.com/msys2/msys2/wiki/MSYS2-introduction). 

<a name="optional"/>

<a name="doskey">

## DOSKEY Aliases

The package includes several DOSKEY aliases for users that prefer to use CMD.EXE as their command line. These default aliases are contained in ``C:\Users\Public\msys64\win32\aliases``.

User-created aliases should go into ``C:\Users\Public\msys64\win32\useraliases`` as that file will not be overwritten on a reinstallation/update of the MSYS2 tools.

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
<a name="optional-cmake"/>

### CMake

Used as build system for some other project that can be handy

   **For x64**
   ```sh
   pacman -S mingw-w64-x86_64-cmake 
   ```

   **For x86**
   ```sh
   pacman -S mingw-w64-i686-cmake 
   ```

   **To build in Windows environment use from build folder:**
   ```sh
   cmake -G "MinGW Makefiles" .. -DCMAKE_MAKE_PROGRAM=c:\Users\Public\msys64\win32\make.exe
   ```
   **To build in MSYS environment use from build folder:**
   ```sh
   cmake -G "MSYS Makefiles" ..
   ```
   
<a name="optional-clang"/>

### Clang

If you wish to compile/link with the alternative Clang, go ahead and download:
 
   **For x64**
   ```sh
   pacman -S mingw-w64-x86_64-clang mingw-w64-x86_64-clang-analyzer mingw-w64-x86_64-clang-tools-extra 
   ```

   **For x86**
   ```sh
   pacman -S mingw-w64-i686-clang mingw-w64-i686-clang-analyzer mingw-w64-i686-clang-tools-extra
   ```
   
