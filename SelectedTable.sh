#!/usr/bin/bash
clear
echo "Enter a Table name to connect"
read connected_Table
#NO_thing is entered 
if  [[   $connected_Table == "" ]]
then
echo "NOthing is entered,PLease enter again" 
read connected_Table
elif  [[ $connected_Table == *[a-z][A-Z][0-9] ]];then
	 #cannot check on dot and /
	#special char check
	#how to match regx in bash [[ ]] 
	echo " you have entered special characters"
elif [ -f Databases/$connected_db/Tables/Tables/$connected_Table ] # if the dir exist ? connect 
then
	
	echo "successfully connected to $connected_Table"
	. ./ConnectedTable.sh
else
	echo " No Table Named $connected_Table " #dir does not exist

fi

