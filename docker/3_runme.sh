# The md5 sum is intended to be unique in and outside of the container for
# repeatability and uniqueness

# make passwords environment variables
#. ./pass.txt

export me=regularcfuser
export admin=cfadminusername

case $1 in
	monitor) docker run --name $1 --rm=true \
	-e bmapi=https://api.stage1.ng.bluemix.net \
	-e user=$me \
	-e pass=$pass \
	-e PS1=root@$1 \
	-i -t cfadmin ;;
	env4_me) docker run --name $1 --rm=true \
	-e bmapi=https://api.stage1.ng.bluemix.net \
	-e user=$me \
	-e pass=$pass \
	-e PS1=root@$1 \
	-i -t cfadmin ;;
	env4_admin) docker run --name $1 --rm=true \
	-e bmapi=https://api.stage1.ng.bluemix.net \
	-e user=$admin \
	-e pass=$s1pass \
	-i -t cfadmin ;;
	env4_lon_admin) docker run --name $1 --rm=true \
	-e bmapi=https://api.stage1.eu-gb.bluemix.net \
	-e user=$admin \
	-e pass=$s1pass \
	-i -t cfadmin ;;
	env5_me) docker run --name $1 --rm=true \
	-e bmapi=https://api.ng.bluemix.net \
	-e user=$me \
	-e pass=$pass \
	-i -t cfadmin ;;
	env5_admin) docker run --name $1 --rm=true \
	-e bmapi=https://api.ng.bluemix.net \
	-e user=$admin \
	-e pass=$yppass \
	-i -t cfadmin ;;
	env5_syd_me) docker run --name $1 --rm=true \
	-e bmapi=https://api.au-syd.bluemix.net \
	-e user=$me \
	-e pass=$pass \
	-i -t cfadmin ;;
	env5_syd_admin) docker run --name $1 --rm=true \
	-e bmapi=https://api.au-syd.bluemix.net \
	-e user=$admin \
	-e pass=$yppass \
	-i -t cfadmin ;;
	env5_lon_me) docker run --name $1 --rm=true \
	-e bmapi=https://api.eu-gb.ng.bluemix.net \
	-e user=$admin \
	-e pass=$pass \
	-i -t cfadmin ;;
	env5_lon_admin) docker run --name $1 --rm=true \
	-e bmapi=https://api.eu-gb.bluemix.net \
	-e user=$admin \
	-e pass=$yppass \
	-i -t cfadmin ;;
	*) echo "need one input env4_me, env4_admin, env5_me, env5_admin, env5_lon_me, etc" ;;
esac


