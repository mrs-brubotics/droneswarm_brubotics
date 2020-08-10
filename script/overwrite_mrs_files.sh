#!/bin/bash

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd)`

#Disable safety features
cp $MY_PATH/../useful_files/mrs_files/controllers.yaml ~/mrs_workspace/src/uav_core/ros_packages/mrs_uav_managers/config/default

echo "$0: Do not forget to build the modified mrs_workspace"
