!/bin/bash                                                                     
clear
echo "      -------------------------------------------------------------------"
echo "      |                         LIST ALL TABLES                          |"
echo "      |                                                                  |"
echo "                    ---------> CONNECTED TO $connected_db DATABASE <----------           "
echo "      |                                                                  |"
echo "      |                                                                  |"
echo "      --------------------------------------------------------------------"
echo
echo
#List of the available tables                                                   
tb=`ls ./Databases/$connected_db/Tables/Tables | wc -l`

if [ "$tb" == 0 ]
then
   echo "Unfortunately, There are no Tables Recorded"

else
   echo "Your available Tables are: "
   ls ./Databases/$connected_db/Tables/Tables | awk '{print NR, "-", $0}'
fi
#check which Action the user need after completing his current operation        
echo "==========================================================="
echo "please select your next action from the following actions"
PS3="Enter Your Choice:~$ "
select choice in "Back" "Back To Main Menu" "Exit the Application"
   do
         case $REPLY in
         1). ./TablesMenu.sh yes
	       ;;
         2). ./mainmenu.sh
	       ;;
         3) exit
               ;;
         *) echo "Invalid Selection Please Try again...!"
	       ;;
         esac
	done