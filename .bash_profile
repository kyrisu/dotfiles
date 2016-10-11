#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx && ~/.i3/bin/session lock

###-tns-completion-start-###
if [ -f /home/kyrisu/.tnsrc ]; then
    source /home/kyrisu/.tnsrc
fi
###-tns-completion-end-###
