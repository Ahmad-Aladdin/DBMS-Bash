#!/usr/bin/bash
echo " Hello this is DropDB file"
read db_name
if [ -d $db_name ] 
then
	rm -r $db_name 
else
	echo "this db does not exist"
fi

