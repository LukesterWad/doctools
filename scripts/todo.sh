#! /bin/sh

IFS=$'\n'

outputnum=1
searchdir="${1}"

for i in $(find "${searchdir}" -type f)
do
  output=$(grep -e "\!TODO: " "${i}")
  if [[ "${output}" != "" && "$(echo "${i}" | sed -e "/^.*todo.sh$/d")" != "" ]]; then
    lines=$(echo "${output}" | wc -l)
    echo "${outputnum}: (${lines}) $(echo ${i} | sed -e "s:${searchdir}:L:")"
    outputnum=$((${outputnum}+1))
  fi
done
