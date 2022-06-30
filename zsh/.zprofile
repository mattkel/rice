# set what starts at login

# sx automatically
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec sx "$XDG_CONFIG_HOME/X11/xinitrc"
