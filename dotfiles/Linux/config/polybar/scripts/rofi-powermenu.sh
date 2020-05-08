#!/bin/bash

lockscreen=" Lock"
logout=" Logout"
reboot=" Reboot"
shutdown="⏻ Shutdown"

confirmation=" Are you sure ?"
lockscreenConfirmation=" Yes"
logoutConfirmation=" Yes"
rebootConfirmation=" Yes"
shutdownConfirmation="⏻ Yes"
cancel=" No"

show="$lockscreen\n$logout\n$reboot\n$shutdown\n"

if [ -n "${@}" ]
then
    selection="${@}"
fi

printf "\0no-custom\x1ftrue\n"
if [ -z "$selection" ]
then
    echo -e "\0prompt\x1f❱"
    printf "$show"
else
    case $selection in
        $lockscreen)
            echo -e "\0prompt\x1f$confirmation"
            echo -e $lockscreenConfirmation
            echo -e $cancel
            ;;
        $lockscreenConfirmation)
            loginctl lock-session
            ;;
        $logout)
            echo -e "\0prompt\x1f$confirmation"
            echo -e $logoutConfirmation
            echo -e $cancel
            ;;
        $logoutConfirmation)
            bspc quit
            ;;
        $reboot)
            echo -e "\0prompt\x1f$confirmation"
            echo -e $rebootConfirmation
            echo -e $cancel
            ;;
        $rebootConfirmation)
            loginctl reboot
            ;;
        $shutdown)
            echo -e "\0prompt\x1f$confirmation"
            echo -e $shutdownConfirmation
            echo -e $cancel
            ;;
        $shutdownConfirmation)
            loginctl -i poweroff
            ;;        
        $cancel)
            exit 0
            ;;
    esac
fi
