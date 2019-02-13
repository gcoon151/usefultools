/bin/date; 
cf login -a https://api.ng.bluemix.net -u $user -p $pass -o $user -s dev  
/bin/date; 
cf push; 
/bin/date; 
./curl.sh $md5.mybluemix.net
/bin/date;
cf delete $md5 -f -r; 
/bin/date; 
bash
