# Note the first bash is the container name
# the second bash is the actual bash command being 
# invoked inside the container
docker run -t -i `pwd |awk -F/ {'print $NF'}|tr '\n' ' '` /sbin/my_init -- bash -l
