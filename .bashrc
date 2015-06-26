#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vim
export PATH=$PATH:~/bin/
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

# soft aliases
alias gn1='geeknote find --tags 1-Now'
alias gn2='geeknote find --tags 2-Next'

PS1='[\u@\h \W]\$ '


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
    algo/*)
      cd ~/dev/Algotech/${1#*/}
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
if [ -f /path/to/meteorite/completions/mrt.bash ]; then
  . ~/.dotfiles/completions/meteor.bash
fi

PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
