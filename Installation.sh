#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root priviiages"
    exit 1 # Failure is other then 0
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installing mysql is error"
    exit 1
else
    echo "Installing mysql is success"
fi
