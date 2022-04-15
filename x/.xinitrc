#!/bin/sh

userresources=$HOME/.config/Xresources/Xresources
usermodmap=$HOME/.config/Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# xprofile
# Common settings between distros in xprofile
 [ -f ~/.xprofile ] && source ~/.xprofile

xset r rate 250 50
/usr/bin/xmodmap "$HOME/.config/Xmodmap"


# session=$(1:-bspwm)
# case $session in
#     i3|i3wm     ) exec i3;;
#     *           ) exec $1;;
# esac
exec bspwm
