FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the application code to the working directory
COPY . /app

# Install the dependencies from the requirements file
RUN pip install --no-cache-dir -r requirements.txt

# Install pytest for testing
RUN pip install pytest

# Expose the application port
EXPOSE 5000

# Define an environment variable (optional)
ENV NAME World

# Run the Flask application
CMD ["python", "app.py"]

