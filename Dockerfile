# Use a lightweight and stable base image
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install dependencies efficiently
RUN apt update -y && apt install awscli -y

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 unzip -y && pip install -r requirements.txt

# Expose app port
EXPOSE 5000

# Run the app
CMD ["python3", "app.py"]
