#!/bin/sh
xrdb -merge ~/.Xresources

# Start a D-Bus session
source /etc/X11/xinit/xinitrc.d/30-dbus
# Start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# You probably need to do this too:
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

ogg123 -q "/home/kopri/bin/mgs-sounds/konami_sequence.ogg" &

/usr/bin/urxvtd -q -o -f

feh --bg-fill ~/images/minimal/simpledesktops.com.png

unclutter -idle 10 -jitter 5 &

mpd &

xscreensaver -no-splash &

#bar -p &

#urxvtc &

#2bwm

exec awesome