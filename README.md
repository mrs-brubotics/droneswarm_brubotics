# droneswarm_brubotics system
![alt text](https://github.com/mrs-brubotics/droneswarm_brubotics/blob/master/.fig/collision_avoidance_2F450s.png)
![alt text](https://github.com/mrs-brubotics/droneswarm_brubotics/blob/master/.fig/rviz_collision_avoidance.png)

*  TODO[give overview picture rviz, sim, reality]
*  TODO[give overview of what this syste allows]
*  TODO check symbolic link [explanation](https://github.com/panda-brubotics/safe_panda/blob/master/README.md) 

The droneswarm_brubotics system is a platform devloped for the fundamental and applied robotics, automation, automatic control and Artificial Intelligence (AI) research on multiple Unmannded Aerial vehicles (UAVs).

It is mainly developed at the Robotics and Multibody Mechanics (R&MM) research group of the Vrije Universiteit Brussel (VUB) which is a member of VUB's Brussels Human Robotics Research Center (BruBotics) consortium. Most of the algorithms are developed in collaboration with the Robotics, Optimization, and Constrained Control (ROCC) lab of the University of Colorado Boulder.

The main project owners and collaborators are:
* Bryan Convens ([bryan.convens@vub.be](mailto:bryan.convens@vub.be)): project owner, PhD student at R&MM;
* Kelly Merckaert: project co-owner, PhD student at R&MM;
* Marco M. Nicotra: project collaborator, Assistant Professor at ROCC reponsible for providing several ideas related to the implemented navigation and control algorithms;
* Bram Vanderborght: project collaborator, Professor at R&MM reponsible for obtaining funding to support this project;
* Several MA students and interns of R&MM have contributed to this project.

This project has received its main funding from:
* FWO
* imec
* Flanders AI Research

All brubotics packages are extensions or alternatives to those provided by the [Multi-robot Systems (MRS) Group of the CTU in Prague](https://github.com/ctu-mrs) and are organized in the same way. We mostly work with multi-rotor UAVs, and for them specifically, we developed this navigation, control, estimation software. This can be tested both in simulation and on real-world hardware platforms. We think that real-world and replicable experiments should support excellent research and science in robotics. Thus our platform is built to allow safe verification of these approaches in planning, control, estimation, computer vision, tracking, and more.

## Meta-repositories
These meta-repositories aggregate related packages.
TODO do similar as [ctu](https://github.com/ctu-mrs/mrs_uav_system#meta-repositories)

## System properties
For a list of main features see [the list provided by CTU](https://github.com/ctu-mrs/mrs_uav_system#system-properties). Additionally we provide distributed control algorithms which have stronger correcness (i.e., safety, performance, computational efficiency, robustness) guarantees compared to several of the control algorithms provided by CTU as the latter rely heavily on more failure-prone user-tuned heuristics.

## Documentation
The primary source of documentation of this project is explained here [documentation package](https://github.com/mrs-brubotics/documentation_brubotics), but we also recommend to go through [CTU's documentation](https://ctu-mrs.github.io/). We advise all new users to read through all tutorials and README files of all packages before using this system. Take a look around the packages (each contains its own README), explore the launch files and be able to read the code, which we strive to keep readable. If issues arrise related to the brubotics systems open an issue [here](https://github.com/mrs-brubotics/droneswarm_brubotics/issues), if it is related to CTU's mrs_uav_system then open an issue [here](https://github.com/ctu-mrs/mrs_uav_system/issues).
The system follows a description presented in the article: TODO[add link to tutorial style article similar as ctu]

## Unmanned Aerial Vehicles
The droneswarm_brubotics system is currently pre-configured for the following UAV platforms, operated by R&MM. The platforms are order by the size / payload capacity. TODO[add pictures similar as ctu]

## Related packages
TODO[add those similar as ctu] The following packages are not necessarily part of our automated installation. Therefore, you might need to clone them by yourself and place them in your ROS workspace. Some of those are forks of third party repositories.
* [__controllers_brubotics__](https://github.com/mrs-brubotics/controllers_brubotics): ROS
* [__trackers_brubotics__](https://github.com/mrs-brubotics/trackers_brubotics): ROS
* [__planners_brubotics__](https://github.com/mrs-brubotics/planners_brubotics): ROS
* [__testing_brubotics__](https://github.com/mrs-brubotics/testing_brubotics): ROS
* [__visualization_brubotics__](https://github.com/mrs-brubotics/visualization_brubotics): ROS
* [__documentation_brubotics__](https://github.com/mrs-brubotics/testingdocumentation_brubotics)

## Backwards compatibility and updates
We do not guarantee backwards compatibility at any time. The platform is evolving according to the needs of the R&MM group. Updates can be made that are not going to be compatible with users local configs, simulation worlds, tmux sessions, etc. However, when we change something which requires user action to maintain compatibility, we will create an issue in this repository labelled users-read-me. Subscribe to this repository updates and issues by clicking the Watch button in the top-right corner of this page. Recent changes requiring user action:
* TODO[add item 1]
* Currently there are no known backwards incompatiblities.
We adivse also to take a look at [backwards compatibility and updates of CTU](https://github.com/ctu-mrs/mrs_uav_system#backwards-compatibility-and-updates).

## Installation
### Singularity and Docker
TODO[do similar as ctu]
### Native installation
#### Prerequisites
* Install Ubuntu 20.04 LTS desktop on a sufficiently powerful machine inteded to be used a simulation desktop (most demanding due to Gazebo simulation) or as on-board UAV computer. Note that most cheaper laptops give poor performance when running this framework. Follow [these instructions](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview), boot from USB flash drive by creating a bootable memory stick as explained in [this tutorial](https://ubuntu.com/tutorials/create-a-usb-stick-on-ubuntu#1-overview). Download the Ubutnu .iso desktop image [here](https://releases.ubuntu.com/focal/).
Note TODO[move to tutorial chapter explaining the ubuntu settings]: (re)installing Ubuntu on the lab desktop is is not trivial. Contact the responsible of this package in case Ubuntu needs to be reinstalled on that machine.
* We recommend to configure the Ubuntu machine as explained in [this tutorial](https://github.com/mrs-brubotics/documentation_brubotics/blob/main/source/Information_for_Internal_Collaborators.rst) in order to use all its functionalities.
* We assume the user regularly updates and upgrades the packages on the Ubuntu machine to the most recent version by running the Software Updater or by:
     ```bash
     sudo apt-get update
     ```
     ```bash
     sudo apt-get upgrade
     ```
     If there are packages which are failed to be updated or upgraded, first resolve this issue.

#### Installation of the droneswarm_brubotics system dependancies
 * DO NOT DO THIS ANYMORE!!! If this machine needs a first installation of the the mrs_uav_system and the droneswarm_brubotics we advice to first install the latest version of cmake as explained [at the end of this section](https://github.com/mrs-brubotics/droneswarm_brubotics/blob/master/README.md#matlab-plots) and then continue with [the native installation of the mrs_uav_system](https://github.com/mrs-brubotics/droneswarm_brubotics/blob/master/README.md#installation-of-the-mrs_uav_system-and-non-standard-installed-ctu-packages).
 * If on this machine the mrs_uav_system and the droneswarm_brubotics needs to be reinstalled then follow [these steps](https://github.com/mrs-brubotics/droneswarm_brubotics/blob/master/README.md#reinstalling-mrs_uav_system-and-droneswarm_brubotics).

##### Installation of the mrs_uav_system
* Refer yourself to the [mrs_uav_system](https://github.com/ctu-mrs/mrs_uav_system#native-installation) and their [tutorial](https://ctu-mrs.github.io/) to natively install and build the software. We do not require you to install [ctu's linux environment](https://github.com/ctu-mrs/mrs_uav_system#i-want-the-linux-environment-people-from-mrs-works-with). Before installation, check [here](https://github.com/ctu-mrs/mrs_uav_system#meta-repositories) that the build status of the mrs_uav_system is passing (green). If the build status is failing (red), you can copy their default install commands but replace the line
     ```bash
     git checkout master
     ```
     by the latest stable commit
     ```bash
     git checkout ba528c5e89aaf109731fb3bda5dc53219d513952
     ```
     which basically downgrades the mrs_uav_system as to ensure compatibility with the droneswarm_brubotics system.
* If not all packages are built correctly, try the multiple times ```catkin build``` in the mrs_workspace folder or the full installation in a new terminal.
* If too much RAM memory is required during the building process your screen will freeze, try ```catkin build -j2``` which ensures not more than two processes are used in parallel for building the software. Repeat ```catkin build``` until there are no errors and no warnings any more.
* If successful, this installation process creates the ```git```, ```mrs_workspace``` and ```workspace``` folders in your ```home``` directory. 
* It also automatically updates your ```./bashrc``` file that is loaded each time you open a new terminal. You can find the ```./bashrc``` in the ```Home``` directory by clicking on the three bars and checking the "Show Hidden Files" box.
* To test if the installation was successful, launch the following shell script
     ```bash
     cd ~/mrs_workspace/src/simulation/example_tmux_scripts/one_drone_gps
     ./start.sh
     
     ```
     The gazebo simulator should launch, together with rviz and a UAV should be taking off.
     ```bash
     cd ~/mrs_workspace/src/simulation/example_tmux_scripts/one_drone_rtk
     ./start.sh
     
     ```
     Now the same should happen, but odometry should be set to RTK instead of normal GPS.
* Avoid changing any code in any of ctu's packages, unless there is no other way to implement your functionality. If your application requires custum settings in ctu's packages, document clearly where these changes are required since these will need to be (un)done manually each time the software is reisntalled or used for other purposes.
* Regularly reinstall ctu's mrs_uav_system as it is evolving continuously and update the commits of all packages for which the droneswarm_brubotics codes works in this readme.
* If after installtion of the mrs_uav_system you cannot updated your machine anymore as described above and when shutting down, the ubutnu loader displays forever, there might be this known and solved issue wiuth the google-guest-agent service. Follow the steps [here](https://github.com/ctu-mrs/mrs_uav_system/discussions/76) and use htop to kill the google-guest processes. After these steps make sure you can update yuor system. If you cannot, go to Ubutnu's Software Updater and follow the steps.
* Regularly check ctu's ["Backwards compatibility and updates" section](https://github.com/ctu-mrs/mrs_uav_system#backwards-compatibility-and-updates) and see if it affects your code. 
   
##### Downgrading of default mrs_uav_system packages
Below we prove the commits of the standard mrs_uav_sytem packages that guarantee functionality of the droneswarm_brubotics system.
  mrs_package_to_downgrade:   
  ```bash 
  cd ~/mrs_workspace/src/.../mrs_package_to_downgrade
  git pull origin master
  git checkout commit_to_downgrade
  ```
  Rebuild the mrs_uav_system:
  ```bash
  cd ~/mrs_workspace
  catkin build 
  ```
  Test a .sh script. 
  ```bash
    cd ~/mrs_workspace/src/simulation/example_tmux_scripts/.../
    ./start.sh
  ```
##### Installation of some non-standard ctu packages
These packages are required dependancies of droneswarm_brubotics which have to be installed to obtain full functionality:
* mrs_gazebo_extras_resources
* trajectory_loader
* mrs_serial
* nimbro_network

However, these will be automatically installed with the droneswarm_brubotics via [this install script](https://github.com/mrs-brubotics/droneswarm_brubotics/blob/master/script/install_additional_ctu_packages.sh).

Only for onboard UAV computers: for the nimbro_network to work follow the Automatic Installation steps listed in the [README](https://github.com/ctu-mrs/nimbro_network) and when requested say yes 'y' to permanantly enable multicast. TODO REFER TO DETAILED STEPS OF NIMBRO

Regularly update the commits in [this install script](https://github.com/mrs-brubotics/droneswarm_brubotics/blob/master/script/install_additional_ctu_packages.sh) for which functionality with droneswarm_brubotics is guaranteed.

##### Installation of other dependancies
None for now.

#### Native installation of the droneswarm_brubotics system
We provide installation scripts that set everything up for you. Our automated installation will:
* clone [droneswarm_brubotics](https://github.com/mrs-brubotics/droneswarm_brubotics) into your git folder;
* source our ```shell_brubotics_additions.sh``` script;
* link it to your```workspace``` folder;
* install depedencies for the ROS packages [controllers_brubotics](https://github.com/mrs-brubotics/controllers_brubotics), [trackers_brubotics](https://github.com/mrs-brubotics/trackers_brubotics), [planners_brubotics](https://github.com/mrs-brubotics/planners_brubotics), [testing_brubotics](https://github.com/mrs-brubotics/testing_brubotics), and [visualization_brubotics](https://github.com/mrs-brubotics/visualization_brubotics) into ```droneswarm_brubotics/ros_packages```;
* install the package [documentation_brubotics](https://github.com/mrs-brubotics/documentation_brubotics) which contains the Read the Docs tutorial;
* build the```workspace```

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
* Follow the output generated during the installation process. There are no issues if during the 'Installing dependencies...' all repos are cloned and checked out sucessfully  (e.g., no uncommitted changes). You should now see these cloned repos in the git folder and in the workspace folder.
* Installing the first time on a new machine will throw the error: ```git@github.com: Permission denied (publickey)```. 
  * First, you need to setup your ssh keys correctly by following [these steps](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent). This needs to be done for each machine you use. The current ssh keys can be found in ```home/.shh```. Make sure you enables "Show Hidden Files" in the ```Home``` directory. 
  * Since August 2021 developers are required to use [personel access tokens](https://github.blog/2020-12-15-token-authentication-requirements-for-git-operations/). Follow [these steps](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token) to generate these tokens.
* Some packages require manual installation of the following dependencies once on each new machine:
  * [documentation_brubotics](https://github.com/mrs-brubotics/documentation_brubotics/blob/main/README.md) for python3 and sphinx-rtd-theme

##### Manual changes to be made after installation
###### Colorblind mode of the status window
If you are NOT colorblind, set colorblind_mode: False in the ```~/mrs_workspace/src/uav_core/ros_packages/mrs_uav_status/config/default.yaml```.

###### Simulating and experimenting with mass and motor parameters that resemble those found on our UAV hardware
Some of ctu's default UAV mass (and inertia) and motor parameters (and actuator constraints) were found to be quite different from the real values estimated on the UAV hardware platforms we have built. Therefore it is important to know where, how, and in which cases these parameters can be changed.
__Mass__:
In order to simulate with a hardware UAV mass (2.40 kg for f450, TODO??kg for t650) some manual changes are required in the mrs_uav_system (explained for the f450):
* Open ```~/mrs_workspace/src/simulation/ros_packages/mrs_simulation/models/mrs_robots_description/urdf/f450.xacro``` and adjust the mass: ```<xacro:property name="mass" value="${2.40-0.005*4.0-0.015-0.00001}" /> <!-- [kg] 2.40--> ```. This ensures that Gazebo simulates a UAV model with the hardware mass. Note that the xacro has slight offset from 2.4kg since afterwards some small masses (of motors, sensors) are added to the uav so we subtract them before they are added.
* Open ```~/mrs_workspace/src/uav_core/ros_packages/mrs_uav_managers/config/simulation/f450/mass.yaml``` and adjust the mass: ```uav_mass: 2.40 #2.00 # [kg]```. This ensures that the controllers and trackers that use mass (e.g., for feedforward actions) use th hardware mass.
* Catkin build the mrs_worspace (although not strcitly necessary if you only change configs, make a habit to catkin build more than too less)
* Do not forget to do the above steps each time you reinstall the mrs_uav_system!
For hardware experiments the UAV mass used in the controllers and trackers is the one set in the ~/.bashrc, hence the above changes do not effect operation on hardware.
* For UAVs with payload, you need to do the same for what concerns mass of only the UAV (excluding payload mass), but you also need to ensure that the xacro of the payload has the same payload mass as the one you use in the controller and tracker. For 2 UAVs each UAV offcourse compensates for half of the bar's mass instead of the total payload mass in the case of one UAV with cable suspended load.
__Motor parameters__:
In order to simulate and experiment with correct motor parameters that resemble hardware operation please take a look at [regulation_control_predictions_one_drone_rtk](https://github.com/mrs-brubotics/testing_brubotics/tree/master/tmux_scripts/bryan/regulation_control_predictions_one_drone_rtk) for what concerns the ```thrust_saturation``` value in ```custom_configs/gains``` and the ```motor_params``` in custom ```configs/motor_params_hardware.yaml``` and in ```custom configs/motor_params_simulation.yaml```. These are configred for the f450 UAV, the values for the t650 UAV are TODO.

#### Reinstalling mrs_uav_system and droneswarm_brubotics
We advice to regularly reinstall the mrs_uav_system and droneswarm_brubotics to check if everything still installs correctly.
Before reinstalling, delete the mrs_uav_system and/or droneswarm_brubotics folder inside the git folder and inside the workspace folder.
If you would like to reinstall everything just delete the git, the mrs_workspace and the worksapce folder.
This procedure is the same for each installed package. 
If there are installation or building problems which you cannot solve, please open an issue immediately.

#### Matlab Plots
* For data processing and plotting Matlab and Simulink version 2021a is at least required with the following toolboxes installed:
  * ROS toolbox
  * TODO add all toolboxes 
 
  In order to be able run the Matlab scripts that generate plots based on custom ctu mrs and/or brubotics ROS messages, first run the corresponding section of the script ```~/workspace/src/droneswarm_brubotics/useful_files/matlab/custom_msgs.m``` and perform the resulting Matlab instructions. Don't forget to include the ```matlab_msg_gen_ros1``` folder into the matlab path. Do this each time you reinstall droneswarm_brubotics.
  Note: DO NOT DO THIS ANYMORE!!! if matlab throws an error that a newer version of cmake is required to generate the ROS msgs and srvs (`this error <https://nl.mathworks.com/matlabcentral/answers/623103-matlab-2020b-rosgenmsg-can-t-find-cmake>`__), first check your version of cmake by
  
  ```bash
  cmake --version
  ```
  
  you can install the newest version of cmake by following these steps (https://apt.kitware.com/) (strongly advised). Another non-advised, but working procedure is to build any cmake version from source as explained in [Installing the Latest CMake on Ubuntu Linux](https://graspingtech.com/upgrade-cmake/). The installation procedure can take a few minutes. Do not forget to execute the last command sudo make install since it is not automatically launched when copying the code block. When you have not deleted the old version of cmake you won't automatically find a new version and an error is reported in the terminal when checking the cmake version (this problem: https://discourse.cmake.org/t/could-not-find-cmake-root/216/13). Either now you follow the first approach or you delete the old version and remove the old version (described on the top of [Installing the Latest CMake on Ubuntu Linux](https://graspingtech.com/upgrade-cmake/)), and reinstall. The catkin build command will not work anymore. Then reinstall everything starting from the top of this page.
  
  You could first also try
 
  ```bash  
   sudo apt-get install cmake
  ``` 
  but it will not necessarily install the newest cmake vesion.g the code block. When you have not deleted the old version of cmake you won't automatically find a new version and an error is reported in the terminal when checking the cmake version (this problem: https://discourse.cmake.org/t/could-not-find-cmake-root/216/13). Either now you follow the first approach or you delete the old version and remove the old version (described on the top of [Installing the Latest CMake on Ubuntu Linux](https://graspingtech.com/upgrade-cmake/)), and reinstall. The catkin build command will not work anymore. Then reinstall everything starting from the top of this page.
  
  You could first also try
 
  ```bash  
   sudo apt-get install cmake
  ``` 
  but it will not necessarily install the newest cmake vesion.

## Documentation

### ros_packages
See [related-packages section](https://github.com/mrs-brubotics/droneswarm_brubotics/blob/master/README.md#related-packages).

### script
* __install.sh__ : will source shell_brubotics_additions, add specific purpose .bashrc configs, link the to be installed (ROS) packages to ~/workspace/src, installs these packages defined in .gitman.yml, and automatically builds all the packages in mrs_workspace and workspace.
* NOT USED CURRENTLY __pull_all.sh__ : will pull files from this github but also it will pull files for the [mrs_uav_core](https://github.com/ctu-mrs/uav_core) and for [mrs_simulation](https://github.com/ctu-mrs/simulation).
* NOT USED CURRENTLY __overwrite_mrs_files__ : will overwrite mrs_workspace files in favour of files that you can find into useful_files/mrs_files/.
* NOT USED CURRENTLY __restore_mrs_files__ : will restore mrs_workspace files from the previous overwriting.

### shell_additions
Contains __shell_additions.sh__ : which contains the definitions of used shell functions used in the testing_brubotics pacakge.

### useful_files
* __matlab__ : [link to the github](https://github.com/mrs-brubotics/droneswarm_brubotics/tree/master/useful_files/matlab) which contains a script that makes our custom ROS messages interpretable by Matlab.
* NOT USED CURRENTLY __mrs_files__ : Contains modified files that we have to implement into mrs_workspace. In the control_manager.cpp file, disable_safety features are implemented.

## Adding a new repository under the default installed repositories of droneswarm_brubotics
* Update the [gitman.yaml](https://github.com/mrs-brubotics/droneswarm_brubotics/blob/master/.gitman.yml).
* Create a symbolic link to a directory as is explained [here](https://www.freecodecamp.org/news/symlink-tutorial-in-linux-how-to-create-and-remove-a-symbolic-link/) and [here](https://linuxize.com/post/how-to-create-symbolic-links-in-linux-using-the-ln-command/).  
* First create a directory with the same name as the repo name you used in the gitman.yaml. The symbolic link is created by:
     ```bash
     ln -s symLinkFolderName/ relativepathto/.gitman/repo_name_used_in_gitman.yaml
     ```
     For example: make sure .gitman/fbstab.yaml does not exist yet and droneswarm_brubotics/fbstab contains the latest version of fbstab
     ```bash
     cd ~
     ln -s .gitman/fbstab/ ~/workspace/src/droneswarm_brubotics/fbstab
     ```
     This creates the symbolic link .gitman/fbstab
* Put ROS packages in the ros_packages directory and other repositories elsewhere in droneswarm_brubotics. 
* You should push the changes in droneswarm_brubotics such that the symbolic link (e.g., [example for documentation_brubotics](https://github.com/mrs-brubotics/droneswarm_brubotics/blob/master/documentation_brubotics)) is git version controlled.

## Running the simulation
If you have successfully installed the system, you can continue with [starting the simulation](https://ctu-mrs.github.io/docs/simulation/howto.html).
TODO[addhardware specific links]
