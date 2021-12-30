#!/usr/bin/bash

exitMenu=0
while true
do 
select choice in "Create Database" "List Databases" "Drop Database" "Exit Menu"
do 
case $choice in
"Create Database") echo "Create Database"
		. ./CreateDB
		break
		;;
"List Databases") echo "List all Databases"
		. ./ListDBs
		break
		;;
"Drop Database") echo "Drop Database"
		. ./dropDB
		break
		;;
"Exit Menu") exitMenu=1 
		 break
		 ;;
esac
done
if [ $exitMenu == 1 ]; 
then
	break
fi
done
© 2021 GitHub, Inc.
Terms
