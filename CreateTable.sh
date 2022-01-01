echo -e "Table Name: \c"
  read tableName
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
  counter=1
  sep=":"
  rSep="\n"
  pKey=""
  metaData="Field"$sep"Type"$sep"key"
  while [ $counter -le $colsNum ]
  do
    echo -e "Name of Column No.$counter: \c"
    read colName

    echo -e "Type of Column $colName: "
    select var in "int" "str"
    do
      case $var in
        int ) colType="int";break;;
        str ) colType="str";break;;
        * ) echo "Wrong Choice" ;;
      esac
    done
    if [[ $pKey == "" ]]; then
      echo -e "Make PrimaryKey ? "
      select var in "yes" "no"
      do
        case $var in
          yes ) pKey="PK";
          metaData+=$rSep$colName$sep$colType$sep$pKey;
          break;;
          no )
          metaData+=$rSep$colName$sep$colType$sep""
          break;;
          * ) echo "Wrong Choice" ;;
        esac
      done
    else
      metaData+=$rSep$colName$sep$colType$sep""
    fi
    
    ((counter++))
  done

	DIR="./Databases/$connected_db/Tables/metaData"
    if [ ! -d "$DIR" ]; then
    # Take action if $DIR exists. #
    mkdir  ./Databases/$connected_db/Tables/metaData
    fi

  touch ./Databases/$connected_db/Tables/Tables/$tableName
  
  echo -e $metaData  >> ./Databases/$connected_db/Tables/metaData/$tableName
  touch ./Databases/$connected_db/Tables/metaData/$tableName
  
  if [[ $? == 0 ]]
  then
    echo "Table Created Successfully"
    . ./TablesMenu.sh
  else
    echo "Error Creating Table $tableName"
    . ./TablesMenu.sh
  fi

