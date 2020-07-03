# droneswarm_brubotics

Based on the work of [Multi-robot Systems Group](https://github.com/ctu-mrs)

## Installation
Before you go any further, you have to install ```mrs_workspace``` and ```workspace```, refer yourself to [Multi-robot Systems Group](https://github.com/ctu-mrs/mrs_uav_system#installation).

We provide installation scripts that set everything up for you.
Our automated installation will:
* clone [droneswarm_brubotics](https://github.com/mrs-brubotics/droneswarm_brubotics) into your git folder
* link it to ```workspace```.
* install depedencies with rospackages [controllers_brubotics](https://github.com/mrs-brubotics/controllers_brubotics) and [trackers_brubotics](https://github.com/mrs-brubotics/trackers_brubotics) into ```droneswarm/ros_packages```.
* change files on ```~/mrs_workspace/src/uav_core/config/simulation/t650``` needed for the compilation.
* Build ```workspace```

To start the automatic installation, please paste the following code into your terminal and press **enter**
```bash
cd /tmp
echo '
GIT_PATH=~/git
mkdir -p $GIT_PATH
cd $GIT_PATH
git clone https://github.com/mrs-brubotics/droneswarm_brubotics.git
cd droneswarm_brubotics/script/
./install.sh
cd ~/workspace/'> clone.sh && source clone.sh
```

## ROS_package

* __controllers-brubotics__ : [link to the github](https://github.com/Internship-Brubotics-2020/controllers_brubotics)

* __trackers_brubotics__ : [link to the github](https://github.com/mrs-brubotics/trackers_brubotics)

## Changed_files

Contains config files needed to add trackers and controllers

* __change_files.sh__ will copy-paste the files on ```~/mrs_workspace/src/uav_core/config/simulation/t650```

* __restore_files.sh__ will restore mrs_workspace
 
## Script folder

* __install.sh__ will link the package to ~/workspace/src, install ROS packages, change files on ```~/mrs_workspace/src/uav_core/config/simulation/t650``` and build automatically the packages.

* __pull_all.sh__ will pull files from this github but also it will pull files for the [mrs_uav_core](https://github.com/ctu-mrs/uav_core) and for [mrs_simulation](https://github.com/ctu-mrs/simulation).

## Tmux_script 

* __one_drone_interns__ contains tmux script to launch one_drone simulation 

