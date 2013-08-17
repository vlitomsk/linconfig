#!/bin/bash

time=$(date +%H)

URL="http://informer.gismeteo.ru/xml/28698_1.xml"
EXEC="/usr/bin/curl -s"

a=`$EXEC $URL`

#температура
echo $a | tr "/>" "\n" | grep HEAT | sed -n 1p | sed -e 's/<HEAT //' |\
sed -e 's/"//g' | tr -d "min=" | tr -d "max=" | sed -e 's/ //' |\
sed -e 's/ /../' | gawk '{ print "Темп.",$1,"°C" }'

#ветер
WIND_DIRECTION=`echo -e $a | tr "/>" "\n" | grep WIND | sed -n 1p | sed -e 's/<WIND //' |\
sed -e 's/"//g' | tr -d "direction=" | sed -e 's/ //' |\
gawk '{ print $3 }'`

WDN[0]="С"
WDN[1]="С-В"
WDN[2]="В"
WDN[3]="Ю-В"
WDN[4]="Ю"
WDN[5]="Ю-З"
WDN[6]="З"
WDN[7]="С-З"

WIND=`echo -ne $a | tr "/>" "\n" | grep WIND | sed -n 1p | sed -e 's/<WIND //' |\
sed -e 's/"//g' | tr -d "min=" | tr -d "max=" | sed -e 's/ //' |\
gawk '{ print "Ветер",($1+$2)/2,"м/с"}'`

echo $WIND ${WDN[$WIND_DIRECTION]}

#давление
echo $a | tr "/>" "\n" | grep PRESSURE | sed -n 1p | sed -e 's/<PRESSURE //' |\
sed -e 's/"//g' | tr -d "min=" | tr -d "max=" | sed -e 's/ //' |\
gawk '{ print "Давл.",($1+$2)/2,"мм" }'
