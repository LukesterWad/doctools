_dt() 
{
  local cur opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"

  opts="$(dt --options)"
  COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )

  return 0
}
complete -o nospace -F _dt dt
