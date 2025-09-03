#!/bin/bash
# Script to restart 3x-ui service


LOG_FILE="/var/log/x-ui-restart.log"

# If log file is older than 7 days, truncate it
if [ -f "$LOG_FILE" ] && [ "$(find "$LOG_FILE" -mtime +2)" ]; then
    > "$LOG_FILE"
fi


systemctl restart x-ui

echo "$(date '+%Y-%m-%d %H:%M:%S') - x-ui restarted" >> "$LOG_FILE"

#echo "$(date '+%Y-%m-%d %H:%M:%S') - x-ui restarted" >> /var/log/x-ui-restart.log

