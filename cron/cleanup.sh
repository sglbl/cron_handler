#!/bin/bash
echo "$(date) - Running cron job (for ex. cleanup etc.)" >> /var/log/cron_logs.log

# Define the directory to clean
DIRECTORY=/app/data

# Find and remove files older than 10 seconds
find "$DIRECTORY" -type f -mmin +0.1 -exec rm -f {} \;

# Log the exit code
echo "Return code: $?" >> /var/log/cron_logs.log
