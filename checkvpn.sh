#!/bin/bash

cache_file="/tmp/freedom_flag"
expire=60

if [[ -f $cache_file && $(($(date +%s) - $(stat -c %Y "$cache_file"))) -lt $expire ]]; then
    stat=$(cat $cache_file)
else
    country=$(curl -s --max-time 5 https://ipapi.co/country/)
    free_net=("HK" "US" "JP" "TW" "DE" "FR" "CA" "GB" "SG")

    stat=' '
    for code in "${free_net[@]}"; do
        if [[ "$country" == "$code" ]]; then
            stat=' '
            break
        fi
    done
    echo "$stat" > "$cache_file"
fi

echo -e "$stat"
