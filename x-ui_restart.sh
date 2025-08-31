#!/bin/bash
# Script to restart 3x-ui service


systemctl restart x-ui

echo "$(date '+%Y-%m-%d %H:%M:%S') - x-ui restarted" >> /var/log/x-ui-restart.log

