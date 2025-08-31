#!/bin/bash
# /usr/local/bin/fake-traffic.sh


sites=("https://www.google.com" "https://www.wikipedia.org" "https://www.cloudflare.com")


for site in "${sites[@]}"; do
    
    sleep $((RANDOM % 10 + 1))
    curl -s -o /dev/null "$site"
done


count=$((RANDOM % 10 + 5)) 
for i in $(seq 1 $count); do
    sleep $((RANDOM % 5 + 1))
    ping -c 1 8.8.8.8 > /dev/null
done


echo "$(date): Fake traffic executed" >> /var/log/fake-traffic.log

