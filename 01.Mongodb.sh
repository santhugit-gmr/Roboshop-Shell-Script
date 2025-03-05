#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

ID=$(id -u)

if [ $ID -ne 0 ]
then
echo -e " $R Error : Please run this as Root user $N"
exit 1
else
echo -e " $G Running this with Root user $N"
fi

Validate()
if [ $1 -ne 0 ]
then 
echo -e " $R Error : $2 has been failed $N "
exit 1
else
echo -e " $G $2 has been succeeded $N "
fi

cp mongo.repo /etc/yum.repos.d/mongo.repo

Validate $? "Copying Mongodb package"
