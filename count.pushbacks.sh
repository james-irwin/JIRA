#!/bin/bash

#$1 is the ticket ID

# Counting Test to Build (others are possible ...)

curl -s -u $user:$pass -X GET -H "Content-Type: application/json" "https://$jira-server/jira/rest/api/2/issue/$1?expand=changelog" -o ticket.json

echo -n $1 Test to Build pushbacks:
cat ticket.json | jq '.changelog.histories[] | .items[] | [.toString, .fromString]'  | jq '(.[0]=="Build" and .[1]=="Test")' | grep true | wc -l

