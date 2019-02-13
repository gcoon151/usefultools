# The md5 sum is intended to be unique in and outside of the container for
# repeatability and uniqueness
docker run --name php1 --rm=true -e user=$user -e pass=$pass -e md5=f37f6cf510519f27759467b4533c9e84 -i -t php_cf
