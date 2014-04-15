#!/bin/sh

FONT='-artwiz-cure-medium-r-normal--11-110-75-75-p-90-iso8859-1'


STAT_BEFORE=`cat /proc/stat | head -n 5`


getCoreLoadPercent() {
    CORE=$1

    BEFORE=`echo "$STAT_BEFORE" | grep "^cpu$CORE "`
    AFTER=`echo "$STAT_AFTER" | grep "^cpu$CORE "`

    USER0=`echo "$BEFORE" | awk '{ print $2 }'`
    USER1=`echo "$AFTER" | awk '{ print $2 }'`
    NICE0=`echo "$BEFORE" | awk '{ print $3 }'`
    NICE1=`echo "$AFTER" | awk '{ print $3 }'`
    SYST0=`echo "$BEFORE" | awk '{ print $4 }'`
    SYST1=`echo "$AFTER" | awk '{ print $4 }'`
    IDLE0=`echo "$BEFORE" | awk '{ print $5 }'`
    IDLE1=`echo "$AFTER" | awk '{ print $5 }'`

    USER=`expr $USER1 - $USER0`
    NICE=`expr $NICE1 - $NICE0`
    SYST=`expr $SYST1 - $SYST0`
    IDLE=`expr $IDLE1 - $IDLE0`

    TOTAL=`expr $USER + $NICE + $SYST + $IDLE`
    USED=`expr $USER + $NICE + $SYST`

    echo "$USED * 100 / $TOTAL" | bc
}

getCpuload() {
    STAT_AFTER=`cat /proc/stat | head -n 5`
    CORE0=`getCoreLoadPercent 0`
    CORE1=`getCoreLoadPercent 1`

    STAT_BEFORE=$STAT_AFTER
    if [ $CORE0 -lt 90 ]; then
    echo -ne "\x07\x01 CPU: "
    echo -ne $CORE0%
    echo -ne " / "
    echo -ne $CORE1%
    else 
    echo -ne "\x07\x01 CPU: "
    echo -ne "\x06$CORE0%"
    echo -ne " / "
    echo -ne "\x06$CORE1%"
    fi 
}
getTemp() {
		echo -ne " \x07\x01 "
    CPU_TEMP=`sensors | grep Th1H | awk '{ print $2 }'`
    echo -ne "CPU: "
    if [ `sensors | grep Th1H | awk '{ print $2 }' | sed 's/.\(.*\)/\1/' | sed 's/\(.*\)..../\1/'` -gt 80 ]; then				
		    echo -ne "\x06$CPU_TEMP"
    else
				echo -ne "$CPU_TEMP"
		fi
}
getFan() {
		FAN=`sensors | grep Exhaust | awk '{ print $3 }'`
		echo -ne " \x07\x01 $FAN"
		echo -ne " rpm"
		#when is it too much rpm ? :D
}

getMem() {
		echo -ne " \x07\x01 "
    # %
    MEM_USAGE_PERCENT=`free -om | awk '/Mem:/ {print int(($3 - $7 - $6) / $2  * 100)}'`
    # Mb
    MEM_USAGE_MB=`free -om | awk '/Mem:/ {print int($3 - $7 - $6)}'`
    if [ $MEM_USAGE_PERCENT -gt 90 ]; then
		echo -ne "\x06$MEM_USAGE_PERCENT%\x01 [$MEM_USAGE_MB MB]"
    else
		echo -ne "$MEM_USAGE_PERCENT% [$MEM_USAGE_MB MB]"
    fi
}
# i had to make changes after installing cw, an output colorizer.
getFs() {
    TAKEN=`df -h | grep /dev/root | awk '{ print $5 }'`
		echo -ne " \x07\x01 "
    if [ `df -h  | grep /dev/root | awk '{ print $5 }' | sed 's/\(.*\)./\1/'` -gt 90 ]; then
				echo -ne "\x06$TAKEN "
		else
				echo -ne "$TAKEN " 
    fi
}

