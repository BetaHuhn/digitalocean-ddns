#!/bin/bash
API_TOKEN="F00B4R" #your api token
DOMAIN="foo.bar" #your domain
ID=123456 #your dns record id
IP=$(curl -s https://api.ipify.org?format=json | jq -r '.ip') #Get your external IP
curl -X PUT -H "Content-Type: application/json" -H 'Authorization: Bearer '"$API_TOKEN"' ' -d '{"data": "'"$IP"'"}' "https://api.digitalocean.com/v2/domains/$DOMAIN/records/$ID"
echo " "
