echo "$0: linking Droneswarm to ~/workspace"
cd ~/workspace/src
ln -sf ~/git/Droneswarm

echo "$0: building workspace"
cd ~/workspace
catkin build
