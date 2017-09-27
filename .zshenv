export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.config
export LANG=en_US.UTF-8

export QT_QPA_PLATFORMTHEME=gtk2
export NNTPSERVER='snews://news.eternal-september.org:563'
export EDITOR=nvim
export BROWSER=chromium

if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi
