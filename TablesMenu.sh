#!/usr/bin/bash
clear
echo "      -------------------------------------------------------------------"
echo "      |                            WELCOME                               |"
echo "      |                                                                  |"
echo "                     ---------> CONNECTED TO $connected_db DATABASE <----------         "
echo "      |                                                                  |"
echo "      |                                                                  |"
echo "      --------------------------------------------------------------------"
echo
echo
while true
do 
select choice in "Create Table" "List Tables" "Drop Tables" "Select Table" "Back" "exit Menu"
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
"Back")	echo "Back"
		. ./mainmenu.sh
		break
		;;	
"exit Menu") exit
		 ;;
		  *) echo "Invalid Selection try again !"
		 ;;
esac
done
done
