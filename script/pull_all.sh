#!/bin/bash

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH= `( cd "$MY_PATH" && pwd )`

cd $MY_PATH/..

git checkout master
git pull

#when all the package will be built we can do pull more propelly

#pull code from mrs
cd ~/git/uav_core/ros_packages
./pull_all.sh

cd ~/git/simulation
git checkout master
git pull 


#come back to workspace folder
cd $MY_PATH
