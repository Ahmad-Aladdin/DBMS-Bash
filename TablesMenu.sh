#!/usr/bin/bash
clear
echo connected to $connected_db
exitMenu=0
while true
do 
select choice in "Create Table" "List Tables" "Drop Tables" "Select Table" "exit Menu"
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

"Select Table") echo "Select Table"
		. ./SelectedTable.sh
		break
		;;
"exit Menu") exit
		 ;;
esac
done

done
