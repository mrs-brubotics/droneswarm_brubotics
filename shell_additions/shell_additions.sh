#!/bin/bash

# #{ waitBeforeGoTo()

waitBeforeGoTo() {
  until timeout 3s rosservice call /$UAV_NAME/control_manager/goto "goal: [0.0, 10.0, 1.5, 0.0]" > /dev/null 2>&1; do
    echo "waiting for taking off"
    sleep 3;
  done
#find the current position of the UAV
  rostopic echo /$UAV_NAME/odometry/odom_main -n 1 > pos$UAV_NAME.txt
  N=0
  while read line
  do
    if [ $N = 2 ]
    then
      y=$(echo "$line" | cut -d'y' -f 2 | cut -d':' -f 2 | cut -d' ' -f 2;)
      break;
    fi
    if [ $N = 1 ]
    then
      x=$(echo "$line" | cut -d'x' -f 2 | cut -d':' -f 2 | cut -d' ' -f 2;)
      N=2;
    fi
    if [ "$line" = "position:" ]
    then
      N=1;
    fi
  done < pos$UAV_NAME.txt
  rm pos$UAV_NAME.txt
  while true
  do
    rosservice call /$UAV_NAME/control_manager/goto "goal: [$x, $y, 1.5, 0.0]" > etat$UAV_NAME.txt
    if grep -q "True" "etat$UAV_NAME.txt"; then
      echo "True"
      rm etat$UAV_NAME.txt
      break
    else
      echo "waiting for taking off"
    fi
    sleep 2;
  done
}


bagbryan () {
  eval string1="$1"
  command rosbag record -O ./results/simulation/$string1/bag-$TEST_NAME-$UAV_NAME-$RUN_TYPE-$UAV_TYPE-$ODOMETRY_TYPE-$TRACKER_NAME-$CONTROLLER_NAME-`date "+%Y-%m-%d_%Hh-%Mm-%Ss"`.bag /$UAV_NAME/odometry/odom_main /$UAV_NAME/odometry/uav_state /$UAV_NAME/control_manager/cmd_odom /$UAV_NAME/control_manager/position_cmd /$UAV_NAME/control_manager/$TRACKER_NAME/goal_pose /$UAV_NAME/control_manager/$TRACKER_NAME/DistanceBetweenUavs /$UAV_NAME/control_manager/$TRACKER_NAME/TrajectoryTracking /$UAV_NAME/control_manager/$TRACKER_NAME/ComputationalTime
}

takeoffbryan () {
  command rosservice call /$UAV_NAME/mavros/cmd/arming 1; sleep 2; rosservice call /$UAV_NAME/mavros/set_mode 0 offboard
}

controlbryan () {
  command roslaunch controllers_brubotics controllers_brubotics.launch custom_config_se3_copy_controller:=custom_configs/gains/simulation/se3_copy.yaml custom_config_se3_brubotics_controller:=custom_configs/gains/simulation/se3_brubotics.yaml; 
  command roslaunch trackers_brubotics trackers_brubotics.launch custom_config_dergbryan_tracker:=custom_configs/gains/dergbryan_trajb.yaml; 
  command roslaunch mrs_uav_general core.launch WORLD_FILE:=custom_configs/world_simulation.yaml config_control_manager:=custom_configs/control_manager.yaml config_uav_manager:=custom_configs/uav_manager.yaml config_odometry:=custom_configs/odometry.yaml config_constraint_manager:=custom_configs/constraint_manager.yaml config_se3_controller:=custom_configs/gains/simulation/se3.yaml config_motor_params:=custom_configs/motor_params_simulation.yaml config_uav_names:=custom_configs/uav_names.yaml
}

load_and_goto_trajectory_start () {
  command history -s $(echo waitForControl\; roslaunch testing_brubotics trajectory_bryan.launch file:=tmux_scripts/bryan/benchmarks_many_uavs_D-ERG/trajectories/30_uavs_2Dsteps_$UAV_NAME.txt\; sleep 2\; rosservice call /$UAV_NAME/control_manager/goto_trajectory_start)
}
# #}
# #}
