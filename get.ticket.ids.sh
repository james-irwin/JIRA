#!/bin/bash

project=$1

curl -s -u $user:$pass -X GET -H "Content-Type: application/json" "https://$jira-server/jira/rest/api/2/search?jql=project=$project&maxResults=-1" -o all.data

cat all.data | jq '.issues[] | .key' > all.tickets

