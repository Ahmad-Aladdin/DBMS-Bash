clear
echo "      -------------------------------------------------------------------"
echo "      |                          CREATE TABLE                            |"
echo "      |                                                                  |"
echo "                    ---------> CONNECTED TO $connected_db <----------          "
echo "      |                                                                  |"
echo "      |                                                                  |"
echo "      --------------------------------------------------------------------"
echo
echo
echo -e "Enter Table Name: \c"
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
   S=":" 
  RS="\n" #record seperator
  metaData=""
##############################################
	DIR="./Databases/$connected_db/Tables/Tables"
        if [ ! -d "$DIR" ]; then
        # Take action if $DIR exists. #
        mkdir -p ./Databases/$connected_db/Tables/Tables 
        fi
        if [[ -f ./Databases/$connected_db/Tables/Tables/$tableName ]]; then
		echo "table already existed ,choose another name"
		sleep 3;
		./TablesMenu.sh
		fi
  echo -e "Number of Columns: \c"
  read colsNum
  if [[ $colsNum <=2 ]]; then
    echo "You have to enter a number bigger than 1"
    echo " Rdirect to TablesMenu in 2 sec"
    sleep 2;
    clear 
    . ./ConnectedTable.sh
    else
    echo -e "Enter the Name of the Primary key column : \c"
    read PKcol
    echo -e "Type of Column $colName : "
    select var in "int" "str"
    do
      case $var in
        int ) colType="int";break;;
        str ) colType="str";break;;
        * ) echo "INvalid...!" ;;
      esac
    done
    if [[ $colsNum == 1 ]]; then
        metaData+=$PKcol$S$colType$S"PK"
    else    
        metaData+=$PKcol$S$colType$S"PK"$RS;
    fi    
 fi
  for (( counter = 2; counter <= colsNum ; counter++ )); do
      echo -e "Enter the Name of column $counter: \c"
      read colName
      echo -e "Type of Column $colName: "
      select var in "int" "str"
      do
        case $var in
          int ) colType="int";break;;
          str ) colType="str";break;;
          * ) echo "INvalid...!" ;;
        esac
      done

      if [[ $counter == $colsNum ]]; then 
           metaData+=$colName$S$colType$S""
      else
          metaData+=$colName$S$colType$S""$RS
      fi
  done

	DIR="./Databases/$connected_db/Tables/metaData"

    if [ ! -d "$DIR" ]; then
        # Take action if $DIR exists. #
        mkdir  ./Databases/$connected_db/Tables/metaData
    fi

  touch ./Databases/$connected_db/Tables/Tables/$tableName
  echo -e $metaData  > ./Databases/$connected_db/Tables/metaData/$tableName
  touch ./Databases/$connected_db/Tables/metaData/$tableName
  if [[ $? == 0 ]]
  then
    echo "Table Created Successfully"
    . ./TablesMenu.sh
  else
    echo "Error Creating Table $tableName"
    . ./TablesMenu.sh
  fi
