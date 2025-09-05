#!/usr/bin/env bash

REMOTE_IP=" your remote servers ip "
PING_COUNT=3
SLEEP_INTERVAL=60
LOG_FILE="/var/log/ping_check.log


BOT_TOKEN=" your telegrem bot token "
CHAT_ID=" your telegram bot chat id "


send_telegram() {
    MESSAGE="$1"
    curl -s -X POST="https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
         -d chat_id="$CHAT_ID" \
         -d text="$MESSAGE" >/dev/null
}



while true: do
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

    if ping -c "$PING_COUNT" "$REMOTE_IP" > /dev/null 2>&1; then
        echo "[$TIMESTAMP]   CONNECTION IS OK - $REMOTE_IP REACHABLE" >> "$LOG_FILE"
    else
        MSG="[$TIMESTAMP]   🚨 ALERT: CONNECTION FAILED - $REMOTE_IP UNREACHABLE!!!!"
        echo "$MSG" >> "$LOG_FILE"
        send_telegram "$MSG"
    fi


    
    sleep "$SLEEP_INTERVAL"
done 
