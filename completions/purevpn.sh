
_purevpn() {
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  opts="udp tcp"

  case "${prev}" in
    tcp)
      IFS=$'\n' tmp=( $(compgen -W "$(ls /etc/openvpn/purevpn/TCP/)" -- "${COMP_WORDS[$COMP_CWORD]}" ))
      COMPREPLY=( "${tmp[@]%.*}" )
      return 0
      ;;
    udp)
      IFS=$'\n' tmp=( $(compgen -W "$(ls /etc/openvpn/purevpn/UDP/)" -- "${COMP_WORDS[$COMP_CWORD]}" ))
      COMPREPLY=( "${tmp[@]%.*}" )
      return 0
      ;;
    *)
      ;;
  esac

  if [[ ${cur} == -* ]] ; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
  fi
}

complete -F _purevpn purevpn
