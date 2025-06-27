FROM python:3.11-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential cmake \
                       libopenblas-dev liblapack-dev libx11-dev libgtk-3-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
ENTRYPOINT ["python3", "clientApp.py"]
