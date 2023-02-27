#!/bin/bash

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd)`

echo "$0: mrs_gazebo_extras_resources"
cd ~/workspace/src/
rm -rf mrs_gazebo_extras_resources
git clone https://github.com/ctu-mrs/mrs_gazebo_extras_resources
cd mrs_gazebo_extras_resources
git checkout 2e38e69c178f70f38cf8c8042cb95a7565f07344
#catkin build
echo "$0: trajectory_loader"
cd ~/workspace/src/
rm -rf trajectory_loader
git clone https://github.com/ctu-mrs/trajectory_loader 
cd trajectory_loader
git checkout 1da108271b2c20f3c16c9e6bc94cd9e807bbdc3c
#catkin build
echo "$0: mrs_serial"
cd ~/workspace/src/
rm -rf mrs_serial
git clone https://github.com/ctu-mrs/mrs_serial
cd mrs_serial
git checkout 8e234320d82f996eb3c1268cc5c232ae1eabdf75
#catkin build
echo "$0: nimbro_network"
cd ~/workspace/src/
rm -rf nimbro_network
git clone https://github.com/ctu-mrs/nimbro_network
cd nimbro_network
git checkout 5068b6413372c309542a95ad522642d9406fa66f
#catkin build
