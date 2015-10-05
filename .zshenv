export XDG_CONFIG_HOME="/home/artyom/.config"
export XDG_DATA_HOME="/home/artyom/.config"
export LANG=en_US.UTF-8

export NNTPSERVER='snews://news.eternal-september.org:563'
export PANEL_FIFO=/tmp/panel.fifo
export EDITOR=vim
export NVIM_TUI_ENABLE_TRUE_COLOR=1
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi
