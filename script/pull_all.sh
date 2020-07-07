#!/bin/bash

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd)`

cd $MY_PATH/..

git checkout master
git pull

#pull code from ros_package
gitman update

#pull code from mrs
cd ~/git/uav_core
git pull
gitman install

cd ~/git/simulation
git pull 
gitman install
