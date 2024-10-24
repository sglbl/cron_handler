import os
import time
from datetime import datetime

# Directory to store the files
data_dir = '/app/data'

# Ensure the directory exists
if not os.path.exists(data_dir):
    os.makedirs(data_dir)

def create_file():
    """Creates a file with a timestamp in the data directory."""
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    file_path = os.path.join(data_dir, f"file_{timestamp}.txt")
    with open(file_path, 'w') as f:
        f.write(f"Created at {timestamp}")
    print(f"File created: {file_path}")

if __name__ == "__main__":
    print("Starting file creation loop...")
    while True:
        create_file()
        time.sleep(25)  # Wait 10 seconds before creating the next file
