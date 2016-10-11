# vim: ft=sh
xrdb -merge ~/.Xresources
#source ./.profile

# source fonts
#xset +fp /usr/share/fonts/local &
#xset fp rehash &

# Set some defaults
export BROWSER=chrome &
export EDITOR=nvim &

#start-pulseaudio-x11 &
# set background
#feh --bg-scale ~/pictures/level_up_by_deadslug.jpg

# disable touchpad for 0.5 sec after keypress
#syndaemon -K -i 0.5 -R -d

# fix for java apps not knowsing what dwm is
#wmname LG3D

#eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
#export SSH_AUTH_SOCK

#export `grep ^DBUS_SESSION_BUS ~/.dbus/session-bus/*-0`

~/.i3/bin/session lock &
~/bin/stick_toggle &

while true; do
  #exec dbus-launch --exit-with-session /usr/bin/i3 &> ~/i3.log
  #exec dbus-launch --exit-with-session /usr/bin/i3 -V -d all >~/i3log-$(date +'%F-%k-%M-%S') 2>&1
  #exec /usr/bin/i3 -V &> ~/i3.log
  exec /usr/bin/i3 &> ~/i3.log
done
