#!/usr/bin/env bash

if [ -z "$1" ];then
	echo "Pass in ami-id"
else
	aws ec2 describe-images --image-id $1 | grep -i snapshotid
fi

