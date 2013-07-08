#!/bin/zsh

xset +fp /home/kopri/.fonts/
xset fp rehash 
xrdb -merge ~/.Xresources

#Start a D-Bus session
source /etc/X11/xinit/xinitrc.d/80-dbus

#Start GNOME Keyring

#eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
#You probably need to do this too:
#export SSH_AUTH_SOCK
#export GPG_AGENT_INFO
#export GNOME_KEYRING_CONTROL
#export GNOME_KEYRING_PID

#ogg123 -q "/home/kopri/bin/mgs-sounds/konami_sequence.ogg" &

urxvtd -q -o -f 

feh --bg-tile /home/kopri/images/pattern/dark_mosaic.png &

unclutter -idle 10 -jitter 5 &

xbindkeys &

mpd &

xscreensaver -no-splash &

exec wmrun.sh
