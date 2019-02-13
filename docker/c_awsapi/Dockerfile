FROM phusion/baseimage:latest

# expose SSH port
EXPOSE 22

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker’s init process.
CMD [“/sbin/my_init”]

# point apt-get to aws and get the tools
RUN add-apt-repository ppa:awstools-dev/awstools -y
RUN apt-get update -y
RUN apt-get install ec2-api-tools -y

# Build and use me like this:

# docker build -t aws_api /path/to/Dockerfile
# docker run –rm -t -i aws_api /sbin/my_init — bash -l

# you can run any AWS api command. Example:

# ec2-describe-vpcs -H -O ACCESS_KEY -W SECRET_KEY

# Obviously the keys given have to be able to do whatever you’re trying to do.
