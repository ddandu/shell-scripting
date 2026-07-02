#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then

    echo "ERROR:: Please run this script with root priviiages"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then

    echo "ERROR:: Installing mysql is error"
else
    echo "Installing mysql is success"

