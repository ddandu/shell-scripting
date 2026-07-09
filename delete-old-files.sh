#!/bin/bash

# USERID=$(id -u)
# R="\e[31m"
# G="\e[32m"
# Y="\e[33m"
# N="\e[0m"

# LOGS_FOLDER="/root/dev/app-log"
# SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
# LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # /var/log/shell-script/16-logs.log

# mkdir -p $LOGS_FOLDER 

echo "Script started executed at: $(date)" 
SOURCE_DIR=/root/dev/app-log

if [ ! -d $SOURCE_DIR ]; then   #if [ ! -d $SOURCE_DIR ] → Tests if the directory does not exist (-d checks for directory).
    echo -e "ERROR:: $SOURCE_DIR does not exist"
    exit 1
fi

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -type f -mtime +14)

while IFS= read -r filepath   #IFS= → Clears the Internal Field Separator so filenames with spaces are handled correctly.
do
    echo "Deleting the file: $filepath"
    rm -rf $filepath
    echo "Deleted the file: $filepath"
done <<< $FILES_TO_DELETE   #<<< $FILES_TO_DELETE → Feeds the contents of FILES_TO_DELETE into the loop.