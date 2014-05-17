#!/bin/zsh

# Configuration
DATE_FORMAT='%a %d %b %H:%M'
DZEN_ICONPATH=$HOME/.dotfiles/xbm
BG='#222222'
FG='#839496'
X=-580 # move from the right, so the status bar would be always aligned right. leave some space for systray
Y=0
HEIGHT=18
WIDTH=500 # adjust it if theres less items used to show in status bar
FONT='InconsolataSansMono:size=10'
# Main loop interval in seconds
INTERVAL=1

# Functions
fdate() {
    icon="^i($DZEN_ICONPATH/clock2.xbm)"
    today=$(date +$DATE_FORMAT)
    printf "^fg(white)%s %s^fg()" "$icon" "$today"
}

fgtime() {
    #echo -n "PL:" $(TZ='Europe/Warsaw' date +'%H:%M')
}

_kb_layout() {
    layout=`setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}'`
    layout=`echo $layout | tr '[a-z]' '[A-Z]'`
    print "^fg(white)%s^fg()" "$layout"
}

# BATTERY
fbattery() {
    ac=`acpi -a | grep on-line | wc -l`
    if [ $ac -gt 0 ]; then
        print "^i($DZEN_ICONPATH/power-ac.xbm)"
    else
        infos=$(acpi -b)
        percent=$(echo $infos|sed "s/Battery .: [a-z]*, \([0-9]*\)%\(,.*\|$\)/\1/i")
        state=$(echo $infos|sed "s/Battery .: \([a-z]*\),.*/\1/i")
        if [ "$percent" -lt 5 ]; then modifier="^bg(#dc322f)^fg(white)"
        elif [ "$percent" -lt 20 ]; then modifier="^bg(#cb4b16)^fg(white)"
        elif [ "$percent" -lt 50 ]; then modifier="^fg(#b58900)"
        else modifier="^fg(#859900)"
        fi

        percent="$percent%"

        sign="^i($DZEN_ICONPATH/power-bat.xbm)"

        print "$modifier^fg()^bg()" "$percent" "$sign"
    fi
}

# LOAD AVERAGE

fload() {
    load=$(awk '{print $1}' /proc/loadavg)
    icon="^i($DZEN_ICONPATH/load.xbm)"
    printf "%s%.01f %s^fg()" "^fg(#6c71c4)" "$load" "$icon"
}


fmem() {
    # MEMORY

    memory=$(free | awk '/buffers\/cache:/ {printf "%.0f", 100*$3/($3 + $4)}')
    if [ "$memory" -gt 90 ]; then modifier="^bg(#dc322f)^fg(white)"
    elif [ "$memory" -gt 80 ]; then modifier="^bg(#cb4b16)^fg(white)"
    elif [ "$memory" -gt 70 ]; then modifier="^fg(#b58900)"
    else modifier="^fg(#859900)"
    fi

    icon="^i($DZEN_ICONPATH/mem.xbm)"
    printf "%s%s%% %s^fg()^bg()" "$modifier" "$memory" "$icon"
}

_cpu_temp() {
    # CPUs temp
    temp=$(sensors | grep 'Core 2' | awk -F+ '{print $2}' | awk -F. '{print $1}')
    if [ "$temp" -gt 80 ]; then
        modifier='^bg(#dc322f)^fg(white)'
    elif [ "$temp" -gt 60 ]; then
        modifier='^fg(#b58900)'
    else
        modifier='^fg(#859900)'
    fi
    printf "%s%s°C^fg()^bg()" "$modifier" "$temp"
}

_sound() {
    on=`amixer get Master | awk -F '[' '{print $4}' | grep on | wc -l`
    if [ $on -gt 0 ]; then
        percent=$(amixer get Master | awk -F '[' '{print $2}' | grep '%' | awk -F '%' '{print $1}')
        print "^i($DZEN_ICONPATH/vol-hi.xbm)" "$percent%"
    else
        print "^i($DZEN_ICONPATH/vol-mute.xbm)"
    fi
}

_active_network_interface() {
    ACTIVE="none" # default to eth0 in case if none active
    for iface in  `ifconfig | egrep 'eth[0-9]|wlp[0-9]s[0-9]|enp[0-9]s[0-9]|ppp[0-9]' | awk -F': ' '{print $1}'` ; do
        ifconfig $iface | grep -q 'inet ' && ACTIVE="$iface"
    done

    echo $ACTIVE
}

# network interface active
CURR_IFACE=$(_active_network_interface)

# Here we remember the previous rx/tx counts
RXB=`cat /sys/class/net/${CURR_IFACE}/statistics/rx_bytes`
TXB=`cat /sys/class/net/${CURR_IFACE}/statistics/tx_bytes`

# will check and update unread count every minute
UNREAD_GEDI=0

while true; do
    PGTIME=$(fgtime)
    PDATE=$(fdate)
    PBAT=$(fbattery)
    LOAD=$(fload)
    MEM=$(fmem)
    TEMP=$(_cpu_temp)
    SOUND=$(_sound)
    KB_LAYOUT=$(_kb_layout)

    # use active network interface
    CURR_IFACE=$(_active_network_interface)
    if [ "$CURR_IFACE" != "none" ]; then
        # get new rx/tx counts
        RXBN=`cat /sys/class/net/${CURR_IFACE}/statistics/rx_bytes`
        TXBN=`cat /sys/class/net/${CURR_IFACE}/statistics/tx_bytes`

        # calculate the rates
        # format the values to 4 digit fields
        RXR=$(printf "%4d\n" $(echo "($RXBN - $RXB) / 1024/${INTERVAL}" | bc))
        TXR=$(printf "%4d\n" $(echo "($TXBN - $TXB) / 1024/${INTERVAL}" | bc))

        if [ $RXR -eq 0 ]; then
            rxColor=""
        else
            rxColor="#859900"
        fi

        if [ $TXR -eq 0 ]; then
            txColor=""
        else
            txColor="#dc322f"
        fi

        if [ "$CURR_IFACE" = "wlp5s0" ]; then
            # wifi
            netIcon="$DZEN_ICONPATH/net-wifi5.xbm"
        else
            # wired
            netIcon="$DZEN_ICONPATH/net-wired2.xbm"
        fi

        # print out the rates with some nice formatting
        echo -n "^i($netIcon)^fg($rxColor)${RXR} K^p(3)^i($DZEN_ICONPATH/arr_down.xbm)^fg($txColor)${TXR} K^i($DZEN_ICONPATH/arr_up.xbm)^fg()"

        # reset old rates
        RXB=$RXBN; TXB=$TXBN
    else
        # not connected
        netIcon="$DZEN_ICONPATH/net-wired.xbm"
        echo -n "^i($netIcon)"
    fi
    # Arrange and print the status line
    print " $TEMP $PBAT $LOAD $MEM $SOUND | $PGTIME $PDATE"

    sleep $INTERVAL
done | dzen2 -x $X -y $Y -w $WIDTH -h $HEIGHT -bg $BG -fg $FG -ta r -fn $FONT -p
