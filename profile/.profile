# Add scripts dir to $PATH
PATH="$PATH:$HOME/scripts"

# Get OS name
if [ -f /etc/os-release ]; then
  . /etc/os-release
  export DISTRO=$NAME
fi

# run dwm status script
dwm-status.sh &
# call slock on screensaver or suspend
xss-lock slock &
mpd &
# run display fallback daemon
disp_fallbackd.sh &
# set custom keymap if available
xkbcomp ~/.config/xkb/keymap.xkb $DISPLAY
# Set only external monitor if connected
xrandr_util.sh -s
# attach to existing tmux session if one exists else create one
if tmux ls ; then
  st -f Terminus:size=12 -e tmux attach &
else
  st -f Terminus:size=12 -e tmux &
fi
