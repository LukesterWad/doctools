#! /bin/sh

ldir="${1}"
bdir="${2}"

if [[ "$(./scripts/diff.sh "${ldir}/" "${bdir}/")" != "" ]]; then
  echo "backing up"
  rsync -rtuv ${ldir}/* ${bdir}/
fi
