![scrot of current desktop](http://i.imgur.com/qfKL82l.png "It never actually looks this clean")
## installed software

### interface
+ **bspwm** _window manager_  chosen because it's easily configured and doesn't get in the way of productivity
+ **sxhxd** _hotkey daemon_  default for bspwm and I have no reason to change it
+ **urxvt** _terminal emulator_  lightweight, extensible with perl, few compatibility issues / quirks
+ **lemonbar** _status bar_ easy to use panel with a tiny footprint
+ **feh** _image viewer and background setter_  it's simple and does everything you need
+ **unclutter** _X cursor hider_  this is a mostly keyboard driven config, the cursor is useless most of the time
+ **redshift** _screen temperature daemon_  reduces eye strain in reduced light

### internet
+ **weechat** _irc client_  extensible irc client with great community support
+ **mutt** _mail client_  fast and well supported console email client
  + **msmtp**  _mtp client_  sends email
  + **offlineimap** _imap client_  syncs email
  + **elinks** _web browser_ formats html emails
+ **firefox** _web browser_  golden standard web browser
+ **w3m** _web browser_  console web browser, used for image previews in ranger
+ **rtorrent** _download manager_  trimmed down bittorrent client

### media
+ **mpd** _music player_  gold standard music player daemon
+ **ncmpcpp** _music player_  fast and configurable mpd client
+ **mpv** _video player_  do-it-all video player for streaming and playing local media

### programming
+ **vim** _text editor_  the one true text editor
  + **vim-plug** _plugin manager_  lightweight and less finicky than other managers
  + **vim-airline** _status bar_  replaces the standard vim status bar with some useful eye candy
  + **vim-numbertoggle**  smart relative line-number toggling
  + **vim-gitgutter**  shows git diffs
  + **vim-trailing-whitespace**  highlights spaces where they shouldn't be
  + **auto-pairs**  spawns matched brackets / quotes
  + **nerdtree**  in-editor file browser
  + **gruvbox** _colour scheme_  low contrast colour scheme that's easy on the eyes

### utilities
+ **zsh** _shell_ very powerful shell that remains compatible with bash
+ **dmenu** _dynamic menu_ application launcher (will be replaced with rofi later)
+ **ranger** _file manager_  extensible file manager that can use w3m for image previews
+ **pacaur** _aur helper_  yaort is for losers
+ **htop** _task manager_  beautified and more useful top
+ **progress** tool to show the progress of coreutils basic commands

### fonts / themes
+ **infinality** _text rendering_  improves appearence of text
  + **infinality-bundle** _standard fonts_  basic fonts for apps that need it
  + **infinality-bundle-fonts** _more fonts_  fonts to play with
+ **source code pro for powerline** _monospace font_  primary font used in the system, extremely legible
+ **source code sans** _sans serif font_  font used for web browsing that retains the legibility of source code pro
+ **arc-darker** _gtk theme_  flat gtk theme with dark highlights.  doesn't matter because the only gtk app is firefox and you'll only see it if you unhide the menubar
+ **paper** _icon theme_  flat and simple icon theme.  again it doesn't matter because you'll never see it

## notes
this configuration is used on a laptop with a high-dpi screen, so some things might look oversized when used on a regular screen and many settings are optomized for power saving.  the sleep timers on the panel script should be shortened for use on systems where responsiveness is valued over power consumption.
