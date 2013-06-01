#!/bin/sh

ACTION=`zenity --width=90 --height=200 --list --radiolist --text="Select logout action" --title="Logout" --column "Choice" --column "Action" TRUE Shutdown FALSE Reboot FALSE LockScreen FALSE Suspend`

if [ -n "${ACTION}" ];then
  case $ACTION in
  Shutdown)
    zenity --question --text "Are you sure you want to halt?" && gksudo halt
    ## or via ConsoleKit
    # dbus-send --system --dest=org.freedesktop.ConsoleKit.Manager \
    # /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop
    ;;
  Reboot)
    zenity --question --text "Are you sure you want to reboot?" && gksudo reboot
    ## Or via ConsoleKit
    # dbus-send --system --dest=org.freedesktop.ConsoleKit.Manager \
    # /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Restart
    ;;
  Suspend)
    #gksudo pm-suspend
    dbus-send --system --print-reply --dest=org.freedesktop.Hal \
    /org/freedesktop/Hal/devices/computer \
    org.freedesktop.Hal.Device.SystemPowerManagement.Suspend int32:0
    # HAL is deprecated in newer systems in favor of UPower etc.
    # dbus-send --system --dest=org.freedesktop.UPower /org/freedesktop/UPower org.freedesktop.UPower.Suspend
    ;;
  LockScreen)
    slock
    # Or gnome-screensaver-command -l
    ;;
  esac
fi
