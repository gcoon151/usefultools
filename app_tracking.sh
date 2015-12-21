# Shell script to chase down apps for cloud foundry admin
# There may be easier ways to do this for sure in like the gui, but sometimes
# I need it from CLI
# input is just app name

app=$1
echo app: $app

# Ok with the app name you have to figure out space and org. 
# This output only gives you the space UID and the space name
space_url=`cf curl /v2/apps?q=name:$app| grep space_url| sed 's/            "space_url": "\(.*\)",/\1/'`
echo space_url: $space_url
space_name=`cf curl $space_url|grep name| sed 's/      "name": "\(.*\)",/\1/'`
echo space_name: $space_name

org_url=`cf curl $space_url|grep organization_url| sed 's/      "organization_url": "\(.*\)",/\1/'`
echo org_url: $org_url

# Ok with an org URL we can get the org name
org_name=`cf curl $org_url|grep name| sed 's/      "name": "\(.*\)",/\1/'`
echo org: $org_name

cf target -o $org_name -s $space_name

cf logs --recent $app |more
