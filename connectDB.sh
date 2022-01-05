#!/usr/bin/bash
clear
echo "      -------------------------------------------------------------------"
echo "      |                                                                  |"
echo "      |                      CONNECT TO A DATABASE                       |"
echo "      |                                                                  |"
echo "      --------------------------------------------------------------------"
echo
echo
echo "Enter a Database name to connect"
read connected_db
#NO_thing is entered 
if  [[   $connected_db == ""   ]]
then
echo "NOthing is entered,PLease enter again" 
read connected_db
elif [[ `echo "$connected_db" | grep '*' | wc -c` > 0 ]] 
then
		echo "Not Valid Input"
		echo "Rdirect to TablesMenu in 2 sec"
		sleep 2;
		clear 
		. ./mainmenu.sh
elif  [[ $connected_db == *[a-z][A-Z][0-9] ]];then
	 #cannot check on dot and /
	#special char check
	#how to match regx in bash [[ ]] 
	echo " you have entered special characters"
elif [ -d Databases/$connected_db ] # if the dir exist ? connect 
then
	#cd Databases/$connected_db
	echo "successfully connected to $connected_db"
	. ./TablesMenu.sh
else
	echo " No DB Named $connected_db " #dir does not exist

fi

