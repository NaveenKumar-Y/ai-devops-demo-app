Here's a simple example of a Dockerfile for a Python app. This Dockerfile uses the official Python 3.9 image and installs the required dependencies.

**Dockerfile:**
```dockerfile
# Use an official Python 3.9 image as the base
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set working directory to /app
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Run command when the container launches
CMD ["python", "app.py"]
```

**Explanation:**

1. `FROM python:3.9-slim`: This line uses an official Python 3.9 image as the base for our Dockerfile.
2. `ENV PYTHONDONTWRITEBYTECODE 1` and `ENV PYTHONUNBUFFERED 1`: These lines set environment variables that configure how Python handles writing to files. In this case, we're enabling unbuffered I/O (i.e., output buffering) which is good for a production-ready app.
3. `WORKDIR /app`: This line sets the working directory in our container to `/app`.
4. `COPY requirements.txt .`: This line copies the `requirements.txt` file from the current directory into the container at the root of `/app`.
5. `RUN pip install -r requirements.txt`: This line installs the dependencies listed in `requirements.txt` using pip.
6. `EXPOSE 8000`: This line exposes port 8000, which is where our app will listen for incoming requests.
7. `CMD ["python", "app.py"]`: This line specifies what to run when the container launches. In this case, we're running the app with `app.py` as its main executable.

**Build and Run:**

To build and run the Docker image, follow these steps:

1. Save the above file in a file named `Dockerfile`.
2. Navigate to the directory containing your Dockerfile.
3. Build the Docker image:
```
docker build -t my-python-app .
```
4. Run the container using:
```bash
docker run -p 8000:8000 my-python-app
```

This will start a new container from our `my-python-app` image, mapping port 8000 on your local machine to port 8000 in the container.

Note that you'll need to have pip and Python installed on your system for this Dockerfile to work. Also, make sure to update the `requirements.txt` file with the actual dependencies required by your app.