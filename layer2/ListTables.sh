#!/usr/bin/bash
echo " this List tables"
echo " please enter the name of db you want to list the tables of it "
read x
if [ -d $x ] 
then
	cd $x
       	ls	
else
	echo "this db does not exist"
fi
 
