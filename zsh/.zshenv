# path
typeset -U PATH path
path=("$HOME/.local/bin" "$HOME/.local/bin/statusbar" "$HOME/.local/bin/cron" "$HOME/.local/bin/xmenu" "$HOME/.npm-global" "/opt/android-sdk/platform-tools" "$path[@]")
export PATH

# xdg
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Fixing Paths
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME"/notmuch/notmuchrc
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_AUTO_SCREEN_SCALE_FACTOR=0
#export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/password-store
#export GNUPGHOME="$XDG_DATA_HOME"/gnupg
#export MBSYNCRC="$XDG_DATA_HOME"/mbsync/mbsyncrc

export LESSHISTFILE=-

# default programs
export TERMINAL="alacritty"
export EDITOR="nvim"
export VISUAL="nvim"
export READER="zathura"
export IMAGE="sxiv"
export VIDEO="mpv"
export BROWSER="firefox -P accounts_misc"
export OPENER="xdg-open"

# man page colors
# Start blinking
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
# Start bold
export LESS_TERMCAP_md=$(tput bold; tput setaf 2) # green
# Start stand out
export LESS_TERMCAP_so=$(tput bold; tput setaf 3) # yellow
# End standout
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
# Start underline
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1) # red
# End Underline
export LESS_TERMCAP_ue=$(tput sgr0)
# End bold, blinking, standout, underline
export LESS_TERMCAP_me=$(tput sgr0)
