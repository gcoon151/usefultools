# This script assumes you're in the directory with the Dockerfile

# This is the command to build our docker image named for the current direectory
docker build -t `pwd |awk -F/ {'print $NF'}|tr '\n' ' '`.
