#!/bin/bash
cf curl /v2/apps/$1 | grep "\"name\"" | awk -F\" {'print $4'}
