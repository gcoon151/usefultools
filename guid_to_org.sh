#!/bin/bash
SPACE_URL=`cf curl /v2/apps/$1 | grep "space_url" | awk -F\" {'print $4'}`
ORG_URL=`cf curl $SPACE_URL | grep "\"organization_url\"" | awk -F\" {'print $4'}`
cf curl $ORG_URL | grep "\"name\"" | awk -F\" {'print $4'} 
