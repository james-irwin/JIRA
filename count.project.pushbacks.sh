#!/bin/bash

./get.ticket.ids.sh $1
cat all.tickets | while read ticket
do
  _t=`echo $ticket | tr -d \"`
  ./count.pushbacks.sh $_t
done
