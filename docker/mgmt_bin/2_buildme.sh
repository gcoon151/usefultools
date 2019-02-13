# This script assumes you're in the directory with the Dockerfile

if [ ! -f ./Dockerfile ]; then
	echo "Change directory (cd) in to the directory with the Dockerfile to run this script."
	exit -
fi

#First let's make your Dockerfile unique so you don't step on others. 
# This command looks for an entry in the Dockerfile that says "UNIQUE" and
# only adds this if it's not there. 
grep UNIQUE Dockerfile || (echo \#UNIQUE_STUFF...>> Dockerfile; echo \#`date` >>Dockerfile && echo \#`hostname` >> Dockerfile && echo \#`LC_CTYPE=C tr -dc A-Za-z0-9_\!\@\#\$\%\^\&\*\(\)-+= < /dev/urandom | head -c 32 | xargs` >>Dockerfile)


export MYMD5=`md5 -q Dockerfile`;
# Need to remove the newline from the variable so that sed doesn't barf on it. 
MYMD5="${MYMD5%\\n}" 

# Be nice to support people - Just print out our md5sum. 
echo "$PWD/Dockerfile MD5 sum = $MYMD5";

# I use the md5 sum of the docker file to make the instance unique inside the container and outside
# This takes in the script named runme.sh and puts the md5 sum of the Docker file on the line
# That gets passed in to the docker container. This will be used later in the container
# to instantiate the service uniquely. 
sed -i .bak -e "s/md5=.* /md5=${MYMD5} -i -t /g" 3_runme.sh && rm 3_runme.sh.bak

# The manifest.yml needs a unique route too. 
# I think this is unique. 
sed -i .bak -e "s/coonphp/${MYMD5}/g" phpsrc/manifest.yml 

# This is the command to build our docker image named for whatever is passed to the "-t" option. 
docker build -t php_cf .
