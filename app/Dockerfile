FROM python:3.9-slim
WORKDIR /app
# COPY requirements.txt requirements.tx
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install  --no-cache-dir -r requirements.txt

# Expose port 5000 for Flask
EXPOSE 5000

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]
