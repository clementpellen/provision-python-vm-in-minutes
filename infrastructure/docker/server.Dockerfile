FROM ubuntu:20.04

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
COPY /src/ /src/

# Run the script
CMD ["python3", "/src/app/hello_world.py"]