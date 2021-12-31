#!/usr/bin/bash
echo "Hello this is connect dbs bash file"
read db_name
#NO_thing is entered 
if  [[   $db_name = ""   ]]
then
echo "NOthing is entered,PLease enter again" 
read db_name

elif [ -d $db_name ] # if the dir exist ? connect 
then
	cd $db_name
	echo "successfully connected to $db_name"

elif ! [[ $db_name == *[a-z][A-Z][0-9] ]];then
	 #cannot check on dot and /
	#special char check
	#how to match regx in bash [[ ]] 
	echo " you have entered special characters"
else
	echo " No DB Named $db_name " #dir does not exist

fi

