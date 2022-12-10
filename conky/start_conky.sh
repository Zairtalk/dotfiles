#!/bin/sh

pkill "^conky"

sleep 1

nohup conky -c ~/.dotfiles/conky/conky_hotkeys &> /dev/null  & 
nohup conky -c ~/.dotfiles/conky/conky_system &> /dev/null   & 
nohup conky -c ~/.dotfiles/conky/conky_calendar &> /dev/null & 

exit
