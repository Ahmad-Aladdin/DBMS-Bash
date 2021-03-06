#!/usr/bin/bash
clear
echo "      ---------------------------------------------------------------- --"
echo "      |                                                                 |"
echo "      |                       CREATE DATABASES                          |"
echo "      |                                                                 |"
echo "      -------------------------------------------------------------------"
echo
echo
echo -e "Enter Database Name: \c"
  read dbName
  
    if [[ $dbName = "" ]];
    then
            echo -e "\e[41minvalid entry, please enter a correct name\e[0m"
            echo press any key
            read
    elif [[ `echo "$dbName" | grep '*' | wc -c` > 0 ]] 
        then
               echo "Invalid Input"
               echo "Rdirect to TablesMenu in 2 sec"
	            sleep 2;
	  	         clear 
		         . ./mainmenu.sh       
    elif [[ $dbName =~ [/.:\|\-] ]]; 
    then
            echo -e "\e[41mYou can't enter these characters => . / : - | \e[0m"
            echo press any key
            read
    elif [[ $dbName = *[0-9] ]]; 
    then
            echo -e "\e[41mYou can't enter numbers \e[0m"
            echo press any key
            read        
    elif [[ -d ./Databases/$dbName ]]; 
    then
		echo -e "\e[41mthis database name is already used\e[0m"
		echo press any key
		read
    else
        DIR="./Databases"
        if [ ! -d "$DIR" ]; then
        # Take action if $DIR exists. #
         mkdir ./Databases 
        fi
       # mkdir ./Databases
        mkdir ./Databases/$dbName  
        if [[ $? == 0 ]]
        then
            echo "Database Created Successfully"
        else
        echo "Error Creating Database $dbName"
        fi
    fi


echo "==========================================================="
echo "please select your next action"
PS3="Enter Your Choice:~$ "
select choice in "Back To Main Menu" "Exit the Application"
do
   case $REPLY in
    1). ./mainmenu.sh
       ;;
    2) exit
       ;;
    *) echo "Invalid Selection Please Try again...!"
       ;;
    esac
done
    