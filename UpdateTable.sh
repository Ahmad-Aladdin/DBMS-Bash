#!/usr/bin/bash
clear
Numofcols=`cat ./Databases/$connected_db/Tables/Tables/$connected_Table | wc -l`
colType=`awk -F: ' NR==1 { print $2}' Databases/$connected_db/Tables/metaData/$connected_Table`

echo "      -------------------------------------------------------------------"
echo "      |                 UPDATE YOUR TABLES RECORDS HER                   |"
echo "      |                                                                  |"
echo "                        ---------> $connected_Table Table <----------           "
echo "      |                                                                  |"
echo "      |                                                                  |"
echo "      --------------------------------------------------------------------"
echo
echo
if [[ $Numofcols == 0 ]]; then
        echo "There is nothing to show here"
    else   
        tput cup 8 20
        awk -F: '{ printf $1   "     "}' Databases/$connected_db/Tables/metaData/$connected_Table
        echo 
        tput cup 10 15
        echo -n "---------------------------------"
        
        for (( counter=1; counter<=$Numofcols; counter++ ))
        do 
            #gettin the col name 
            tput cup $((10+counter)) 20
            awk -F: '{if(NR=='$counter'){ for(i=1;i<=NF;i++){printf $i   "     "} }}' Databases/$connected_db/Tables/Tables/$connected_Table
            ##awk -F: '{print $0}'
            #column -t -s ':' Databases/$connected_db/Tables/Tables/$connected_Table 2> /dev/null
        done
        #tput cup 10 0
        echo 
        echo
        echo "==============================================================================" 
        echo       
        echo "Enter the primary key Column "
        read PKvalue

        if [[ $PKvalue == "" ]];then
            echo "NOthing is enetered , PLease try again " 
            echo " Rdirect to TablesMenu in 2 sec"
            sleep 2;
            clear 
            . ./ConnectedTable.sh
        elif [[ `cat ./Databases/$connected_db/Tables/Tables/$connected_Table | cut -d: -f1 | grep -w "$PKvalue" | wc -l` == 0 ]]; then
            echo "primary key is not exist" 
            echo " Rdirect to TablesMenu in 3 sec"
            sleep 3;
            clear 
            . ./ConnectedTable.sh
        fi    
        if [[ $colType == "int" && $PKvalue != "" ]]; then

            if [[ ! $PKvalue =~ ^[0-9]+$ ]]; then
                echo "Only allowed is INTEGERS"	
                echo " Rdirect to TablesMenu in 3 sec"
                sleep 3;
                clear 
                . ./ConnectedTable.sh 
            else
                echo "Enter the column name you want to update ! "
                read columnName
                if [[ $columnName == "" ]];then
                    echo "NOthing is enetered , PLease try again " 
                    echo " Rdirect to TablesMenu in 2 sec"
                    sleep 2;
                    clear 
                    . ./ConnectedTable.sh
                elif [[ `cat ./Databases/$connected_db/Tables/metaData/$connected_Table | cut -d: -f1 | grep -w "$columnName" | wc -l` == 0 ]]; then
                    echo "Column is not exist" 
                    echo " Rdirect to TablesMenu in 3 sec"
                    sleep 3;
                    clear 
                    . ./ConnectedTable.sh
                fi   
                if [ $columnName == `awk -F: '{ if ( NR==1 ) { print $1 } } ' Databases/$connected_db/Tables/metaData/$connected_Table` ]
                then
                    echo "[You Entered Primary Key Column] Try Another Column !"
                else    
                    metaNumRows=`cat ./Databases/$connected_db/Tables/metaData/$connected_Table | wc -l`
                    MetaRowNum=`awk -F: '{    
                                            if($1 == "'$columnName'") 
                                                { 
                                                    print NR;
                                                }
                                        }' Databases/$connected_db/Tables/metaData/$connected_Table`
                    echo "Please Enter the New value "
                    read NewValue   
                    if [[ $NewValue == "" ]]; then
                        echo "NOthing is enetered , PLease try again " 
                        echo "Rdirect to TablesMenu in 2 sec"
                        sleep 2;
                        clear 
                        . ./ConnectedTable.sh
                    elif [[ $NewValue == "int" && $NewValue != "" ]]; then
                            if [[ ! $NewValue =~ ^[0-9]+$ ]]; then
                                    echo "Only allowed is INTEGERS"	
                                    echo "Rdirect to TablesMenu in 3 sec"
                                    sleep 3;
                                    clear 
                                    . ./ConnectedTable.sh 
                            fi        
                    else
                        awk -F: -v PKvalue=$PKvalue  -v val="$NewValue" -v columnNum=$MetaRowNum '
                        BEGIN{FS=OFS=":"}
                        {
                            if ($1 == PKvalue)
                            {
                                $columnNum = val;
                            }
                            print $0
                        }' Databases/$connected_db/Tables/Tables/$connected_Table > Databases/$connected_db/Tables/Tables/tmp && mv Databases/$connected_db/Tables/Tables/tmp Databases/$connected_db/Tables/Tables/$connected_Table


                    fi    
                fi
            fi
        fi        
fi
clear
echo "      -------------------------------------------------------------------"
echo "      |                        TABLES RECORDS                           |"
echo "      |                                                                 |"
echo "                      -----> $connected_Table Table After Update  <-----        "
echo "      |                                                                 |"
echo "      |                                                                 |"
echo "      -------------------------------------------------------------------"
echo ""
#echo "                ---------> $connected_Table Table <------------            "
echo ""
#. ./SelectfromTable.sh   
    tput cup 8 20
    awk -F: '{ printf $1   "     "}' Databases/$connected_db/Tables/metaData/$connected_Table
    echo 
    tput cup 10 15
    echo -n "---------------------------------"
    
    for (( counter=1; counter<=$Numofcols; counter++ ))
    do 
        #gettin the col name 
        tput cup $((10+counter)) 20
        awk -F: '{if(NR=='$counter'){ for(i=1;i<=NF;i++){printf $i   "     "} }}' Databases/$connected_db/Tables/Tables/$connected_Table
        ##awk -F: '{print $0}'
        #column -t -s ':' Databases/$connected_db/Tables/Tables/$connected_Table 2> /dev/null
    done
echo  
echo
echo "==========================================================="

echo "please select your next action "
PS3="Enter Your Choice:~$ "
 select choice in "Update Another Record" "Insert New Record" "Delete From Table" "Back" "Back To Main Menu" "Exit the Application"
    do
    case $REPLY in
        1) . ./UpdateTable.sh
        ;;
        2) . ./InsertRecord.sh
        ;;
        3) . ./DeleteFromTable.sh
        ;;
        4) . ./Connected_Table.sh
        ;;
        5) . ./mainmenu.sh
        ;;
        6) exit
        ;;
        *) echo "Invalid Selection Please Try again...!"
        ;;
        esac
    done

