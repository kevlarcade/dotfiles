# load xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# use gtk widgets
export QT_STYLE_OVERRIDE=GTK+

# set background
feh --randomize --recursive --bg-fill ~/.wallpaper

# compositor
compton --shadow --menu-opacity=0.9 --blur-background --blur-background-frame --inactive-opacity=0.8 --backend glx --glx-no-stencil --shadow-red=1 --shadow-green=1 --shadow-blue=1 --shadow-offset-x=-8 --shadow-offset-y=-8 --daemon &

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
