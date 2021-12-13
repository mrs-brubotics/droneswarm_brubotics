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

launch_control () {
  # add the configs of all custom controllers:
  if [ "$CONTROLLER_NAME" = "se3_copy_controller" ]
  then
  command roslaunch controllers_brubotics controllers_brubotics.launch custom_config_se3_copy_controller:=custom_configs/gains/controllers/$UAV_TYPE/$CONTROLLER_NAME.yaml; 
  fi

  # add the configs of all custom trackers:
  if [ "$TRACKER_NAME" = "dergbryan_tracker" ]
  then
  command roslaunch trackers_brubotics trackers_brubotics.launch custom_config_dergbryan_tracker:=custom_configs/gains/trackers/$TRACKER_NAME-$TRACKER_SUBTYPE.yaml; 
  fi
  if [ "$TRACKER_NAME" = "mpc_copy_tracker" ]
  then
  command roslaunch trackers_brubotics trackers_brubotics.launch custom_config_mpc_copy_tracker:=custom_configs/gains/trackers/$TRACKER_NAME-$TRACKER_SUBTYPE.yaml; 
  fi

  # add the custom configs of core.launch:
  command roslaunch mrs_uav_general core.launch WORLD_FILE:=custom_configs/world_simulation.yaml config_control_manager:=custom_configs/control_manager.yaml config_uav_manager:=custom_configs/uav_manager-$TRACKER_NAME.yaml config_odometry:=custom_configs/odometry.yaml config_constraint_manager:=custom_configs/constraint_manager.yaml config_se3_controller:=custom_configs/gains/controllers/$UAV_TYPE/se3_controller.yaml config_mpc_tracker:=custom_configs/gains/trackers/mpc_tracker-default.yaml config_motor_params:=custom_configs/motor_params_simulation_$UAV_TYPE.yaml config_uav_names:=custom_configs/uav_names.yaml
  
}

call_takeoff () {
  command rosservice call /$UAV_NAME/mavros/cmd/arming 1; sleep 2; rosservice call /$UAV_NAME/mavros/set_mode 0 offboard
}

load_and_goto_trajectory_start () {
  # command history -s $(echo waitForControl\; roslaunch testing_brubotics trajectory_bryan.launch file:=tmux_scripts/bryan/benchmarks_many_uavs_D-ERG/trajectories/30_uavs_2Dsteps_$UAV_NAME.txt\; sleep 2\; rosservice call /$UAV_NAME/control_manager/goto_trajectory_start)
  # pwd
  # b="${pwd}"
  # echo "$b"
  # command rospack find testing_brubotics
  #echo "the pwd is : ${pwd}"
  file_part1="tmux_scripts/bryan/benchmarks_collision_avoidance_many_uavs" # TODO make general based on last dis in pwd
  # echo "${file_part1}"
  file_part2="/trajectories/$NUM_UAVS-uavs_$TASK_TYPE-$UAV_NAME.txt"
  # echo "${file_part2}"
  full_file=${file_part1}""${file_part2}
  # echo "${full_file}"
  command roslaunch testing_brubotics trajectory_bryan.launch file:=${full_file}; 
  command sleep 2; 
  command rosservice call /$UAV_NAME/control_manager/goto_trajectory_start
}

bagbryan () {
  eval string1="$1"
  command rosbag record -O ./results/simulation/$string1/bag-$TEST_NAME-$UAV_NAME-$RUN_TYPE-$UAV_TYPE-$ODOMETRY_TYPE-$TRACKER_NAME-$CONTROLLER_NAME-`date "+%Y-%m-%d_%Hh-%Mm-%Ss"`.bag /$UAV_NAME/odometry/odom_main /$UAV_NAME/odometry/uav_state /$UAV_NAME/control_manager/cmd_odom /$UAV_NAME/control_manager/position_cmd /$UAV_NAME/control_manager/$TRACKER_NAME/goal_pose /$UAV_NAME/control_manager/$TRACKER_NAME/DistanceBetweenUavs /$UAV_NAME/control_manager/$TRACKER_NAME/TrajectoryTracking /$UAV_NAME/control_manager/$TRACKER_NAME/ComputationalTime
}

rosbagAllUAVs () {
  #eval string1="$1"
  #echo "${string1}"
  bagTopics="" # empty
  # TODO improve, currently hardcoded for NUM_UAVS, assuming these ids are numbered from 1 to...NUM_UAVS
  for ((i=1; i<=$NUM_UAVS;i++))
  do
    UAV_NAME="uav""$i";
    # echo "${UAV_NAME}"
    bagTopicsToAdd="/"$UAV_NAME"/odometry/odom_main /"$UAV_NAME"/odometry/uav_state /"$UAV_NAME"/control_manager/cmd_odom /"$UAV_NAME"/control_manager/position_cmd /"$UAV_NAME"/control_manager/"$TRACKER_NAME"/goal_pose /"$UAV_NAME"/control_manager/"$TRACKER_NAME"/DistanceBetweenUavs /"$UAV_NAME"/control_manager/"$TRACKER_NAME"/TrajectoryTracking /"$UAV_NAME"/control_manager/"$TRACKER_NAME"/ComputationalTime"
    # echo "${bagTopicsToAdd}"
    bagTopics=${bagTopics}" "${bagTopicsToAdd}
    # echo "${bagTopics}"
  done
  # echo "${bagTopics}"
  rosbag record -O ./results/simulation/$NUM_UAVS-uavs/bag-"allUAVs"-$NUM_UAVS-$RUN_TYPE-$UAV_TYPE-$ODOMETRY_TYPE-$TRACKER_NAME-$TRACKER_SUBTYPE-$CONTROLLER_NAME-`date "+%Y-%m-%d_%Hh-%Mm-%Ss"`.bag $bagTopics  #bagTopics
}

spawnAllUAVs () {
  string="" # empty
  # TODO improve, currently hardcoded for NUM_UAVS, assuming these ids are numbered from 1 to...NUM_UAVS
  for ((i=1; i<=$NUM_UAVS;i++))
  do
    string=${string}" "${i}
    # echo "${string}"
  done
  # echo "${string}"
  string_end="$UAV_TYPE --enable-ground-truth  --pos_file `pwd`/trajectories/$NUM_UAVS-uavs_spawn_location_$TASK_TYPE.csv"
  string=${string}" "${string_end}
  # echo "${string}"
  rosservice call /mrs_drone_spawner/spawn "${string}"
}
# #}
# #}
