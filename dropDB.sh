#!/usr/bin/bash
clear
echo " Hello this is DropDB file"
read db_name
if [ -d Databases/$db_name ]
then
	rm -r Databases/$db_name 2> /dev/null #put any error in the cmd
	echo " $db_name sucessfully dropped"

elif ! [[ $db_name == *[a-zA-Z0-9] ]] ; then
	 #cannot check on dot and /
	#special char check
	#how to match regx in bash [[ ]] 
	echo " you have entered special characters"
else
	if [ $db_name = "" ]
		then
		echo "NOthing is entered,PLease enter again" 
		
	else 
	    	echo " this db does not exist"
	fi
fi

