#!/usr/bin/bash
clear
echo connected to $connected_Table
exitMenu=0
while true
do 
select choice in "Insert into  Table" "Select into Table" "Delete from Table" "Update Table" "Back"
do 
case $choice in
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
"Back") 
        . ./TablesMenu.sh
		 break
		 ;;
esac
done
done