 #!/usr/bin/bash                                                                
clear

#Drop one  of the available tables                                                   
tb=`ls ./Databases/$connected_db/Tables/Tables | wc -l`

if [ "$tb" == 0 ]
then
   echo "Unfortunately, There are no Tables Recorded in your DB to be deleted"

else
   echo "PLease enter the name of the table you want to delete it"
   read tableName
  	 if [[ $tableName == "" ]];then
		echo "NOthing is enetered , PLease try again " 
		echo " Rdirect to TablesMenu in 2 sec"
		sleep 2;
		clear 
		. ./TablesMenu.sh
	elif ! [[ $tableName == *[a-zA-Z0-9] ]] ; then
		echo " you have entered special characters"
		echo " Rdirect to TablesMenu in 2 sec"
		sleep 2;
		clear 
		. ./TablesMenu.sh
	elif [[ $tableName == *[0-9] ]];then
		echo "you have entered Numbers"	
		echo " Rdirect to TablesMenu in 2 sec"
		sleep 2;
		clear 
		. ./TablesMenu.sh
	elif [[ $tableName =~ [/.:\|\-] ]];then
		echo -e "You can't enter these characters => . / : -|"
		echo " Rdirect to TablesMenu in 2 sec"
		sleep 2;		
		clear 
		. ./TablesMenu.sh
	fi
	

   #echo Databases/$connected_db/Tables/Tables/metaData/$tableName 
   
 rm -r Databases/$connected_db/Tables/metaData/$tableName #remove only files
# max depth 1 => find will NOT search for files in subdirs of PATH
  rm -r Databases/$connected_db/Tables/Tables/$tableName

fi
#check which Action the user need after completing his current operation        

echo "==========================================================="
echo "please select your next action from the following actions"
PS3="Enter Your Choice:~$ "
select choice in "Back" "Back To Main Menu" "Exit the Application"
   do
         case $REPLY in
         1). ./TablesMenu.sh 
	       ;;
         2). ./mainmenu.sh
	       ;;
         3) exit
               ;;
         *) echo "Invalid Selection Please Try again...!"
	       ;;
         esac
	done
