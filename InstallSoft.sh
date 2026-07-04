#!/bin/bash

UID=$(id -u)

if [ $UID -ne 0 ]; then

echo "The user is not alloed"

fi


VALIDATE(){

     if [ $1 -ne 0 ]; then
     echo "Then $2 is alrady installed.

     else

     echo "The is $2 installed successfully"
     
    fi
}


dnf install mysql -y

VALIDATE $? "mysql"
