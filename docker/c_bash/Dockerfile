FROM phusion/baseimage:latest

# I'm leaving this as an example. You only need this type of statement
# to expose a containers port to outside of the container.
# expose SSH port
# EXPOSE 22

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker’s init process.
CMD [“/sbin/my_init”]

# example of pointing the container to a different apt-get repository
# to fetch software.
# RUN add-apt-repository ppa:awstools-dev/awstools -y
# RUN apt-get update -y
# RUN apt-get install ec2-api-tools -y

# Build and use me like this:

# docker build -t containername /path/to/Dockerfile
# docker run -t -i containername /sbin/my_init — bash -l

# This will drop you inside the container in a pristine environment. Ideally
# every command you run is brought back to the Dockerfile so you can just hand
# a dockerfile to someone else to do what you do.
