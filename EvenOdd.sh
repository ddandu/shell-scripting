#!/bin/bash

ech "Please enter the number"

read NUMBER

if [ $(($NUMBER % 2)) -eq 0 ]; then

echo "The given number is $NUMBER is even"

else 

echo "The givne number is $NUMBEr is odd"

fi