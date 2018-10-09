#!/bin/bash

read -p " What folder should be backed up: " folder
read -p " What type of files should be backed up: " suffix

find $folder -name "*.$suffix" -a ! -name '~*' -exec cp {} \
    $BACKUP/$LOGNAME/$folder
echo "Backed up files from $folder to $BACKUP/$LOGNAME/$folder
e"
