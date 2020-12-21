# droneswarm_brubotics

Based on the work of [Multi-robot Systems Group](https://github.com/ctu-mrs).

## Installation
Before you go any further, you have to install the mrs_uav_system such that you obtain the```mrs_workspace``` and ```workspace``` folders. Refer yourself to [Multi-robot Systems Group](https://github.com/ctu-mrs/mrs_uav_system#installation).

The following packages are required dependancies which have to be installed:
```bash
cd ~/workspace/src/
git clone https://github.com/ctu-mrs/mrs_gazebo_extras_resources
```

We provide installation scripts that set everything up for you.
Our automated installation will:
* clone [droneswarm_brubotics](https://github.com/mrs-brubotics/droneswarm_brubotics) into your git folder
* source our ```shell_additions.sh``` script
* link it to your```workspace``` folder
* install depedencies for the rospackages [controllers_brubotics](https://github.com/mrs-brubotics/controllers_brubotics), [trackers_brubotics](https://github.com/mrs-brubotics/trackers_brubotics) and [testing_brubotics](https://github.com/mrs-brubotics/testing_brubotics) into ```droneswarm/ros_packages```.
* build the```workspace```

To start the automatic installation, please paste the following code into your terminal and press **enter**
```bash
cd /tmp
echo '
GIT_PATH=~/git
mkdir -p $GIT_PATH
cd $GIT_PATH
git clone https://github.com/mrs-brubotics/droneswarm_brubotics.git
source $GIT_PATH/droneswarm_brubotics/shell_additions/shell_additions.sh
cd droneswarm_brubotics/script/
./install.sh
cd ~/workspace/'> clone.sh && source clone.sh
```
In order to be able run the matlab scripts for generating plots using custom ctu mrs ROS messages, first run ```~/workspace/src/droneswarm_brubotics/useful_files/matlab/custom_msgs.m```.

## ROS_packages

* __controllers_brubotics__ : [link to the github](https://github.com/mrs-brubotics/controllers_brubotics)

* __trackers_brubotics__ : [link to the github](https://github.com/mrs-brubotics/trackers_brubotics)

* __testing_brubotics__ : [link to the github](https://github.com/mrs-brubotics/testing_brubotics)

## Script folder

* __install.sh__ : will link the packages to ~/workspace/src, install ROS packages, and automatically build the packages.

* __pull_all.sh__ : will pull files from this github but also it will pull files for the [mrs_uav_core](https://github.com/ctu-mrs/uav_core) and for [mrs_simulation](https://github.com/ctu-mrs/simulation).

* __overwrite_mrs_files__ : will overwrite mrs_workspace files in favour of files that you can find into useful_files/mrs_files/.

* __restore_mrs_files__ : will restore mrs_workspace files from the previous overwriting.

## Shell_addition folder

Contains __shell_additions.sh__ : which contains the definition of waitBeforeGoTo, a bash function to detect when GoTo service can be used.

## Useful_files folder

* __matlab_graph__ : [link to the github](https://github.com/mrs-brubotics/MatlabGraphs)

* __mrs_files__ : Contains modified files that we have to implement into mrs_workspace. In the control_manager.cpp file, disable_safety features are implemented.
