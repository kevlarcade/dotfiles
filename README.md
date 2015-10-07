# injected's dotfiles
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

### utilities
+ **dmenu** _dynamic menu_ application launcher (will be replaced with rofi later)
+ **ranger** _file manager_  extensible file manager that can use w3m for image previews
+ **pacaur** _aur helper_  yaort is for losers

## notes
this configuration is used on a laptop with a high-dpi screen, so some things might look oversized when used on a regular screen and many settings are optomized for power saving.  the sleep timers on the panel script should be shortened for use on systems where responsiveness is valued over power consumption.
