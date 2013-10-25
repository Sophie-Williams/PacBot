FILE(REMOVE_RECURSE
  "../msg_gen"
  "../msg_gen"
  "../src/PhantomRobot/msg"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "../src/PhantomRobot/msg/__init__.py"
  "../src/PhantomRobot/msg/_PhantomMsg.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
