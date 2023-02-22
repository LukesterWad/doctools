#! /bin/sh

IFS=$'\n'

searchdir="${1}"

for i in $(find "${searchdir}" -type f)
do
  if [[ "$(echo "${i}" | grep -e "${searchdir}/.*/")" != "" && "$(echo "${i}" | grep -e "${searchdir}/Recreation/Code/.*")" == "" ]]; then
    if [[ "$(ls -la "${i}" | grep -e "^-rw-r--r--")" == "" ]]; then
      echo "Cleaning $(echo "${i}" | sed -e "s:${searchdir}::") ..."
      chmod 644 "${i}"
    fi
  fi
done
