#!/usr/bin/bash
echo " Hello this is DropDB file"
read db_name
if [ -d $db_name ]
then
	rm -r $db_name 2> /dev/null #put any error in the cmd
	echo " $db_name sucessfully dropped"
else
	if [ $db_name = "" ]
		then
		echo "NOthing is entered,PLease enter again" 
		read db_name
	else 
	    	echo " this db does not exist"
	fi

fi

