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
RUN apt-get update -y
RUN apt-get install bind9 bind9utils bind9-doc -y
#sed -i 's/^OPTIONS.*/OPTIONS="-4 -u bind"/' /etc/default/bind9
# /etc/bind/named.conf.options
# acl trusted local network
# ip 
# ifconfig eth0 | awk 'sub(/.* inet addr:/, "") {print $1}'
# netmask 
# ifconfig eth0 | awk 'sub(/.* Mask:/, "") {print $1}'

# https://www.digitalocean.com/community/tutorials/how-to-configure-bind-as-a-private-network-dns-server-on-ubuntu-14-04

# Build and use me like this:

# docker build -t containername /path/to/Dockerfile
# docker run -t -i containername /sbin/my_init — bash -l

# This will drop you inside the container in a pristine environment. Ideally
# every command you run is brought back to the Dockerfile so you can just hand
# a dockerfile to someone else to do what you do.
