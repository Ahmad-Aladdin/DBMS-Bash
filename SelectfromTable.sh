#!/usr/bin/bash
clear
#tput cup 0 0
echo "      -------------------------------------------------------------------"
echo "      |                        SELECT ALL RECORDS                        |"
echo "      |                                                                  |"
echo "                     --------->CONNECTED TO $connected_Table TABLE <----------           "
echo "      |                                                                  |"
echo "      |                                                                  |"
echo "      --------------------------------------------------------------------"
echo
echo
#colsInfo=`cat ./Databases/$connected_db/Tables/metaData/$connected_Table | cut -d: -f1` 
cols_Num=`cat Databases/$connected_db/Tables/Tables/$connected_Table | wc -l`
#echo "                ---------> $connected_Table Table <------------            "
#echo ""

if [[ $cols_Num == 0 ]]; then
    echo "There is nothing to show here"
else   
    tput cup 9 20
    awk -F: '{ printf $1   "     "}' Databases/$connected_db/Tables/metaData/$connected_Table
    echo 
    tput cup 10 15
    echo -n "---------------------------------"
    
    for (( counter=1; counter<=$cols_Num; counter++ ))
    do 
        #gettin the col name 
        tput cup $((10+counter)) 20
        awk -F: '{if(NR=='$counter'){ for(i=1;i<=NF;i++){printf $i   "     "} }}' Databases/$connected_db/Tables/Tables/$connected_Table
        ##awk -F: '{print $0}'
        #column -t -s ':' Databases/$connected_db/Tables/Tables/$connected_Table 2> /dev/null
    done
fi

echo ""
echo ""
echo "==========================================================="
echo "please select your next action"
PS3="Enter Your Choice:~$ "
select choice in "Back" "Back To Main Menu" "Exit the Application"
do
   case $REPLY in
    1). ./ConnectedTable.sh
       ;;
    2). ./mainmenu.sh
       ;;
    3)exit
       ;;   
    *) echo "Invalid Selection Please Try again...!"
       ;;
    esac
done