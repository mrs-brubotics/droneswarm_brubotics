#!/bin/bash

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd)`

echo "$0: mrs_gazebo_extras_resources"
cd ~/workspace/src/
rm -rf mrs_gazebo_extras_resources
git clone https://github.com/ctu-mrs/mrs_gazebo_extras_resources
cd mrs_gazebo_extras_resources
git checkout 22bf7c10fae81078f034bbd9ef0549b2e0b7de69
#catkin build
echo "$0: trajectory_loader"
cd ~/workspace/src/
rm -rf trajectory_loader
git clone https://github.com/ctu-mrs/trajectory_loader 
cd trajectory_loader
git checkout 719b1600f56e2d2d8cf0290c5ec03a0f56d6bd7c
#catkin build
echo "$0: mrs_serial"
cd ~/workspace/src/
rm -rf mrs_serial
git clone https://github.com/ctu-mrs/mrs_serial
cd mrs_serial
git checkout c8eb7fb3b29f36c878d7c65043639d12da2a80bf
#catkin build
echo "$0: nimbro_network"
cd ~/workspace/src/
rm -rf nimbro_network
git clone https://github.com/ctu-mrs/nimbro_network
cd nimbro_network
git checkout 86cb0e30f451b00efc6a69259cfa767848122e10
#catkin build
