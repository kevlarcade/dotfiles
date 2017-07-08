# load xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# use gtk widgets
export QT_STYLE_OVERRIDE=GTK+

# set background
~/.fehbg &

# compositors are blot
compton &

# notification daemon
dunst &

# hide cursor
unclutter &

# terminal daemon
urxvtd -q -f -o

# configure touchpad
xinput --set-prop 'ETPS/2 Elantech Touchpad' "libinput Tapping Enabled" 1
xinput --set-prop 'ETPS/2 Elantech Touchpad' "libinput Natural Scrolling Enabled" 1

# start session
exec bspwm
