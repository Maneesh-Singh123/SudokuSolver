# Python image to use.
FROM python:3.12-alpine

# Install system dependencies
RUN apk add --no-cache tk

# Set the working directory to /app
WORKDIR /app

# copy the requirements file used for dependencies
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Copy the rest of the working directory contents into the container at /app
COPY . .

# Start the server when the container launches
CMD ["python", "main.py", "runserver", "0.0.0.0:8080", "--noreload"]
