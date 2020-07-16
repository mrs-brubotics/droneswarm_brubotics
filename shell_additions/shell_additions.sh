#!/bin/bash

# #{ waitForTakingOff()

waitForTakingOff() {
  until timeout 3s rosservice call /$UAV_NAME/control_manager/goto "goal: [0.0, 10.0, 1.5, 0.0]" > /dev/null 2>&1; do
    echo "waiting for taking off"
    sleep 3;
  done
  while true
  do
    rosservice call /$UAV_NAME/control_manager/goto "goal: [0.0, 10.0, 1.5, 0.0]" > tmp.txt
    if grep -q "True" "tmp.txt"; then
      echo "True"
      rm tmp.txt
      break
    else
      echo "waiting for taking off2"
    fi
  done
  sleep 1;
}

# #}
