#!/bin/bash

#get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd)`

echo "$0: linking Droneswarm to ~/workspace"
cd ~/workspace/src
ln -sf $MY_PATH/../../Droneswarm

echo "$0: building workspace"
cd ~/workspace

gitman install

#catkin build
