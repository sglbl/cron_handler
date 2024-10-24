FROM python:3.10.12-slim

# Set environment variables
ENV CRON_SCHEDULE="*/1 * * * *"
ENV CRON_COMMAND="/app/cron/cleanup.sh"

RUN apt update && apt install cron -y
RUN pip install --upgrade pip
COPY requirements.txt . 
RUN pip3 install -r requirements.txt

WORKDIR /app

# Copy application files
COPY main.py ./ 
COPY cron/cleanup.sh ./cron/cleanup.sh
RUN chmod +x ./cron/cleanup.sh

# Create the psuedo log file to point to stdout
RUN ln -sf /proc/1/fd/1 /var/log/cron_logs.log

# Set up a cron job using environment variables
RUN echo "${CRON_SCHEDULE} root ${CRON_COMMAND} >> /var/log/cron.log 2>&1" >> /etc/crontab

# Expose port for the app
EXPOSE 8000

# Run cron in the foreground and start the Python app
CMD ["python3", "main.py"]
