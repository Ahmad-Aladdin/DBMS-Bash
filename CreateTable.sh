#!/usr/bin/bash
echo "Create table bash file"
read x
if [ -f $x ] 
then
	echo " this table already exist"
else
	touch $x 
	echo " Table has been created " 
fi

