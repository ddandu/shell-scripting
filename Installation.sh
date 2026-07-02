#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root priviiages"
    exit 1 # Failure is other then 0
fi

VALIDATE(){

 if [ $1 -ne 0 ]; then
    echo "ERROR:: Installing $2 is error"
    exit 1
 else
    echo "Installing $2 is success"
 fi

} 
  
dnf install mysql -y
VALIDATE $? "mysql"

dnf install nginx -y 
VALIDATE $? "nginx"

 