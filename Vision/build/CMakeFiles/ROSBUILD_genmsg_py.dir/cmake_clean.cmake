FILE(REMOVE_RECURSE
  "../msg_gen"
  "../msg_gen"
  "../src/Vision/msg"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "../src/Vision/msg/__init__.py"
  "../src/Vision/msg/_Results.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
