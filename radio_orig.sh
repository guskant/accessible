#!/bin/bash
#rm ./_radios/*
grep "\- id:" ./_data/radios.yml | sed 's/- id://' > dtlist
ALL=`cat dtlist | wc -l`
L=1
while [ $L -le $ALL ]; do
  ID="`sed -n $L'p' dtlist`"
  echo -e ---\\nlayout: muse\\nradio: $ID\\n--- > ./_radios/`echo $ID`.md
#  L=`expr $L + 1`
  L=$(( $L + 1 ))
done
rm ./_radios/nhk*
