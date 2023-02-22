#! /bin/sh

ldir="${1}"
bdir="${2}"

if [[ "$(./scripts/diff.sh "${ldir}" "${bdir}")" != "" ]]; then
  rsync -rtuv ${bdir}/* ${ldir}/
fi