#INTERFACE=wlan0
# Here we remember the previous rx/tx counts
#RXB=`cat /sys/class/net/$INTERFACE/statistics/rx_bytes`
#TXB=`cat /sys/class/net/$INTERFACE/statistics/tx_bytes`
#
#getNet() {
#    RXBN=`cat /sys/class/net/$INTERFACE/statistics/rx_bytes`
#    TXBN=`cat /sys/class/net/$INTERFACE/statistics/tx_bytes`
#
#    RXR=`echo "($RXBN - $RXB) / 1024 / $SLEEP" | bc -l | xargs printf "%.2f"`
#    TXR=`echo "($TXBN - $TXB) / 1024 / $SLEEP" | bc -l | xargs printf "%.2f"`
#    echo -ne "\x07\x01 $RXR kB/s \x07\x01 $TXR kB/s "
#
#    # reset old rates
#    RXB=$RXBN; TXB=$TXBN
#} => not really useful for me but works 
getVolume() {
    MIXER="Master"
		VOLUME=`amixer sget $MIXER  | grep Mono\: | sed -e s/"  Mono: Playback [0-9]* \["// -e s/"\%.*"//`
		if [ "`amixer -q | grep Mono | awk '{ print $6 }' | grep on | wc -l`" != 1 ]; then
		    echo -ne " \x07¤\x01 $VOLUME%"
    elif [ $VOLUME -lt 10 ]; then
		    echo -ne "\x07£\x01 $VOLUME%"
    elif [ $VOLUME -lt 40 ]; then
		    echo -ne "\x07¢\x01 $VOLUME%"
    elif [ $VOLUME -lt 80 ]; then
		    echo -ne "\x07\x01 $VOLUME%"
		else
		    echo -ne "\x07¡\x01 $VOLUME%"
    fi
}
getMpd() {

		if [ "`mpc | grep playing | awk '{ print $2 }' | wc -l`" != 1 ]; then
				echo -ne "\x07\x01 Music Paused"
    else
				if [ `mpc | grep playing | awk '{ print $4 }' | sed 's/.\(.*\)/\1/' | sed 's/\(.*\)../\1/'` = 100 ]; then
				echo -ne "\x07\x06 `mpc | head -n 1 |cut -c 1-200`"
				mpc_time="`mpc | grep playing | awk '{ print $3 }'`"
			  echo -ne " \x06[$mpc_time]"	
		    else
				echo -ne "\x07\x01 `mpc | head -n 1 |cut -c 1-200`"
				mpc_time="`mpc | grep playing | awk '{ print $3 }'`"
			  echo -ne " [$mpc_time]"	
				fi
		fi
}
getDate() { 
    date_format="%H:%M %A %d %B"
		date_command=$(date +"$date_format")
		time=$(date | awk '{ print $4 }' | sed 's/......\(.*\)/\1/')
		if [ $time = "00" ]; then
		echo -ne "\x06\x01 $date_command "
    else
		echo -ne "\x07\x01 $date_command "
    fi
}
getBattery() {
		
		STATEFILE='/proc/acpi/battery/BAT0/state' # battery's state file
    INFOFILE='/proc/acpi/battery/BAT0/info'   # battery's info file
    # check if battery's charging
    CHARG=`cat $STATEFILE | grep charging | awk '{ print $3 }'`;
    # look up battery's data
    BAT_FULL=`cat $INFOFILE|grep design|line|cut -d " " -f 11`;
    RCAP=`cat $STATEFILE|grep remaining|cut -d " " -f 8`;
 
    # calculate remaining power
    RPERCT=`expr $RCAP \* 100`;
    RPERC=`expr $RPERCT / $BAT_FULL`;
 
 if   [[ $RPERC -lt 10 && $CHARG = "discharging" ]]; then
		echo -ne  "\x07 \x01 $RPERC% "
    send-notify Low Battery
 elif [[ $RPERC -lt 30 && $CHARG = "discharging" ]]; then
		echo -ne  "\x07\x01 $RPERC% "	
 elif [[ $RPERC -lt 50 && $CHARG = "discharging" ]]; then
		echo -ne  "\x07\x01 $RPERC% "	
 elif [[ $RPERC -lt 60 && $CHARG = "discharging" ]]; then
		echo -ne  "\x07\x01 $RPERC% "	
 elif [[ $RPERC -lt 70 && $CHARG = "discharging" ]]; then
		echo -ne  "\x07\x01 $RPERC% "	
 elif [[ $RPERC -lt 80 && $CHARG = "discharging" ]]; then
		echo -ne  "\x07\x01 $RPERC% "	
 elif [[ $RPERC -lt 100 && $CHARG = "discharging" ]]; then
		echo -ne  "\x07\x01 $RPERC% "	
 elif [ $RPERC = 99 ]; then
		echo -ne  "\x06\x01 100% "	
 else
 		 echo -ne  "\x07\x01 $RPERC% "
 fi
}
getMail() {
    mail_count=`curl -s https://username:password@mail.google.com/mail/feed/atom | sed -n '/^<fullcount>\([0-9]*\)<\/fullcount>$/s//\1/p'`
		echo -ne "\x07 \x01 $mail_count Unread " 
}

xsetroot -name "$(getMpd)$(getVolume)$(getMail)$(getBattery)$(getCpuload)$(getTemp)$(getFan)$(getMem)$(getFs)$(getDate)" 
