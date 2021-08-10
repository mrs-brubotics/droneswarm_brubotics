#!/bin/bash

#get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd)`

#echo "$0: updating all ctu-mrs and mrs-brubotics files"
#./pull_all.sh  # we cannot checkout at ctu's master branches at all times (current bug in their altitude)

echo "$0: building the mrs_workspace"
cd ~/mrs_workspace
catkin build # add -j2 for easier compilation

echo "$0: linking = copying droneswarm_brubotics to ~/workspace/src"
cd ~/workspace/src/
ln -sf $MY_PATH/../../droneswarm_brubotics

echo "$0: installing depedencies"
cd droneswarm_brubotics/
gitman install

echo "$0: building the workspace"
cd ../../ #not strictly necessary
catkin build # add -j2 for easier compilation
