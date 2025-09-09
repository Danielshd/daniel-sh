# Use official Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy everything into the container
COPY . .

# Run the app
CMD ["python", "app.py"]
