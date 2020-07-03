#!/bin/bash

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd)`

cd $MY_PATH/..

git checkout master
git pull

#pull code from ros_package
gitman update

#restore files on mrs_uav_manager to prevent git issues
cd changed_files/
./restore_files.sh

#pull code from mrs
cd ~/git/uav_core
git pull
gitman install

cd ~/git/simulation
git pull 
gitman install

#changed files on mrs_uav_manager
cd $MY_PATH/../changed_files
./change_files.sh

