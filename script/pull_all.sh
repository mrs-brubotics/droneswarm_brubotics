#!/bin/bash

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd)`

cd $MY_PATH/..

git checkout master
git pull

#pull code from ros_package

cd ./ros_packages/controllers-brubotics
git pull

#pull code from mrs
cd ~/git/uav_core/ros_packages
./pull_all.sh

cd ~/git/simulation
git checkout master
git pull 


#come back to workspace folder
cd $MY_PATH
