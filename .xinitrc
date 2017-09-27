# load xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Japanese input
export GTK_IM_MODULE='uim'
export QT_IM_MODULE='uim'
uim-xim &
export XMODIFIERS='@im=uim'

# use gtk widgets
export QT_STYLE_OVERRIDE=GTK+

# java fixes
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS='-Dsun.java2d.opengl=true'

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

# use unix style control key
xmodmap ~/.config/xmodmap

# start session
exec bspwm
