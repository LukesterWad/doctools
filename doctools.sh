#! /bin/sh

options=(
  "backup"
  "diff"
  "permit"
  "swap"
  "todo"
  "update"
)

if [[ "${1}" == "--options" ]]
then
  echo "${options[@]}"
  exit 0
fi

result="$(for option in "${options[@]}"; do echo "${option}"; done | fzf -1 -0 --exact --query="^${@}")"

if [[ "${result}" != "" ]]
then
  ldir="$(head -n 1 "${HOME}/.config/doctools.conf")"
  bdir="$(tail -n 1 "${HOME}/.config/doctools.conf")"
  ./scripts/${result}.sh "${ldir}" "${bdir}"
fi
