#!/bin/bash

# get the path to this script
MY_PATH=`dirname "$0"`

cd $MY_PATH/..

git checkout master
git pull


#pull code from mrs
cd ~/git/uav_core/ros_packages
./pull_all.sh

cd ~/git/simulation
git checkout master
git pull 


#come back to workspace folder
cd $MY_PATH
