FROM phusion/baseimage:latest

# expose SSH port
# EXPOSE 22

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker’s init process.
CMD [“/sbin/my_init”]

# point apt-get to aws and get the tools
RUN apt-get update -y
RUN apt-get install qemu-utils -y

# Build and use me like this:

# docker build -t qemu-img /directory/with/Dockerfile
# docker run --rm -t -i qemu-img /sbin/my_init -- bash -l

