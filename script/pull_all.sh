#!/bin/bash

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd)`

echo "$0: since you might have used overwrite_mrs_files.sh before, let's restore the mrs files"
./restore_mrs_files.sh

cd $MY_PATH/..

git checkout master
git pull

echo "$0: pulling code from ?ros_package?"
gitman update

echo "$0: pulling code from ctu-mrs" #https://ctu-mrs.github.io/docs/introduction/how_to_update.html
cd ~/git/uav_core
git pull
gitman install 

cd ~/git/simulation
git pull
gitman install

echo "$0: WARNING: ctu-mrs files in mrs_uav_managers are restored, please use again overwrite_mrs_files.sh if you use it before."
echo "$0: WARNING: do not forget to catkin build the mrs_workspace and the workspace."
