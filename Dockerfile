FROM python:latest

# Install pipx
RUN apt-get update && apt-get install -y pipx

# Install poetry
RUN pip3 install poetry

# Change working dir to /app
WORKDIR /app

# Install poetry dependencies to container 
COPY pyproject.toml ./
RUN pipx run poetry install --no-root

# COPY todo into the container
COPY todo todo

# Adding a delay to our application startup 
CMD ["bash", "-c", "sleep 10 && pipx run poetry run flask --app todo run \ 
   --host 0.0.0.0 --port 6400"]