if(NOT USE_ROSBUILD)
  project(jsk_tools)

  find_package(catkin REQUIRED)
  set(ROS_BUILD_TYPE RelWithDebInfo)
  catkin_package(
    CATKIN_DEPENDS #
    LIBRARIES #
    INCLUDE_DIRS #
    DEPENDS #
    CFG_EXTRAS download_package.cmake
    )

  install(DIRECTORY src test
    DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
    )

endif()