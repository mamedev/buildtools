# MAME Essentials package

Build with:

```
makepkg -f -d
```

options:
f - is for force (to recreate if package file already exits)
d - no dependency check (so no need to have deps already preinstalled)


To use:

```
pacman -U mame-essentials-1.0-0-x86_64.pkg.tar.zst
```

Will install this package and all dependencies needed for user to have installed to be able to compile MAME.
This can be installed on vanilla MSYS2 installation.

