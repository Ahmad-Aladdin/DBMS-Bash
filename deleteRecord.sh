#!/usr/bin/bash
clear
Numofcols=`cat ./Databases/$connected_db/Tables/Tables/$connected_Table | wc -l`
colType=`awk -F: ' NR==1 { print $2}' Databases/$connected_db/Tables/metaData/$connected_Table`
echo "                ---------> $connected_Table Table <------------            "
echo ""

if [[ $Numofcols == 0 ]]; then
        echo "There is nothing to show here"
    else   
        tput cup 3 20
        awk -F: '{ printf $1   "     "}' Databases/$connected_db/Tables/metaData/$connected_Table
        echo 
        tput cup 4 15
        echo -n "---------------------------------"
        
        for (( counter=1; counter<=$Numofcols; counter++ ))
        do 
            #gettin the col name 
            tput cup $((5+counter)) 20
            awk -F: '{if(NR=='$counter'){ for(i=1;i<=NF;i++){printf $i   "     "} }}' Databases/$connected_db/Tables/Tables/$connected_Table
            ##awk -F: '{print $0}'
            #column -t -s ':' Databases/$connected_db/Tables/Tables/$connected_Table 2> /dev/null
        done
        tput cup 10 0
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
        elif [[ `cat ./Databases/$connected_db/Tables/Tables/$connected_Table | cut -d: -f1 | grep -w "$PKvalue" | wc -l` == 0 ]]; then #or we can say Metarownumber validation 
            echo "primary key is not exist" 
            echo " Rdirect to TablesMenu in 3 sec"
            sleep 3;
            clear 
            . ./ConnectedTable.sh
        fi    
        if [[ $colType == "int" && $PKvalue != "" ]]; then

            if [[ ! $PKvalue =~ ^[0-9]+$ ]]; then #not equivalent with any int no.s
                echo "Only allowed is INTEGERS"	
                echo " Rdirect to TablesMenu in 3 sec"
                sleep 3;
                clear 
                . ./ConnectedTable.sh
          
                fi 
   
               MetaRowNum=`awk -F: '{    
                                            if($1 == "'$PKvalue'") 
                                                { 
                                                    print NR;
                                                }
                                       }' Databases/$connected_db/Tables/Tables/$connected_Table`
		
		(( $MetaRowNum +1 )) 
		sed  -i "${MetaRowNum}d" Databases/$connected_db/Tables/Tables/$connected_Table
         	echo "record the has pk $MetaRowNum is succ deleted"
		sleep 2;

  
        fi        
fi
clear
echo "                ---------> $connected_Table Table After Update <------------            "
echo ""
echo ""
#echo "                ---------> $connected_Table Table <------------            "
echo ""
#. ./SelectfromTable.sh   
    tput cup 3 20
    awk -F: '{ printf $1   "     "}' Databases/$connected_db/Tables/metaData/$connected_Table
    echo 
    tput cup 4 15
    echo -n "---------------------------------"
    
    for (( counter=1; counter<=$Numofcols; counter++ ))
    do 
        #gettin the col name 
        tput cup $((5+counter)) 20
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
        3) . ./deleteRecord.sh
        ;;
        4) . ./connected_Table.sh
        ;;
        5) . ./MainMenu.sh
        ;;
        6) exit
        ;;
        *) echo "Invalid Selection Please Try again...!"
        ;;
        esac
    done


