#!/bin/zsh

xset +fp /home/kopri/.fonts/
xset fp rehash 
xrdb -merge ~/.Xresources
xsetroot -cursor_name left_ptr

ogg123 -q "/home/kopri/misc/systemsounds/mgs/start.ogg" &

urxvtd -q -o -f 

feh --bg-tile /home/kopri/images/pattern/outlets/outlets.png &

unclutter -idle 1 -jitter 5 &

xbindkeys &

mpd &

xautolock -time 10 -locker slock

conky | bar &

exec cwm
