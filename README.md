# droneswarm_brubotics
All Brubotics packages are based on the work of [Multi-robot Systems (MRS) Group](https://github.com/ctu-mrs) of CTU Prague.

## Prerequisites
Install Ubuntu 18 LTS desktop on a powerful machine (most laptops give poor performance). Follow [these instructions](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview), boot from USB flash drive by creating a bootable memory stick as explain in [these tutorials](https://ubuntu.com/tutorials?topic=desktop). Download the Ubutnu iso image [here](https://releases.ubuntu.com/18.04.5/?_ga=2.174344866.1802272398.1615489706-53843902.1615489706).
Note: installing Ubuntu 18 on the lab desktop is is not trivial due to some internal bug. Contact the responsible of this package in case Ubuntu 18.04 needs to be reinstalled on that machine.

Regularly update Ubuntu by:
```bash
sudo apt-get update
sudo apt-get upgrade
```
If there are packages which are failed to be updated, first resolve this issue.
## Installation dependancies for droneswarm_brubotics 
If you already installed ctu or brubotics code and would like to reinstall, please follow [these steps](https://github.com/mrs-brubotics/droneswarm_brubotics/blob/master/README.md#reinstalling-droneswarm_brubotics).

### Installation mrs_uav_system
Install and build the mrs_uav_system:
Refer yourself to ctu mrs's [mrs_uav_system code](https://github.com/ctu-mrs/mrs_uav_system#installation) and [tutorial](https://ctu-mrs.github.io/). No need to install ctu's linux environment yet. Before isntallation, check that the build status is passing (green). If the build status is failing (red), you can clone proceed by replacing the checkout commit 'master' in the default install script
```bash
git checkout master
```
by the latest stable commit
```bash
git checkout replace_this_by_latest_stable_commit
```
IMPORTANT NOTE!: currently, the brubotics code works for the mrs_uav_system of commit 7ed0fd84e4f6d37468c429038ab384c8433cf597 (their current master branch at the time of writing). BUT the following has to be done manually after installation. DO NOT FORGET TO DO THIS WHEN REINSTALLING!
  * ```bash 
       cd ~/mrs_workspace/src/uav_core/ros_packages/mrs_uav_odometry
       git pull origin master
       git checkout d65c7d4c6c7b80f50d6d467f55d05f5197847686
       ```
  * ```bash 
       cd ~/mrs_workspace/src/uav_core/ros_packages/mrs_lib
       git pull origin master
       git checkout d6c17dcae2a163ff0bdc566f6d0eab1702828bb3 
       ```
  * ```bash
       catkin build 
       ```
  * Test one_drone_gps_baro. It works if the uavs do not keep increasing altitude. More info see this issue: https://github.com/ctu-mrs/mrs_uav_system/issues/95

If not all packages are built correctly, try the multiple times ```catkin build``` in the mrs_workspace folder or the full installation in a new terminal.
If too much RAM memory is required during the building process your screen will freeze, try ```catkin build -j2``` which ensures not more than two processes are building in parallel. Repeat ```catkin build``` until there are no errors and no warnings any more.
This installation process gives the ```git```, ```mrs_workspace``` and ```workspace``` folders and automatically updates your ```./bashrc``` file that is loaded when you open a new terminal. You can find the ```./bashrc``` in the Home directory by clicking on the three bars and checking the "Show Hidden Files" box.
To test if the installation was successful, launch the shell script ```~/mrs_workspace/src/simulation/example_tmux_scripts/one_drone_gps$ ./start.sh```. The gazebo simulator should open and a drone should be taking off.
Avoid changing any code in any of ctu's packages, unless there is no other way to implement your functionality. If your application requires custum setting in ctu's packages, report clearly where these are required since these will need to be done manually each time.
Regularly reinstall ctu's mrs_uav_system as it is evolving continuously and check the [backwards compatiblities and updates](https://github.com/ctu-mrs/mrs_uav_system#installation).

### Installation of some non standard ctu packages
The following packages are required dependancies of droneswarm_brubotics which have to be installed to obtain full functionality:
```bash
cd ~/workspace/src/
git clone https://github.com/ctu-mrs/mrs_gazebo_extras_resources
git clone https://github.com/ctu-mrs/trajectory_loader 
git clone https://github.com/ctu-mrs/mrs_serial
git clone https://github.com/ctu-mrs/nimbro_network.git
catkin build
```
* Only for onboard drone computers: for the nimbro_network to work follow the Automatic Installation steps listed in the [README](https://github.com/ctu-mrs/nimbro_network) and when requested say yes 'y' to permanantly enable multicast. TODO REFER TO DETAILED STEPS OF NIMBRO

## Installation of droneswarm_brubotics
We provide installation scripts that set everything up for you. Our automated installation will:
* clone [droneswarm_brubotics](https://github.com/mrs-brubotics/droneswarm_brubotics) into your git folder
* source our ```shell_additions.sh``` script
* link it to your```workspace``` folder
* install depedencies for the rospackages [controllers_brubotics](https://github.com/mrs-brubotics/controllers_brubotics), [trackers_brubotics](https://github.com/mrs-brubotics/trackers_brubotics) and [testing_brubotics](https://github.com/mrs-brubotics/testing_brubotics) into ```droneswarm/ros_packages```.
* build the```workspace```

Install manually the following dependencies once on each new machine:
* [documentation_brubotics](https://github.com/mrs-brubotics/documentation_brubotics/blob/main/README.md) for python3 and sphinx-rtd-theme

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
* Installing the first time on a new machine will throw the error: ```git@github.com: Permission denied (publickey)```. First, you need to setup your ssh keys correctly by following [these steps](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent). Also since August 2021 developers are required to use [personel access tokens](https://github.blog/2020-12-15-token-authentication-requirements-for-git-operations/). Follow [these steps](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token) to generate these tokes.

* For data processing and plotting Matlab and Simulink version 2021a is at least required with the following toolboxes installed:
  * ROS toolbox
  * TODO add all toolboxes 
 
  In order to be able run the Matlab scripts that generate plots based on custom ctu mrs and/or brubotics ROS messages, first run the corresponding section of the script ```~/workspace/src/droneswarm_brubotics/useful_files/matlab/custom_msgs.m``` and perform the resulting Matlab instructions. Don't forget to include the ```matlab_msg_gen_ros1``` folder into the matlab path. Do this each time you reinstall droneswarm_brubotics.
  Note: if matlab throws an error that a newer version of cmake is required to generate the ROS msgs and srvs, you can install any version of cmake by following the build from source steps in [Installing the Latest CMake on Ubuntu Linux](https://graspingtech.com/upgrade-cmake/). The installation procedure can take a few minutes. Do not forget to execute the last command sudo make install since it is not automatically launched when copying the code block. When you have deleted the old version of cmake (TODO: check if absolutely required since reinstall is not efficient to do again), catkin build command wil not work anymore. Reinstall everything starting from the top of this page.
  
  You could first also try
 
  ```bash  
   sudo apt-get install cmake
  ``` 
  but it will not necessarily install the newest cmake vesion.
  You can check the version of cmake by
  ```bash
  cmake --version
  ```

* Build the documentation_brubotics package as described [here](https://github.com/mrs-brubotics/documentation_brubotics).

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

## Adding a new repository under the default installed repositories
Update the [gitman.yaml](https://github.com/mrs-brubotics/droneswarm_brubotics/blob/master/.gitman.yml).
Create a symbolic link to a directory as is explained [here](https://linuxize.com/post/how-to-create-symbolic-links-in-linux-using-the-ln-command/). First create a directory with the same name as the repo name you used in the gitman.yaml. The symbolic link is created by:
```bash
ln -s symLinkFolderName/ relativepathto/.gitman/repo_name_used_in_gitman.yaml
```
Put ROS packages in ros_packages and other repositories elsewhere in droneswarm_brubotics. You should push the changes in droneswarm_brubotics such that the symbolic link (e.g. [example for documentation_brubotics](https://github.com/mrs-brubotics/droneswarm_brubotics/blob/master/documentation_brubotics)) is git version controlled.

## Reinstalling mrs_uav_system and droneswarm_brubotics
We advice to regularly reinstall the mrs_uav_system and droneswarm_brubotics to check if everything still installs correctly.
Before reinstalling, delete the mrs_uav_system and/or droneswarm_brubotics folder inside the git folder and inside the workspace folder.
If you would like to reinstall everything just delete the git, the mrs_workspace and the worksapce folder.
This procedure is the same for each installed package. 
If there are installation or building problems which you cannot solve, please open an issue immediately.
