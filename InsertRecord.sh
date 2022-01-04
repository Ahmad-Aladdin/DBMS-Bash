#!/usr/bin/bash
clear

sep=":"
rsep="\n"
ROW=""
#connected_Table=test
#connected_db=akh
cols_num=`cat Databases/$connected_db/Tables/metaData/$connected_Table | wc -l`
for (( counter=1; counter<=$cols_num; counter++ ))
do 
    
    #gettin the col name 
    colname=`awk -F: '{if(NR=='$counter'){print $1}}' Databases/$connected_db/Tables/metaData/$connected_Table`
    #gettin the col type 
    coltype=`awk -F: '{if(NR=='$counter'){print $2}}' Databases/$connected_db/Tables/metaData/$connected_Table`

    echo "Please enter the value of $colname the allowed datatype is $coltype  "
    read value

    if [[ $counter == 1 ]]; then 
        if [[ $value == "" ]];then
            echo "NOthing is enetered , PLease try again " 
            echo " Rdirect to TablesMenu in 2 sec"
            sleep 2;
            clear 
            . ./ConnectedTable.sh
        elif [[ `cat ./Databases/$connected_db/Tables/Tables/$connected_Table | cut -d: -f1 | grep -w "$value" | wc -l` > 0 ]]; then
            echo "primary key must be unique" 
            echo " Rdirect to TablesMenu in 3 sec"
            sleep 3;
            clear 
            . ./ConnectedTable.sh
        fi
    fi

    if [[ $coltype == "int" && $value != "" ]]; then

        if [[ ! $value =~ ^[0-9]+$ ]]; then
            echo "Only allowed is INTEGERS"	
            echo " Rdirect to TablesMenu in 3 sec"
            sleep 3;
            clear 
            . ./ConnectedTable.sh 
        fi
    fi    

    if [[ $cols_num == $counter ]]; then
        ROW+=$value
    else
        ROW+=$value$sep    
    fi    
done
echo -e $ROW  >> ./Databases/$connected_db/Tables/Tables/$connected_Table 



















    # echo enter the primary key Data 
    # read PKdata
    # CHKpk_Value=`cat ./Databases/$connected_db/Tables/Tables/$connected_Table | cut -d: -f1 | grep -w "$Pkdata" | wc -l`
    # CHK_pkType=`cat ./Databases/$connected_db/Tables/metaData/$connected_Table | cut -d: -f2 | head -1`
    
    # if [[ $CHKpk_Value == 0 ]]; then
        

    #     if [[ $CHK_pkType == "int" ]]; then
    #        for((counter= 2;counter<`cat ./Databases/$connected_db/Tables/metaData/$connected_Table | wc -l` ; counter++ )); do
            
    #            # col_Rownum=`awk '-F: NR=$counter && NR<= cat ./Databases/$connected_db/Tables/metaData/$connected_Table | wc -l'`
    #            # echo $col_Rownum
    #            colname=`cat ./Databases/$connected_db/Tables/metaData/$connected_Table | cut -d: -f ${counter-1}`
    #            echo $colname
    #             coltype=`cat ./Databases/$connected_db/Tables/metaData/$connected_Table | cut -d: -f $counter`
    #             echo $coltype
    #                 echo enter the $counter column data 
    #                 read col_Data
    #         done

    #     fi
       # ROW +=$Pkdata$sep$CHK_pkType$sep$rsep
       # echo -e $ROW  >> ./Databases/$connected_db/Tables/Tables/$connected_Table 
    #fi
#for((counter = 1; counter<`cat ./Databases/$connected_db/Tables/metaData/$connected_Table | wc -l` ; counter++)); do
#if [[ counter == 1 ]]; then
    
#fi
#done
#if [[counter == 2]]


