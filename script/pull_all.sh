#!/bin/bash

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd)`

echo "$0: if you use overwrite_mrs_files.sh restore mrs files"
./restore_mrs_files.sh

cd $MY_PATH/..

git checkout master
git pull

echo "$0: pull code from ros_package"
gitman update

echo "$0: pull code from mrs"
cd ~/git/uav_core
git pull
gitman install 

cd ~/git/simulation
git pull
gitman install

echo "$0: mrs files was restored, please use again overwrite_mrs_files.sh if you use it before pull."
echo "$0: do not forget to build mrs_workspace and workspace if changes have happened."
