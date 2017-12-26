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

if [ -d "$HOME/.gem/ruby/2.4.0/bin" ] ; then
  PATH="$HOME/.gem/ruby/2.4.0/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/go/bin" ] ; then
  PATH="$HOME/go/bin:$PATH"
fi
