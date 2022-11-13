# run the container
xhost +local:
docker run -it --rm \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix/:/tmp/.X11-unix \
    moveit2-tutorial:v1 $@
# open two terminal
# the first terminal
# ./run_docker.sh ros2 launch moveit2_tutorials move_group.launch.py
# the other terminal    
# docker exec -it <running-container-id> /ros_entrypoint.sh ros2 launch moveit2_tutorials move_group_interface_tutorial.launch.py