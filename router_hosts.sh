#!/bin/bash
USER=`head /var/vcap/jobs/gorouter/config/gorouter.yml| awk '/user: /{print $2}'`
PASS=`head /var/vcap/jobs/gorouter/config/gorouter.yml| awk '/pass: /{print $2}' | sed -e 's/\"//g'`
ENDPOINT=`netstat -an|grep LISTEN |awk '/8080/ {print $4}'`

# getting one entry to do a DNS lookup for the IP
ENTRY=`curl -s http://$USER:$PASS@$ENDPOINT/routes |json_pp |grep '\['|awk -F\" {'print $2'}|head -1`
# assign the IP address for that entry to a variable
# This just does a dns query for the earlier entry.
DPIP=`getent hosts  $ENTRY | awk '{ print $1 }'`

# This is the finished output.
curl -s http://$USER:$PASS@$ENDPOINT/routes |json_pp |grep '\['|awk -F\" {'print $2'} |sed -e "s/^/$DPIP /"
