#!/bin/bash

cd ./_notes
if [ $1 = "radiodata" ]; then
	DATE="datadate: `stat --format=%y ../_data/radios.yml | sed -e 'y/ /T/' -e 's/\..*$/Z/'`"
	awk --assign awk_date="$DATE" '{
		sub(/^datadate: .*$/, awk_date); 
		print $0
		}' radio.md > radio.md-date
	mv radio.md-date radio.md
else
	DATE="date: `stat --format=%y $1 | sed -e 'y/ /T/' -e 's/\..*$/Z/'`"
	awk --assign awk_date="$DATE" '{
		sub(/^date: .*$/, awk_date); 
		print $0
		}' $1 > $1-date
	mv $1-date $1
fi
cd -

