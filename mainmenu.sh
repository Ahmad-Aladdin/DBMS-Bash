#!/usr/bin/bash
clear
PS3="Select Option   "
exitMenu=0
while true
do 
select choice in "Create Database" "List Databases" "Connect to Database" "Drop Database" "Exit Menu"
do 
case $choice in
"Create Database") echo "Create Database"
		. ./CreateDB.sh
		break
		;;
"List Databases") echo "List all Databases"
		. ./ListDBs.sh
		break
		;;
"Connect to Database") echo "Connect to Database"
		. ./connectDB.sh
		break
		;;
"Drop Database") echo "Drop Database"
		. ./dropDB.sh
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
