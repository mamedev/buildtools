# MAME Build Tools

##### Table of Contents  
* [Introduction](#introduction)
* [Installation and building](#installandbuild)  
  * [Downloads](#downloads)  
  * [Installation](#installation)  
  * [Building](#building)  
* [Updating build tools](#updating)  
* [Alternative Shells for advanced usage](#advanced)
* [Optional additional packages](#optional)  
  * [SDL](#optional-sdl)  
  * [QT5](#optional-qt5)  
  * [QT4](#optional-qt4)  
  * [CCache](#optional-ccache)  
  * [CMake](#optional-cmake)  
  * [DOxygen](#optional-doxygen)  

<a name="introduction"/>

## Introduction
The MAME development environment for Windows consists of the GCC compiler (by way of MinGW), and the MSYS2 (POSIX/Unix compatability layer), plus various utilities such as Python and Git. It is available as a prepackaged installer, or can be assembled from upstream components. 

Source control is handled by github (***https://github.com/mamedev/mame.git***), so you'll need to check out a copy.
Various modules are disabled by default, but can be enabled through arguments when building and may require additional MSYS2 packages to be installed.

<a name="installandbuild"/>

## Installation and building

<a name="downloads"/>

### Downloads
* Dual 32-bit/64-bit - [msys64-32-2019-12-23.exe](https://github.com/mamedev/buildtools/releases/download/5.0/msys64-32-2019-12-23.exe) _(If you have 64-bit Windows but wish to build for both 32-bit and 64-bit. To switch between different mingw versions use **config32.bat** and **config64.bat**)_

<a name="installation"/>

### Installation
If you are installing it in a location other than the default (*c:\msys64* or *c:\msys32*), after you unpack double-click : **autorebase.bat**

To open a non-posix shell there are two batch files: **win32env.bat** for regular Windows console.

**Important** thing is to setup your git environment first
```sh
git config --global core.autocrlf true
```

And if you are a contributor:
```sh
git config --global user.email youremail@something.com
git config --global user.name "Firstname Lastname"
```

<a name="building"/>

### Building
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
To update all installed packages to current, from the regular Windows console run the following:

```sh
pacman -Sy
pacman -S bash pacman msys2-runtime --noconfirm --needed
```
Next, exit the console and restart Msys2.

Finally, once back at the console, execute:
```sh
pacman -Su --noconfirm
```

<a name="advanced"/>

## Alternative Shells for advanced usage
For a simple MSYS32 terminal use **mingw64.exe** to start or **mingw32.exe** . 

For more information about Msys2, see [MSYS2 Introduction](https://github.com/msys2/msys2/wiki/MSYS2-introduction). 

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
<a name="optional-ccache"/>

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
   cmake -G "MinGW Makefiles" .. -DCMAKE_MAKE_PROGRAM=c:\msys64\win32\make.exe
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
   
