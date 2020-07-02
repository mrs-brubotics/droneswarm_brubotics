#!/bin/bash

#get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd)`

echo "$0: linking droneswarm_brubotics to ~/workspace"
cd ~/workspace/src
ln -sf $MY_PATH/../../droneswarm_brubotics

echo "$0: install depedencies"
cd ~/workspace/src/droneswarm_brubotics
gitman install

echo "$0: modify mrs_workspace"
cd changed_files/
./change_file.sh

echo "$0: building workspace: NOT AVAILABLE NOW"
catkin build
