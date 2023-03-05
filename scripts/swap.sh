#! /bin/sh

ldir="${1}"
bdir="${2}"

if [[ "$(pwd)" == "${ldir}"* ]]
then
  pwd | sed -e "s:${ldir}:${bdir}:"
else
  pwd | sed -e "s:${bdir}:${ldir}:"
fi
