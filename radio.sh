#!/bin/bash

# count radio stations
grep "\- id:" ./_data/radios.yml | sed -e 's/- id://' -e '/nhk/d' > dtlist

DT=`cat dtlist | wc -l`
OTHER=`ls ./radio | wc -l`
ALL=`expr $DT + $OTHER`
DATACOUNT="	登録ラジオ局数： ""`echo $ALL`""件"
awk --assign awk_datacount="$DATACOUNT" '{
		sub(/^.*登録ラジオ局数.*$/, awk_datacount); 
		print $0
	}' ./_layouts/radio.html > ./_layouts/radio.html-count
	mv ./_layouts/radio.html-count ./_layouts/radio.html

# add new md files
L=1
while [ $L -le $DT ]; do
  ID="`sed -n $L'p' dtlist`"
  if [ -z "`find ./_radios -name $ID.md`" ]; then
  echo -e "---\\nlayout: muse\\nradio: $ID\\ndate: `date +%Y-%m-%dT%TZ`\\n---" > ./_radios/`echo $ID`.md
  fi
  L=$(( $L + 1 ))
done

# rm outdated md files
ls ./_radios | sed -e 's/.md *//g' > mdlist

MD=`cat mdlist | wc -l`
L=1
while [ $L -le $MD ]; do
  ID="`sed -n $L'p' mdlist`"
  if [ -z "`grep $ID dtlist`" ]; then
  	echo -e `echo $ID`.md >> radio_removed
  	rm ./_radios/`echo $ID`.md
  fi
  L=$(( $L + 1 ))
done

# rm temp files
rm dtlist mdlist

