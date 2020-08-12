#!/bin/bash

#get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd)`

echo "$0 : Clear workspace from droneswarm_brubotics"
cd ~/workspace/src
rm droneswarm_brubotics
cd ../
catkin clean

cd ~/mrs_workspace
rosclean purge

echo "$0 : restore simulation"
cd src/simulation
git reset --hard origin/master
git clean -f

cd ros_packages/mavlink_sitl_gazebo
git reset --hard origin/master
git clean -f

cd ../mrs_gazebo_common_resources
git reset --hard origin/master
git clean -f

cd ../mrs_simulation
git reset --hard origin/master
git clean -f

cd ../px4_firmware
git reset --hard origin/master
git clean -f

echo "$0 : restore uav_core"
cd ../../../uav_core
git reset --hard origin/master
git clean -f

cd ros_packages/mavros
git reset --hard origin/master
git clean -f

cd ../mrs_lib
git reset --hard origin/master
git clean -f

cd ../mrs_msgs
git reset --hard origin/master
git clean -f

cd ../mrs_rviz_plugins
git reset --hard origin/master
git clean -f

cd ../mrs_uav_general
git reset --hard origin/master
git clean -f

cd ../mrs_uav_odometry
git reset --hard origin/master
git clean -f

cd ../mrs_uav_testing
git reset --hard origin/master
git clean -f

cd ../mrs_bumper
git reset --hard origin/master
git clean -f

cd ../mrs_mavros_interface
git reset --hard origin/master
git clean -f

cd ../mrs_optic_flow
git reset --hard origin/master
git clean -f

cd ../mrs_uav_controllers
git reset --hard origin/master
git clean -f

cd ../mrs_uav_managers
git reset --hard origin/master
git clean -f

cd ../mrs_uav_status
git reset --hard origin/master
git clean -f

cd ../mrs_uav_trackers
git reset --hard origin/master
git clean -f

cd ~/git/mrs_uav_system
./install.sh
