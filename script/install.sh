#!/bin/bash

#get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd)`

echo "$0: make sure mrs_files and droneswarm_brubotics are up to date"
./pull_all.sh 

echo "$0: make sure mrs_workspace are build"
cd ~/mrs_workspace
catkin build

echo "$0: linking droneswarm_brubotics to ~/workspace"
cd ~/workspace/src/
ln -sf $MY_PATH/../../droneswarm_brubotics

echo "$0: install depedencies"
cd droneswarm_brubotics/
gitman install

echo "$0: building workspace"
cd ../../
catkin build
