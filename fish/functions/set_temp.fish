function set_temp --wraps='ln -s $(~/.config/polybar/plugins/temp1.sh) ~/.config/polybar/plugins/temp1' --wraps='ln -sf $(~/.config/polybar/plugins/temp1.sh) ~/.config/polybar/plugins/temp1' --description 'alias set_temp ln -sf $(~/.config/polybar/plugins/temp1.sh) ~/.config/polybar/plugins/temp1'
  ln -sf $(~/.config/polybar/plugins/temp1.sh) ~/.config/polybar/plugins/temp1 $argv; 
end
