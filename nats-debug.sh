#!/bin/bash

# Need ruby in the path so just getting one in 
# one of the jobs. Tried to make this role agnostic.
# 
# Originally I was going to gem install nats, but I found the next uncommented line works fine.
#export PATH=`ls /var/vcap/jobs/*/packages/ruby*|head -1`/bin/:$PATH

nats_sub_cmd=`ls /var/vcap/jobs/*/packages/ruby*/bin/nats-sub|grep -m 1 nats-sub`

natsmessages=router.register
workdir=/var/vcap/data
outfile=$workdir/nats-stream.out
observation_period=10
# Find where we're connected to on port 4222 and exclude the 10. network because
# That's the bosh director/agent
nats_server=`netstat -an|grep :4222\ |grep -v 10.|awk {'print $5'}`

nats_password=`cat /var/vcap/jobs/gorouter/config/gorouter.yml|grep -2 nats|grep -m 1 pass|awk -F\" {'print $2'}`
nats_url="nats://nats:$nats_password@$nats_server"

# create our workdir if not there:
echo "creating $workdir if it doesn't exist."
mkdir -p -- "$workdir"

# Debugging I always have it print what I'm going to run first as a dry run.
#echo "( /var/vcap/packages/ruby_2.3.1/bin/nats-sub "$natsmessages" -s $nats_url > $natsdumptxt ) & sleep $observation_period ; kill $!"
( $nats_sub_cmd "$natsmessages" -s $nats_url > $outfile ) & sleep $observation_period ; kill $!
