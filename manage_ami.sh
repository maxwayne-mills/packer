#!/usr/bin/env bash

echo ""
echo ""
if [ -z "$1" ];then
	echo "Pass in ami-id"
else
	snapshotid=$(aws ec2 describe-images --image-id $1 | grep -i snapshotid)
	echo "To delete snapshot issue command: aws ec2 delete-snapshot --snapshot-id $snapshotid"
        echo -n "Do you want to delete image $1 y/n: "
	read answer
	if [ -z "$answer" ]; then
		echo "You did not did not answer yes or no ..."
		exit 0
	else
		if [ "$answer" == "Y" -o "$answer" == "y" ];then
			echo "Deleting $1 ...."
			aws ec2 deregister-image --image-id $1
		else
			echo  "Not deleting $1 ... "; exit 0
		fi
	fi 
fi
