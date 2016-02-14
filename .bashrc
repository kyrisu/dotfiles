#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=nvim
export PATH=$PATH:~/bin/:~/bin/android-sdk-linux/tools:~/bin/android-sdk-linux/platform-tools
# export CDPATH=.:~/dev:~/dev/Algotech

# java
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'

alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias pacman-disowned-dirs="comm -23 <(sudo find / \( -path '/dev' -o -path '/sys' -o -path '/run' -o -path '/tmp' -o -path '/mnt' -o -path '/srv' -o -path '/proc' -o -path '/boot' -o -path '/home' -o -path '/root' -o -path '/media' -o -path '/var/lib/pacman' -o -path '/var/cache/pacman' \) -prune -o -type d -print | sed 's/\([^/]\)$/\1\//' | sort -u) <(pacman -Qlq | sort -u)"

alias psc='ps xawf -eo pid,user,cgroup,args'

# docker aliases
alias dl='docker ps -l -q'
alias dps='docker ps'
alias dockip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias dc="docker-compose"

# soft aliases
alias gn1='geeknote find --tags 1-Now'
alias gn2='geeknote find --tags 2-Next'

#export TERM=urxvtc


go () 
{ 
  CURPWD=$PWD;
  case "$1" in 
    downloads)
      cd ~/Downloads
      ;;
    logs)
      cd ~/logs
      ;;
    algo)
      cd ~/dev/Algotech/${2}
      ;;
    [\/\.-]*)
      cd $1
      ;;
    *)
      cd ~/dev/$1
      ;;
  esac;
  if [ $CURPWD != $PWD ]; then
    echo;
    echo "$OLDPWD ==> $PWD";
    echo;
  fi
}

# completions
if [ -f /usr/share/git/completion/git-completion.bash ]; then
  . /usr/share/git/completion/git-completion.bash
fi

if [ -f ~/.dotfiles/completions/purevpn.sh ]; then
  . ~/.dotfiles/completions/purevpn.sh
fi

# completions that didn't load for some reason

. /usr/share/bash-completion/completions/netctl

#PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

export CATALINA_HOME=/usr/share/tomcat8

export UA_FOLDER=/home/kyrisu/dev/Algotech/unifiedagent/unifiedagent_java/src/main/java

. /usr/share/git/completion/git-prompt.sh

#PS1='[\u@\h \W]\n\$ '
#PS1='[\u@\h [$MAGENTA]\W$(__git_ps1 " (%s)")]\[$WHITE]$ '
#PS1='\u@\h \W\e[35m$(__git_ps1 " (%s)")\e[39m$ '
#export PS1='`if [ $? = 0 ]; then echo "\[\033[01;32m\]✔"; else echo "\[\033[01;31m\]✘"; fi` \[\033[01;30m\]\h\[\033[01;34m\] \w\[\033[35m\]$(__git_ps1 " %s") \[\033[01;30m\]>\[\033[00m\] '
#export PS1='\[\e[01;30m\]\t`if [ $? = 0 ]; then echo "\[\e[32m\] ✔ "; else echo "\[\e[31m\] ✘ "; fi`\[\e[00;37m\]\u\[\e[01;37m\]:`[[ $(git status 2> /dev/null | head -n3 | tail -n1) != "Changes to be committed:" ]] && echo "\[\e[31m\]" || echo "\[\e[33m\]"``[[ $(git status 2> /dev/null | head -n3 | tail -n1) != "nothing to commit (working directory clean)" ]] || echo "\[\e[32m\]"`$(__git_ps1 "(%s)\[\e[00m\]")\[\e[01;34m\]\w\[\e[00m\]\$ '
export PS1='\[\e[01;30m\]\t`if [ $? = 0 ]; then echo "\[\e[32m\] ✔ "; else echo "\[\e[31m\] ✘ "; fi`\[\e[00;37m\]\u@\h \[\e[01;34m\]\W\e[35m$(__git_ps1 " (%s)")\n\[\e[00;39m\]\$ '

export ANDROID_HOME=~/bin/android-sdk-linux

###-tns-completion-start-###
if [ -f /home/kyrisu/.tnsrc ]; then 
    source /home/kyrisu/.tnsrc 
fi
###-tns-completion-end-###
# Hook for desk activation
[ ! -z "$DESK_ENV" ] && source "$DESK_ENV"
