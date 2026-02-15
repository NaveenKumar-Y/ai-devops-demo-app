Here is a simple Dockerfile for a Python application:
```
# Use an official Python runtime as our base image
FROM python:3.9-slim

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV PYTHONDONTWRITEBYTECODE 1

# Run command when the container starts
CMD ["python", "app.py"]
```
Let me explain what each line does:

1. `FROM python:3.9-slim`: We're using an official Python 3.9 runtime as our base image, with a slim version to reduce the image size.
2. `WORKDIR /app`: We set the working directory in the container to `/app`.
3. `COPY . /app`: We copy the current directory contents (i.e., our Python app) into the container at `/app`.
4. `RUN pip install --no-cache-dir -r requirements.txt`: We install any dependencies specified in `requirements.txt` using pip, without caching the packages.
5. `EXPOSE 80`: We make port 80 available to the world outside this container, so we can access our app through HTTP.
6. `ENV PYTHONDONTWRITEBYTECODE 1`: We set an environment variable to prevent Python from writing bytecode files when running our script.
7. `CMD ["python", "app.py"]`: We define a command to run when the container starts: in this case, it runs the `app.py` script using Python.

This Dockerfile assumes that your Python app has a file named `app.py` and a file named `requirements.txt` containing dependencies for your app. You can customize the Dockerfile as needed for your specific use case.

To build the Docker image, run:
```
docker build -t my-python-app .
```
Replace `my-python-app` with the desired name for your Docker image.