FILE(REMOVE_RECURSE
  "../msg_gen"
  "../msg_gen"
  "../src/SpyKee/msg"
  "CMakeFiles/ROSBUILD_genmsg_py"
  "../src/SpyKee/msg/__init__.py"
  "../src/SpyKee/msg/_Motion.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
