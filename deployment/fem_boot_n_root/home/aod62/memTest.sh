#!/bin/bash

if [ $# -eq 3 ]
then
    address=$(($3))
elif [ $# -eq 2 ]
then
    address=$(($1))
else
    echo "Usage: 'sh memTest.sh ADDRESS VALUE [ADDRESS]'
 
Find where the memory address wraps around

       ADDRESS : Memory address to search for
       VALUE   : Value to set ADDRESS to and search for
       ADDRESS  : Memory address to start search from"
    exit 0
fi

oldValue=$(devmem $1)
devmem $1 32 $2
count=0

while true; do
    count=$(($count+1))
    address=$(($address+4))
    signedHexAddress=$(printf %X $address)
    if [ $address -lt 0 ]
    then
        hexAddress=$(echo 0x${signedHexAddress:8})
    else
        hexAddress=$(echo 0x$signedHexAddress)               
    fi
    newValue=$(devmem $hexAddress)
    if [ $newValue = $2 ]
    then
        echo Candidate:$hexAddress
        devmem $1 32 $oldValue
        if [ $newValue = $oldValue ]
        then
            break
        fi
        devmem $1 32 $2
    fi
    if [ $count -eq 1024 ]
    then
        count=0
        echo $hexAddress   
    fi
done

echo Found:$hexAddress
