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

# #}