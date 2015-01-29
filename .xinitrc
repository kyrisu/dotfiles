xrdb -merge ~/.Xresources
source ./.profile

# source fonts
#xset +fp /usr/share/fonts/local &
#xset fp rehash &

# Set some defaults 
export BROWSER=chromium & 
export EDITOR=vim &

#start-pulseaudio-x11 &
# set background
feh --bg-scale ~/pictures/level_up_by_deadslug.jpg

dwmstatus &

# disable touchpad for 0.5 sec after keypress
syndaemon -K -i 0.5 -R -d

# fix for java apps not knowsing what dwm is
wmname LG3D

nm-applet &
clipit &
dropboxd &

while true; do
    dwm 2> ~/dwm.log
done
