#!/usr/bin/bash
echo "Hello this is connect dbs bash file"
read db_name
#NO_thing is entered 
if  [[   $db_name = ""   ]]
then
echo "NOthing is entered,PLease enter again" 
read db_name
#end of NOthing is entered

elif [ -d $db_name ] 
then
	cd $db_name

else
	echo " this db does not exist,Retry again"
	read db_name
fi

