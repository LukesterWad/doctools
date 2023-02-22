#! /bin/sh

options=(
  "backup"
  "diff"
  "permit"
  "todo"
  "update"
)

if [[ "${1}" == "--options" ]]
then
  echo "${options[@]}"
  exit 0
fi

result="$(for option in "${options[@]}"; do echo "${option}"; done | fzf -1 -0 --exact --query="^${@}")"

if [[ "${result}" != "" && "$(cat "${HOME}/.config/doctools.conf" | wc -l)" == "2" ]]
then
  ldir="$(head -n 1 "${HOME}/.config/doctools.conf")"
  bdir="$(tail -n 1 "${HOME}/.config/doctools.conf")"
  ./scripts/${result}.sh "${ldir}" "${bdir}"
fi
