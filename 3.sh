date; 
# This is the place to put commands after targeting each org. 
# That's the most expensive operation so you don't want to have to iterate through "target_me" 
# more than once. 

for i in `cat guids.txt `;do 
	$i/target_me; 
	if [ ! -f "$i/app_name" ]; then 
		echo "no $i/app_name found so getting the app name to it..."
		/go/usefultools/guid_to_app.sh $i > $i/app_name;
	fi;
	cf app `cat $i/app_name` >$i/app_status_pre;
	cf curl /v2/apps/$i/summary| grep diego >$i/diego_status_pre;
done;

date; 
