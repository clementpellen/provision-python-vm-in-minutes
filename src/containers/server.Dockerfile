FROM ubuntu-20.04:latest

RUN \
  # Update
  apt-get update -y

################################
# Install python
################################

# Install python
RUN apt-get install -y python3-pip
RUN pip3 install --upgrade pip

# Check that it's installed
RUN python3 -V
RUN pip --version

################################
# Run Python script
################################

# Copy the script
COPY ./src/container/hello_world.py ./hello_world.py

# Run the script
CMD ["python3", "./hello_world.py"]