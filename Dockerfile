# Use Python 3.11 as the base image
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy the application files to the container
COPY . /app

# Upgrade pip
RUN pip install --upgrade pip

# Install the required Python dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run main.py when the container launches
CMD ["python", "main.py"]
