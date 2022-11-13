

FROM ros:galactic-ros-base-focal
RUN apt update && apt dist-upgrade -y && apt install nano -y
RUN sudo rosdep fix-permissions && rosdep update && colcon mixin update default
RUN mkdir -p ~/ws_moveit2/src && \
    cd ~/ws_moveit2/src && \
    git clone -b galactic https://github.com/ros-planning/moveit2_tutorials.git --depth 1 && \
    vcs import < moveit2_tutorials/moveit2_tutorials.repos
RUN apt-get install -y ros-galactic-controller-manager-msgs
RUN apt-get install -y ros-galactic-interactive-markers
RUN apt-get install -y ros-galactic-joint-state-publisher
RUN apt-get install -y ros-galactic-xacro
RUN apt-get install -y ros-galactic-octomap
RUN apt-get install -y ros-galactic-controller-manager
RUN apt-get install -y ros-galactic-rviz2
RUN apt-get install -y ros-galactic-ros-testing
RUN apt-get install -y ros-galactic-gripper-controllers
RUN apt-get install -y ros-galactic-joint-state-broadcaster
RUN apt-get install -y ros-galactic-joint-trajectory-controller
RUN apt-get install -y ros-galactic-joy
RUN apt-get install -y ros-galactic-control-msgs
RUN apt-get install -y ros-galactic-control-toolbox
RUN apt-get install -y ros-galactic-backward-ros
RUN apt-get install -y ros-galactic-srdfdom
RUN apt-get install -y ros-galactic-graph-msgs
RUN apt-get install -y libboost-date-time1.71.0
RUN apt-get install -y libboost-filesystem1.71.0
RUN apt-get install -y libboost-dev
RUN apt-get install -y libboost-date-time-dev
RUN apt-get install -y libboost-filesystem-dev
RUN apt-get install -y python-lxml
RUN apt-get install -y ros-galactic-object-recognition-msgs
RUN apt-get install -y libogre-1.9-dev
RUN apt-get install -y libqt5opengl5-dev
RUN apt-get install -y qtbase5-dev
RUN apt-get install -y libboost-all-dev
RUN apt-get install -y libqt5widgets5
RUN apt-get install -y ros-galactic-rviz-common
RUN apt-get install -y ros-galactic-rviz-ogre-vendor
RUN apt-get install -y ros-galactic-rviz-rendering
RUN apt-get install -y ros-galactic-rviz-default-plugins
RUN apt-get install -y ros-galactic-eigen-stl-containers
RUN apt-get install -y ros-galactic-ompl
RUN apt-get install -y libomp-dev
RUN apt-get install -y libassimp-dev
RUN apt-get install -y libqhull-dev
RUN apt-get install -y ros-galactic-random-numbers
RUN apt-get install -y ros-galactic-resource-retriever
RUN apt-get install -y ros-galactic-angles
RUN apt-get install -y libfcl-dev
RUN apt-get install -y ros-galactic-octomap-msgs
RUN apt-get install -y ros-galactic-warehouse-ros
RUN apt-get install -y ros-galactic-image-transport
RUN apt-get install -y freeglut3-dev
RUN apt-get install -y libglew-dev
RUN apt-get install -y libgl1-mesa-dev
RUN apt-get install -y libglu1-mesa-dev
RUN apt-get install -y ros-galactic-cv-bridge
RUN apt-get install -y ros-galactic-joint-state-publisher-gui
RUN apt-get install -y ros-galactic-ros2-control
RUN apt-get install -y ros-galactic-warehouse-ros-mongo
RUN apt-get install -y libyaml-cpp-dev
RUN cd ~/ws_moveit2/src && \
    rosdep install -r --from-paths . --ignore-src --rosdistro $ROS_DISTRO -y
RUN cd ~/ws_moveit2 && \
    . /opt/ros/$ROS_DISTRO/setup.sh && \
    colcon build --mixin release --packages-select \
    moveit_resources_panda_description \
    moveit_common \
    moveit_resources_panda_moveit_config \
    geometric_shapes \
    moveit_resources_fanuc_description \
    moveit_resources_pr2_description \
    moveit_resources_fanuc_moveit_config \
    moveit_resources_prbt_support \
    moveit_resources \
    rviz_visual_tools \
    launch_param_builder \
    moveit_msgs \
    moveit_configs_utils \
    moveit_core \
    moveit_resources_prbt_ikfast_manipulator_plugin \
    chomp_motion_planner \
    moveit_simple_controller_manager \
    moveit_ros_occupancy_map_monitor \
    moveit_chomp_optimizer_adapter \
    pilz_industrial_motion_planner_testutils \
    moveit_plugins \
    moveit_planners_chomp \
    moveit_ros_control_interface \
    moveit_ros_planning \
    moveit_ros_warehouse \
    moveit_kinematics \
    moveit_ros_robot_interaction \
    moveit_planners_ompl \
    moveit_ros_benchmarks \
    moveit_ros_move_group \
    moveit_ros_perception \
    moveit_resources_prbt_moveit_config \
    moveit_visual_tools \
    moveit_resources_prbt_pg70_support \
    moveit_ros_planning_interface
RUN cd ~/ws_moveit2 && \
    . /opt/ros/$ROS_DISTRO/setup.sh && \
    colcon build --mixin release --packages-select moveit_ros_visualization
RUN cd ~/ws_moveit2 && \
    . /opt/ros/$ROS_DISTRO/setup.sh && \
    colcon build --mixin release --packages-select moveit_servo
RUN cd ~/ws_moveit2 && \
    . /opt/ros/$ROS_DISTRO/setup.sh && \
    colcon build --mixin release
RUN sed -i '/source "\/opt\/ros\/$ROS_DISTRO\/setup.bash" --/asource "\/root\/ws_moveit2\/install\/setup.bash" --' /ros_entrypoint.sh
