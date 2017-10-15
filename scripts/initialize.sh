#!/usr/bin/env bash

## Upgrade system
sudo apt-get update
sudo apt-get upgrade

## Install pip
sudo apt-get -y install python-pip

## Upgrade PIP
pip install --upgrade pip 

## Add clarence as a user
sudo useradd clarence -p gr33n3r!
