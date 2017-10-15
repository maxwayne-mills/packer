#!/usr/bin/env bash

if [ -z "$1" ];then
	echo "Pass in ami-id"
else
	snapshotid=$(aws ec2 describe-images --image-id $1 | grep -i snapshotid)
	echo "To delete snapshot issue command: aws ec2 delete-snapshot --snapshot-id $snapshotid"
        echo "Do you want to delete image $1 y/n"
	read answer
	if [ -z "$answer" ]; then
		echo "You did not answer"
	else
		if [ "$answer" == "Y" -o "$answer" ];then
			aws ec2 deregister-image --image-id $1
		else
			echo  "You answered No ... exiting"; exit 0
		fi
	fi 
fi