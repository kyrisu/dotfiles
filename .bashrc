#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# BASH profiling start
#PS4='+ $(date "+%s.%N")\011 '
#exec 3>&2 2>/tmp/bashstart.$$.log
#set -x

export EDITOR=nvim
export PATH=$PATH:~/bin/:~/.local/bin/:~/bin/android-sdk-linux/tools:~/bin/android-sdk-linux/platform-tools

#dynamic colors

export PATH="$HOME/.dynamic-colors/bin:$PATH"
source $HOME/.dynamic-colors/completions/dynamic-colors.bash

# METEOR
export PATH=$PATH:$HOME/.meteor

# java
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
#export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'

alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias pacman-disowned-dirs="comm -23 <(sudo find / \( -path '/dev' -o -path '/sys' -o -path '/run' -o -path '/tmp' -o -path '/mnt' -o -path '/srv' -o -path '/proc' -o -path '/boot' -o -path '/home' -o -path '/root' -o -path '/media' -o -path '/var/lib/pacman' -o -path '/var/cache/pacman' \) -prune -o -type d -print | sed 's/\([^/]\)$/\1\//' | sort -u) <(pacman -Qlq | sort -u)"

alias psc='ps xawf -eo pid,user,cgroup,args'

alias pacman='pacman --color auto'
alias grepc='grep --color -n --exclude-dir="node_modules" --exclude-dir="bower_components" --exclude-dir=".tmp" --exclude-dir="coverage" --exclude="bundle.js*"'

# docker aliases
alias dl='docker ps -l -q'
alias dps='docker ps'
alias dockip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

alias dc="docker-compose"

# git aliases
alias gst='git status'

alias pygjs='pygmentize -f terminal -l js'

alias server='python -m SimpleHTTPServer'

# node aliasees
alias watch_todos="WATCH='\"src/**/*\"' chokidar --silent $WATCH --initial -c \"clear && leasot $WATCH -S --ignore node_modules\""

# utilities
alias whereami='geoiplookup $(curl ifconfig.io 2> /dev/null)'
alias beep='paplay /usr/share/sounds/freedesktop/stereo/complete.oga'

# soft aliases

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
    satrails)
      cd ~/dev/satrails/${2}
      ;;
    born)
      cd ~/dev/BORN/${2}
      ;;
    insendi)
      cd ~/dev/insendi/${2}
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
[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion
[ -f /usr/share/git/completion/git-completion.bash ] && . /usr/share/git/completion/git-completion.bash
[ -f /usr/share/git/completion/git-prompt.sh ] && . /usr/share/git/completion/git-prompt.sh
[ -f ~/.dotfiles/completions/purevpn.sh ] && . ~/.dotfiles/completions/purevpn.sh
[ -f /usr/share/bash-completion/completions/docker-compose ] && . /usr/share/bash-completion/completions/docker-compose
[ -f /usr/share/bash-completion/completions/docker ] && . /usr/share/bash-completion/completions/docker

complete -F _docker_compose dc
complete -F _docker_exec dockip

#PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

#export CATALINA_HOME=/usr/share/tomcat8

export PS1='\e[22m`if [ $? = 0 ]; then echo "\[\e[32m\] ✔ "; else echo "\[\e[31m\] ✘ "; fi`\[\e[00;37m\]\u@\h \[\e[01;34m\]\W\e[35m$(__git_ps1 " (%s)")\n\[\e[00;39m\]\$ '

export ANDROID_HOME=~/bin/android-sdk-linux

# Hook for desk activation
[ ! -z "$DESK_ENV" ] && source "$DESK_ENV"

# node
. /usr/share/nvm/init-nvm.sh
#export NVM_NODEJS_ORG_MIRROR=https://nodejs.org/dist
export NVM_DIR="/home/kyrisu/.nvm"


# gruvbox console colors
#~/bin/gruvbox_256palette.sh

# command not found hook
[ -r /usr/share/doc/pkgfile/command-not-found.bash ] && . /usr/share/doc/pkgfile/command-not-found.bash

# prepend cd to the path
shopt -s autocd

# hisory config
HISTTIMEFORMAT='%F %T '
HISTFILESIZE=-1
HISTSIZE=-1
HISTCONTROL=ignoredups
HISTIGNORE=?:??
shopt -s histappend                 # append to history, don't overwrite it
# attempt to save all lines of a multiple-line command in the same history entry
shopt -s cmdhist
# save multi-line commands to the history with embedded newlines
shopt -s lithist

# get help for command pressing ALT+h
bind '"\eh": "\C-a\eb\ed\C-y\e#man \C-y\C-m\C-p\C-p\C-a\C-d\C-e"'

man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

export FZF_DEFAULT_COMMAND='ag -Q -g ""'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# export WORKON_HOME=~/.virtualenvs
# source /usr/bin/virtualenvwrapper.sh

# BASH profiling end
#set +x
#exec 2>&3 3>&-

dynamic-colors switch solarized-dark

export AWS_PROFILE=insendi-admin
export AWS_DEFAULT_REGION=eu-west-1
