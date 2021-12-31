#!/usr/bin/bash
echo "Hello this is connect dbs bash file"
read db_name
if [ -d $db_name ] 
then
	cd $db_name

else
	echo " this db does not exist"
fi

