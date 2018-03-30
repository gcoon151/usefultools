Step 1
Install virtualbox
Step 2 
install docker. I downloaded the docker installer and docker-machine for my mac but I like and know docker-machine pretty well. 

Confirm you can run docker commands: "docker ps" doesn't print much out. Just make sure the command runs and doesn't give you an error. 

./buildme.sh creates the docker container from the Dockerfile in the directory you're in. 
./runme.sh launches the container interactively ready to execute apt-get, curl, or cf commands. 

Note the goal is to get anything you do manually interactively back in to the Dockerfile as "RUN" commands so when you hand these files off to
someone else they do all of what you did in the container by just launching the container. 

I also included cleanup.sh

This is a script to remove all docker containers and images. Good for when you want a fresh start. 
