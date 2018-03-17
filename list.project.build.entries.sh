#!/bin/bash

./get.ticket.ids.sh $1
echo "{" > $1.builds
cat all.tickets | while read ticket
do
  _t=`echo $ticket | tr -d \"`
  ./list.build.entries.sh $_t >> $1.builds
done
echo "}" >> $1.builds

cat $1.builds | tr -d \\n | sed -e "s/,\]/\]/g;s/,\}/\}/g"  | jq '.'

