#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root priviiages"
    exit 1 # Failure is other then 0
fi

# Call the validate function
VALIDATE(){

if [ $1 -ne 0 ]; then
    echo -e "Installing $2 ...$R FAILURE $N"
    exit 1
 else
    echo -e "Installing $2...$G is success $N"
 fi

} 
  
dnf list installed mysql
if [ $? -ne 0 ]; then 
   dnf install mysql -y
   VALIDATE $? "mysql"
else
   echo "MySql is already exit...$G SKIPPED $N"
fi

dnf list installed nginx
if [$? -ne 0 ]; then
   dnf install nginx -y 
   VALIDATE $? "nginx"
else
   echo "Nginx id already exit.... $G SKIPPEd $N"
fi 
 