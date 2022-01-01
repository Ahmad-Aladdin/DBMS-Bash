echo -e "Enter Database Name: \c"
  read dbName
  
    if [[ $dbName = "" ]];
    then
            echo -e "\e[41minvalid entry, please enter a correct name\e[0m"
            echo press any key
            read
    elif [[ $dbName =~ [/.:\|\-] ]]; 
    then
            echo -e "\e[41mYou can't enter these characters => . / : - | \e[0m"
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


    