#!/usr/bin/bash
clear

echo "      -------------------------------------------------------------------"
echo "      |                                                                  |"
echo "      |                          DROP DATABASES                          |"
echo "      |                                                                  |"
echo "      --------------------------------------------------------------------"
echo
echo
echo "Enter The Database Name You Want To Drop"
read db_name
if [[ $db_name == "" ]]
then
	echo "NOthing is entered,PLease enter again" 
elif [[ `echo "$db_name" | grep '*' | wc -c` > 0 ]] 
then
		echo "Invalid Input"
		echo "Rdirect to TablesMenu in 2 sec"
		sleep 2;
		clear 
		. ./mainmenu.sh
elif ! [[ $db_name == *[a-zA-Z0-9] ]] ; then
	echo " you have entered special characters"				


elif [ -d Databases/$db_name ]
then
	rm -r Databases/$db_name 2> /dev/null #put any error in the cmd
	echo "$db_name sucessfully dropped"
else 
	    echo "This db does not exist"
fi











