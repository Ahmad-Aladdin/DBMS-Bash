#!/usr/bin/bash
clear
echo connected to $connected_db
exitMenu=0
while true
do 
select choice in "Create Table" "List Tables" "Drop Tables" "Insert into  Table" "Select into Table" "Delete from Table" "Update Table" "exit Menu"
do 
case $choice in
"Create Table") echo "Create Table"
		. ./CreateTable.sh
		break
		;;
"List Tables") echo "List Tables"
		. ./ListTables.sh
		break
		;;
"Drop Tables") echo "Drop Tables"
		. ./DropTable.sh
		break
		;;
"Insert into  Table") echo "Insert into  Table"
		. ./insertRecord.sh
		break
		;;
"Select into Table") echo "Select into Table"
		. ./select.sh
		break
		;;
"Delete from Table") echo "Delete from Table"
		. ./deleteRecord.sh
		break
		;;
"Update Table") echo "Update Table"
		. ./update.sh
		break
		;;
"exitMenu") exitMenu=1 
		 break
		 ;;
esac
done
if [ $exitMenu == 1 ]; 
then
	break
fi
done
