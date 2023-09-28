FROM python:3.9.18

################################
# Run Python script
################################

# Set the working directory
WORKDIR /adminuser

# Copy the script
COPY ./src/ ./src/

# Run the script
CMD ["python3", "./src/app/hello_world.py"]