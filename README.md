# droneswarm_brubotics
All brubotics packages are based on the work of [Multi-robot Systems (MRS) Group of the CTU in Prague](https://github.com/ctu-mrs).

## Prerequisites
* Install Ubuntu 20.04 LTS desktop on a sufficiently powerful machine inteded to be used a simulation desktop (most demanding due to Gazebo simulation) or as on-board UAV computer. Note that most cheaper laptops give poor performance when running this framework. Follow [these instructions](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview), boot from USB flash drive by creating a bootable memory stick as explained in [this tutorial](https://ubuntu.com/tutorials/create-a-usb-stick-on-ubuntu#1-overview). Download the Ubutnu .iso desktop image [here](https://releases.ubuntu.com/focal/).
Note TODO[move to tutorial chapter explaining the ubuntu settings]: (re)installing Ubuntu on the lab desktop is is not trivial. Contact the responsible of this package in case Ubuntu needs to be reinstalled on that machine.
* We recommend to configure the Ubuntu machine as explained in TODO[cite tutorial chapter explaining the ubuntu settings] in order to use all its functionalities.
* We assume the user regularly updates and upgrades the packages on the Ubuntu machine to the most recent version by running the Software Updater or by:
     ```bash
     sudo apt-get update
     ```
     ```bash
     sudo apt-get upgrade
     ```
     If there are packages which are failed to be updated or upgraded, first resolve this issue.

## Installation dependancies for the droneswarm_brubotics
 * If this machine needs a first installation of the the mrs_uav_system and the droneswarm_brubotics we advice to first install the latest version of cmake as explained [at the end of this section](https://github.com/mrs-brubotics/droneswarm_brubotics/blob/master/README.md#matlab-plots) and then continue with [the installation of the mrs_uav_system](https://github.com/mrs-brubotics/droneswarm_brubotics/edit/master/README.md#installation-of-the-mrs_uav_system).
 * If on this machine the mrs_uav_system and the droneswarm_brubotics needs to be reinstalled then follow [these steps](https://github.com/mrs-brubotics/droneswarm_brubotics/blob/master/README.md#reinstalling-mrs_uav_system-and-droneswarm_brubotics).

### Installation of the mrs_uav_system
* Refer yourself to the [mrs_uav_system](https://github.com/ctu-mrs/mrs_uav_system#installation) and their [tutorial](https://ctu-mrs.github.io/) to install and build the software. We do not require you to install ctu's linux environment. Before installation, check that the build status is passing (green). If the build status is failing (red), you can clone proceed by replacing the checkout commit 'master' in the default install script
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
  * Test one_drone_gps_baro. 
    ```bash
    cd ~/mrs_workspace/src/simulation/example_tmux_scripts/one_drone_gps_baro/
    ./start.sh
    ```
    It works if the uavs do not keep increasing altitude. More info see this issue: https://github.com/ctu-mrs/mrs_uav_system/issues/95

If not all packages are built correctly, try the multiple times ```catkin build``` in the mrs_workspace folder or the full installation in a new terminal.
If too much RAM memory is required during the building process your screen will freeze, try ```catkin build -j2``` which ensures not more than two processes are building in parallel. Repeat ```catkin build``` until there are no errors and no warnings any more.
This installation process gives the ```git```, ```mrs_workspace``` and ```workspace``` folders and automatically updates your ```./bashrc``` file that is loaded when you open a new terminal. You can find the ```./bashrc``` in the Home directory by clicking on the three bars and checking the "Show Hidden Files" box.
To test if the installation was successful, launch the shell script ```~/mrs_workspace/src/simulation/example_tmux_scripts/one_drone_gps$ ./start.sh```. The gazebo simulator should open and a drone should be taking off.
Avoid changing any code in any of ctu's packages, unless there is no other way to implement your functionality. If your application requires custum setting in ctu's packages, report clearly where these are required since these will need to be done manually each time.
Regularly reinstall ctu's mrs_uav_system as it is evolving continuously and check the [backwards compatiblities and updates](https://github.com/ctu-mrs/mrs_uav_system#installation).
### Backward compability issue
CTU changed several of their package, see this [issue], which cause our workspace to not build correctly. This is due to the fact that our controller, and other packages rely on mrs_lib::Transformer, that has been modified. 
To overcome this issue and still be able to use the framework, downgrade the following package with the corresponding commit (git checkout COMMITNUMBER) :
```
mrs_bumper: 4d848688ea4085d7a112d9a09519fd007891cf55
mrs_uav_manager: f5a9fe66cfc04f277835c1613a0c5a0d5c61c7ce
mrs_uav_odometry : 186f119043d2a7dcb6171dcee83a7e880841ed83
mrs_uav_testing ; a5409b412aaf7bab922a752f1f99912dc2a3857a
mrs_uav_status : 7989ad126f5a110a97cb8c7767f2f9d7e566a54e
mrs_uav_tracker : 30ad30c0d3e424b3e317946a714d20481bf03211
mrs_uav_trajectory_generation : 0cc100e6e584f01933127c1e96cb219fdbc2aa00
mrs_uav_controllers : ff74730f42a9adf323dbfe79a99b4c85acf81104
```
Do ``` catkin build ``` in the mrs_workspace folder and see if everything is built correctly.

### Some known issues
* If after installtion of the mrs_uav_system you cannot updated your machine anymore as described above and when shutting down, the ubutnu loader displays forever, there might be this known and solved issue wiuth the google-guest-agent service. Follow the steps here (https://github.com/ctu-mrs/mrs_uav_system/discussions/76) and use htop to kill the google-guest processes. After these steps make sure you can update yuor system. If you cannot, go to Ubutnu's Software Updater and follow the steps.
* Regularly check ctu's "Backwards compatibility and updates" section (https://github.com/ctu-mrs/mrs_uav_system#backwards-compatibility-and-updates) and see if it affects your code. 

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
cd droneswarm_brubotics/script/
./install.sh -g $GIT_PATH
'> clone.sh && source clone.sh
```
* Manually follow the output generated during the installation process. There are no issues if during the 'Installing dependencies...' all repos are cloned and checked out sucessfully  (e.g. no uncommitted changes). You should now see these cloned repos in the git folder and in the workspace folder.
* Installing the first time on a new machine will throw the error: ```git@github.com: Permission denied (publickey)```. 
  * First, you need to setup your ssh keys correctly by following [these steps](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent). This need to be done for each machine you use. The current ssh keys can be found in the home/.shh folder. Make sure you set the Home folder to "Show Hidden Files". 
  * Also since August 2021 developers are required to use [personel access tokens](https://github.blog/2020-12-15-token-authentication-requirements-for-git-operations/). Follow [these steps](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token) to generate these tokes.

### Simulating and experimenting with mass and motor parameters that resemble those found on UAV hardware
Some of ctu's default UAV mass (and inertia) and motor parameters (and actuator constraints) were found to be quite different from the real values estimated on the UAV hardware platforms we have built. Therefore it is important to know where, how, and in which cases these parameters can be changed.
#### Mass:
In order to simulate with a hardware UAV mass (2.40 kg for f450, TODO??kg for t650) some manual changes are required in the mrs_uav_system (explained for the f450):
* Open ```~/mrs_workspace/src/simulation/ros_packages/mrs_simulation/models/mrs_robots_description/urdf/f450.xacro``` and adjust the mass: ```<xacro:property name="mass" value="${2.40-0.005*4.0-0.015-0.00001}" /> <!-- [kg] 2.40--> ```. This ensures that Gazebo simulates a UAV model with the hardware mass. Note that the xacro has slight offset from 2.4kg since afterwards some small masses (of motors, sensors) are added to the uav so we subtract them before they are added.
* Open ```~/mrs_workspace/src/uav_core/ros_packages/mrs_uav_managers/config/simulation/f450/mass.yaml``` and adjust the mass: ```uav_mass: 2.40 #2.00 # [kg]```. This ensures that the controllers and trackers that use mass (e.g., for feedforward actions) use th hardware mass.
* Catkin build the mrs_worspace (although not strcitly necessary if you only change configs, make a habit to catkin build more than too less)
* Do not forget to do the above steps each time you reinstall the mrs_uav_system!
For hardware experiments the UAV mass used in the controllers and trackers is the one set in the ~/.bashrc, hence the above changes do not effect operation on hardware.
* For UAVs with payload, you need to do the same for what concerns mass of only the UAV (excluding payload mass), but you also need to ensure that the xacro of the payload has the same payload mass as the one you use in the controller and tracker. For 2 UAVs each UAV offcourse compensates for half of the bar's mass instead of the total payload mass in the case of one UAV with cable suspended load.
#### Motor parameters:
In order to simulate and experiment with correct motor parameters that resemble hardware operation please take a look at [regulation_control_predictions_one_drone_rtk](https://github.com/mrs-brubotics/testing_brubotics/tree/master/tmux_scripts/bryan/regulation_control_predictions_one_drone_rtk) for what concerns the ```thrust_saturation``` value in ```custom_configs/gains``` and the ```motor_params``` in custom ```configs/motor_params_hardware.yaml``` and in ```custom configs/motor_params_simulation.yaml```. These are configred for the f450 UAV, the values for the t650 UAV are TODO.

### Matlab Plots
* For data processing and plotting Matlab and Simulink version 2021a is at least required with the following toolboxes installed:
  * ROS toolbox
  * TODO add all toolboxes 
 
  In order to be able run the Matlab scripts that generate plots based on custom ctu mrs and/or brubotics ROS messages, first run the corresponding section of the script ```~/workspace/src/droneswarm_brubotics/useful_files/matlab/custom_msgs.m``` and perform the resulting Matlab instructions. Don't forget to include the ```matlab_msg_gen_ros1``` folder into the matlab path. Do this each time you reinstall droneswarm_brubotics.
  Note: if matlab throws an error that a newer version of cmake is required to generate the ROS msgs and srvs, first check your version of cmake by
  
  ```bash
  cmake --version
  ```
  
  you can install the newest version of cmake by following these steps (https://apt.kitware.com/) (strongly advised). Another non-advised, but working procedure is to build any cmake version from source as explained in [Installing the Latest CMake on Ubuntu Linux](https://graspingtech.com/upgrade-cmake/). The installation procedure can take a few minutes. Do not forget to execute the last command sudo make install since it is not automatically launched when copying the code block. When you have not deleted the old version of cmake you won't automatically find a new version and an error is reported in the terminal when checking the cmake version (this problem: https://discourse.cmake.org/t/could-not-find-cmake-root/216/13). Either now you follow the first approach or you delete the old version and remove the old version (described on the top of [Installing the Latest CMake on Ubuntu Linux](https://graspingtech.com/upgrade-cmake/)), and reinstall. The catkin build command will not work anymore. Then reinstall everything starting from the top of this page.
  
  You could first also try
 
  ```bash  
   sudo apt-get install cmake
  ``` 
  but it will not necessarily install the newest cmake vesion.

### Documentation
* All packages have README.md files which expliain their use.
* A general documentation package is also available. We advise all new users to read TODO chapter on info for internal collaborators. Build the documentation_brubotics package as described [here](https://github.com/mrs-brubotics/documentation_brubotics).

### ROS_packages

* __controllers_brubotics__ : [link to the github](https://github.com/mrs-brubotics/controllers_brubotics)

* __trackers_brubotics__ : [link to the github](https://github.com/mrs-brubotics/trackers_brubotics)

* __testing_brubotics__ : [link to the github](https://github.com/mrs-brubotics/testing_brubotics)

### Script folder

* __install.sh__ : will link the packages to ~/workspace/src, install ROS packages, and automatically build the packages.

* __pull_all.sh__ : will pull files from this github but also it will pull files for the [mrs_uav_core](https://github.com/ctu-mrs/uav_core) and for [mrs_simulation](https://github.com/ctu-mrs/simulation).

* __overwrite_mrs_files__ : will overwrite mrs_workspace files in favour of files that you can find into useful_files/mrs_files/.

* __restore_mrs_files__ : will restore mrs_workspace files from the previous overwriting.

### Shell_addition folder

Contains __shell_additions.sh__ : which contains the definition of waitBeforeGoTo, a bash function to detect when GoTo service can be used.

### Useful_files folder

* __matlab_graph__ : [link to the github](https://github.com/mrs-brubotics/MatlabGraphs)

* __mrs_files__ : Contains modified files that we have to implement into mrs_workspace. In the control_manager.cpp file, disable_safety features are implemented.

### Adding a new repository under the default installed repositories
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
