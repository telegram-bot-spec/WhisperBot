FROM python:3.11-slim

WORKDIR /app

# Install SQLite3
RUN apt-get update && \
    apt-get install -y libsqlite3-0 libsqlite3-dev && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY . .

# Run the application
CMD ["python", "whisper.py"]
