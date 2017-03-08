#!/bin/bash
SPACE_URL=`cf curl /v2/apps/$1 | grep "space_url" | awk -F\" {'print $4'}`
cf curl $SPACE_URL | grep "\"name\"" | awk -F\" {'print $4'} 
