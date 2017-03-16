#!/bin/bash

# add new md files
grep "\- id:" ./_data/radios.yml | sed -e 's/- id://' -e '/nhk/d' > dtlist

ALL=`cat dtlist | wc -l`
L=1
while [ $L -le $ALL ]; do
  ID="`sed -n $L'p' dtlist`"
  if [ -z "`find ./_radios -name $ID.md`" ]; then
  echo -e "---\\nlayout: muse\\nradio: $ID\\ndate: `date +%Y-%m-%dT%TZ`\\n---" > ./_radios/`echo $ID`.md
  fi
  L=$(( $L + 1 ))
done

# rm outdated md files
ls ./_radios | sed -e 's/.md *//g' > mdlist

ALL=`cat mdlist | wc -l`
L=1
while [ $L -le $ALL ]; do
  ID="`sed -n $L'p' mdlist`"
  if [ -z "`grep $ID dtlist`" ]; then
  	echo -e `echo $ID`.md >> radio_removed
  	rm ./_radios/`echo $ID`.md
  fi
  L=$(( $L + 1 ))
done

