#!/bin/bash

each "Please enter the Number"

read NUMBER

if [ $(($NUMBER % 2)) -eq 0 ]; then
  echo "The Given number is even"

  else

  echo The given number is odd" 

 fi