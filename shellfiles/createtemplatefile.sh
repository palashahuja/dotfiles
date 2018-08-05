#!/usr/bin/env sh

######################################################################
# @author      : palashahuja (palashahuja@$HOSTNAME)
# @file        : createtemplatefile
# @created     : Saturday Aug 04, 2018 23:15:03 IST
#
# @description : 
######################################################################


FILENAME="/Users/palashahuja/Documents/cp/$1.cpp"
if [ -f "$FILENAME" ]
then
    echo "$FILENAME"
    vim -c ":call VimuxOpenRunner()" ~/Documents/cp/$1.cpp
else
    vim -c ":TemplateInit leetcode" -c ":call VimuxOpenRunner()" ~/Documents/cp/$1.cpp 
fi
    

