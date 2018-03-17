#!/bin/bash

#$1 is the ticket ID

# Emit tee vector of dates this ticket went into Build


curl -s -u $user:$pass -X GET -H "Content-Type: application/json" "https://$jira-server/jira/rest/api/2/issue/$1?expand=changelog" -o ticket.json

cat ticket.json  | jq '.changelog.histories[] | [.items[0].toString=="Build", .created]' |  tr -d \[ | tr -d \\n | tr \] \\n | grep true | sed -e 's/true,//' | sed -e 's/$/,/' > $1.dat

length=`cat $1.dat | wc -l`

if (test $length -ne "0") then
  echo -n '"'$1'":' "["
  cat $1.dat
  echo -n "],"
fi

rm $1.dat

