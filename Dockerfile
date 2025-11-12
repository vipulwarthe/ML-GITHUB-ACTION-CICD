# Stage 1 — Build environment
FROM python:3.10-slim AS builder

WORKDIR /app
COPY requirements.txt .

# Install build tools temporarily
RUN apt-get update && apt-get install -y build-essential \
    && pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt \
    && apt-get remove -y build-essential \
    && apt-get autoremove -y && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Stage 2 — Runtime image
FROM python:3.10-slim

WORKDIR /app
COPY --from=builder /usr/local /usr/local
COPY . .

EXPOSE 5000
CMD ["python", "app.py"]
