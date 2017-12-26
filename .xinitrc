# load xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Japanese input
export GTK_IM_MODULE='uim'
export QT_IM_MODULE='uim'
uim-xim &
export XMODIFIERS='@im=uim'

# automatic device mounting
devmon --sync --exec-on-drive "notify-send --icon=media-removable \"Volume mounted\" \"%l on %d\"" --exec-on-drive "urxvtc -e ranger %d" --exec-on-disc "notify-send --icon=media-optical \"Volume mounted\" \"%l on %d\"" --exec-on-disc "urxvtc -e ranger %d" &

# use gtk widgets
export QT_STYLE_OVERRIDE=GTK+

# java fixes
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS='-Dsun.java2d.opengl=true'

# set background
~/.fehbg &

# terminal daemon
urxvtd -q -f -o &

# compositors are blot
compton &

# notification daemon
dunst &

# hide cursor
unclutter &

# configure touchpad
xinput --set-prop 'ETPS/2 Elantech Touchpad' "libinput Tapping Enabled" 1 &
xinput --set-prop 'ETPS/2 Elantech Touchpad' "libinput Natural Scrolling Enabled" 1 &

# set display brightness to half
xbacklight -set 50 &

# disable display power management
xset -dpms &
xset s off &

# use unix style control key
xmodmap ~/.config/xmodmap &

# copy rofi cache from disk
cp -n ~/.config/rofi/rofi2.druncache ~/.cache/rofi2.druncache &

# start mpd
[ ! -s ~/.config/mpd/pid ] && mpd

# start session
exec bspwm
