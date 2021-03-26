#!/bin/bash

#get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd)`

echo "$0: updating all ctu-mrs and mrs-brubotics files"
./pull_all.sh 

echo "$0: building the mrs_workspace"
cd ~/mrs_workspace
catkin build

echo "$0: linking droneswarm_brubotics to ~/workspace"
cd ~/workspace/src/
ln -sf $MY_PATH/../../droneswarm_brubotics

echo "$0: installing depedencies"
cd droneswarm_brubotics/
gitman install

echo "$0: building the workspace"
cd ../../
catkin build
