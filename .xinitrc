#!/usr/sh

xrdb -merge ~/.Xresources

# xrandr --output HDMI-0 --auto --primary
# xrandr --output DP-4 --auto --right-of HDMI-0

# xrandr --dpi 96

# export KDEWM=openbox

nvidia-settings --load-config-only

# essentials
# ----------

picom &  # compositor
~/.fehbg &  # wallpaper
#nm-applet &  # network manager
#pasystray &  # audio manager
dunst &  # notification manager
tint2 &  # taskbar
#/usr/lib/geoclue-2.0/demos/agent &  # location service
#redshift-gtk &  # screen color temperature

exec dbus-launch openbox-session
# exec startplasma-x11
