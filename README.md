# Gazebo Model Repository

## Summary
- This repository stores models for custom Gazebo objects
- A shell script for creating custom model.config file for URDF exported shell script is included

## Folder Organization
- Launch: miscellaneous launch files
- Models: Copy into .gazebo/model folder
- World: Copy into relevant ROS packages

## Notes
- If using Solidworks to URDF exporter, edit manifest and include your own email
- edit shell script to include your own author and email information!

- gazebo world files should reference from the .gazebo/model folders!

## Add to ~/.bashrc to add directory to Gazebo Model Search
- source /usr/share/gazebo/setup.sh
- export GAZEBO_MODEL_PATH=${GAZEBO_MODEL_PATH}:/home/michael/catkin_ws/src/gazebo_models/models

## References
- SDF Format: http://sdformat.org/spec
