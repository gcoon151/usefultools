# Shell script to chase down apps for cloud foundry admin
#
input=$1
echo input: $input

#Ok input was just a hostname so we have to start there.
space_url=`cf curl /v2/routes?q=host:$input| grep space_url| sed 's/            "space_url": "\(.*\)",/\1/'`
echo space_url: $space_url

# Let's get the real app name now. 

app_url=`cf curl /v2/routes?q=host:$input| grep apps_url | sed 's/            "apps_url": "\(.*\)"/\1/'`
echo app_url: $app_url


app_name=`cf curl $app_url|grep name| sed 's/      "name": "\(.*\)",/\1/'`
echo app_name: $app_name

# Ok with the space url you can figure out space and org. 
# This output only gives you the space UID and the space name
space_name=`cf curl $space_url|grep name| sed 's/      "name": "\(.*\)",/\1/'`
echo space_name: $space_name

org_url=`cf curl $space_url|grep organization_url| sed 's/      "organization_url": "\(.*\)",/\1/'`
echo org_url: $org_url

# Ok with an org URL we can get the org name
org_name=`cf curl $org_url|grep name| sed 's/      "name": "\(.*\)",/\1/'`
echo org: $org_name

cf target -o $org_name -s $space_name

echo "For your convenience"
echo Get app logs with: cf logs --recent $app_name |more
echo Find which DEA it is on: cf curl $app_url/stats



