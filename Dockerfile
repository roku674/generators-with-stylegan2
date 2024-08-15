# Use Python 3.7 as the base image
FROM python:3.7-slim

# Set the working directory
WORKDIR /app

# Copy the application files to the container
COPY . /app

# Upgrade pip
RUN pip install --upgrade pip

# Install the required Python dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Set the environment variable to disable oneDNN custom operations
ENV TF_ENABLE_ONEDNN_OPTS=0

# Set the environment variable for protobuf if needed
ENV PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run main.py when the container launches
CMD ["python", "main.py"]
