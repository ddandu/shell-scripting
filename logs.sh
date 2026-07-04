#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#Logs setup
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # /var/log/shell-script/logs.log

mkdir -p $LOGS_FOLDER
echo "Script start execued at : $(date)"

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
  
dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]; then 
   dnf install mysql -y  &>>$LOG_FILE
   VALIDATE $? "mysql"
else
   echo -e "MySql is already exit...$Y SKIPPED $N"
fi

dnf list installed nginx  &>>$LOG_FILE
if [ $? -ne 0 ]; then
   dnf install nginx -y  &>>$LOG_FILE
   VALIDATE $? "nginx"
else
   echo -e "Nginx id already exit.... $Y SKIPPEd $N"
fi 
