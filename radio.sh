#!/bin/bash
grep "\- id:" ./_data/radios.yml | sed 's/- id://' > temp
ALL=`cat temp | wc -l`
L=1
while [ $L -le $ALL ]; do
  ID="`sed -n $L'p' temp`"
  echo -e ---\\nlayout: muse\\nradio: $ID\\n--- > ./_radios/`echo $ID`.md
#  L=`expr $L + 1`
  L=$(( $L + 1 ))
done
rm temp ./_radios/nhk*
