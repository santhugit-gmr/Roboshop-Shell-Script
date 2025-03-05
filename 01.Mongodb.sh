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

dnf install mongodb-org -y 

Validate $? "Installation of Mongodb"

systemctl enable mongod

Validate $? "Mongodb Enabling"

systemctl start mongod

Validate $? "Mongo db starting"

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf

Validate $? "Remote access to MongoDB"

systemctl restart mongod

Validate $? "Mongo db Restarting"




