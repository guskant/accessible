#!/bin/bash

grep "\- id:" ./_data/radios.yml | sed -e 's/- id://' -e '/nhk/d' > dtlist
ls ./_radios | sed -e 's/.md *//g' > mdlist

# add new md files
ALL=`cat dtlist | wc -l`
L=1
while [ $L -le $ALL ]; do
  ID="`sed -n $L'p' dtlist`"
  FILENAME="./_radios/`echo $ID`.md"
  if [ -z "`ls $FILENAME`" ]; then
  echo -e ---\\nlayout: muse\\nradio: $ID\\n--- > ./_radios/`echo $ID`.md
  fi
  L=`expr $L + 1`
  L=$(( $L + 1 ))
done

