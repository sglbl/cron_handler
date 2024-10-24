#!/bin/bash
echo "$(date) - Running cleanup" >> /app/cron/cleanup.log
echo "Current directory: $(pwd)" >> /app/cron/cleanup.log
echo "List of files before cleanup:" >> /app/cron/cleanup.log
ls -l /app/data >> /app/cron/cleanup.log

# Define the directory to clean
DIRECTORY=/app/data

# Find and remove files older than 10 seconds
find "$DIRECTORY" -type f -mmin +0.1 -exec rm -f {} \;

# Log the exit code
echo "Exit code: $?" >> /var/log/cron.log