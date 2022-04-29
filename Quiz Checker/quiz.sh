#!/bin/bash

qfile=$1 # question file argument
afile=$2 # answer file argument
userfile=$3 # user provided answer file

# counters
correct=0
wrong=0

# automatic mode
if [[ $# -eq 3 ]]
then
    test=$(paste -d '|' ${userfile} ${afile})

    while IFS= read -r line; do
        IFS='|' read -ra ADDR <<< "$line";
        first=${ADDR[0]}
        second=${ADDR[1]}
        if [ "${first}" == "${second}" ]
        then
            ((correct++))
        fi
        ((cnt++))
        if [ $cnt -eq 10 ]
        then
            break
        fi
    done <<< "$test"
    echo $correct

elif [[ $# -eq 2 ]]
then
    # interactive mode
    awk 'NR==1' $qfile
    read answer1

    if [[ $answer1 == $(awk 'NR==1' $afile) ]]
    then
        ((correct++))
    else
        ((wrong++))
    fi

    awk 'NR==2' $qfile
    read answer2

    if [[ $answer2 == $(awk 'NR==2' $afile) ]]
    then
        ((correct++))
    else
        ((wrong++))
    fi

    awk 'NR==3' $qfile
    read answer3

    if [[ $answer3 == $(awk 'NR==3' $afile) ]]
    then
        ((correct++))
    else
        ((wrong++))
    fi

    awk 'NR==4' $qfile
    read answer4

    if [[ $answer4 == $(awk 'NR==4' $afile) ]]
    then
        ((correct++))
    else
        ((wrong++))
    fi

    awk 'NR==5' $qfile
    read answer5

    if [[ $answer5 == $(awk 'NR==5' $afile) ]]
    then
        ((correct++))
    else
        ((wrong++))
    fi

    awk 'NR==6' $qfile
    read answer6

    if [[ $answer6 == $(awk 'NR==6' $afile) ]]
    then
        ((correct++))
    else
        ((wrong++))
    fi

    awk 'NR==7' $qfile
    read answer7

    if [[ $answer7 == $(awk 'NR==7' $afile) ]]
    then
        ((correct++))
    else
        ((wrong++))
    fi

    awk 'NR==8' $qfile
    read answer8

    if [[ $answer8 == $(awk 'NR==8' $afile) ]]
    then
        ((correct++))
    else
        ((wrong++))
    fi

    awk 'NR==9' $qfile
    read answer9

    if [[ $answer9 == $(awk 'NR==9' $afile) ]]
    then
        ((correct++))
    else
        ((wrong++))
    fi

    awk 'NR==10' $qfile
    read answer10

    if [[ $answer10 == $(awk 'NR==10' $afile) ]]
    then
        ((correct++))
    else
        ((wrong++))
    fi

    echo $correct
    echo $wrong
fi
