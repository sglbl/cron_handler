FROM python:3.10.12-slim

RUN apt update && apt install cron procps -y

RUN pip install --upgrade pip

COPY requirements.txt . 

RUN pip3 install -r requirements.txt

WORKDIR /app

# Copy application files
COPY main.py ./
COPY cron/cleanup.sh ./cron/cleanup.sh
RUN chmod +x ./cron/cleanup.sh

# Set up a cron job
RUN echo "* * * * * root /app/cron/cleanup.sh >> /var/log/cron.log 2>&1" >> /etc/crontab

# Expose port for the app
EXPOSE 8000

# Note: The cron daemon needs to run in the foreground to work inside a Docker container. I
# Run cron in the foreground and start the Python app
CMD ["bash", "-c", "cron -f & python3 main.py"]
