# start x11 on vt1 or vt2
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -le 2 ]; then
  exec startx
fi
