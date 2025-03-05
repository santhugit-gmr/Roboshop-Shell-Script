#!/bin/bash

R="\e[30m"
G="\e[31m"
Y="\e[32m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

ID=$(id -u)

if [ $ID -ne 0 ]
then
echo -e " $R Error : Please run this as Root user $N"
exit 1
else
echo " $G Running this with Root user $N"
fi

Validate()
if [ $1 -ne 0 ]
then 
echo " $R Error : $2 has been failed $N "
exit 1
else
echo " $G $2 has been succeeded $N "

cp mongo.repo /etc/yum.repos.d/mongo.repo

Validate $? "Copying package"