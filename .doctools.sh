#! /bin/sh

options=(
  "diff"
  "backup"
  "update"
  "todo"
  "permit"
)

result="$(for option in "${options[@]}"; do echo "${option}"; done | rofi -dmenu)"

if [[ "${result}" != "" ]]
then
  ldir="$(head -n 1 "${HOME}/.config/doctools.conf")"
  bdir="$(tail -n 1 "${HOME}/.config/doctools.conf")"
  ./scripts/${result}.sh "${ldir}" "${bdir}"
fi
