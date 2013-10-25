FILE(REMOVE_RECURSE
  "../msg_gen"
  "../srv_gen"
  "../msg_gen"
  "../srv_gen"
  "../src/Echoes/msg"
  "../src/Echoes/srv"
  "CMakeFiles/ROSBUILD_gensrv_py"
  "../src/Echoes/srv/__init__.py"
  "../src/Echoes/srv/_FixedLed.py"
  "../src/Echoes/srv/_ResetLed.py"
  "../src/Echoes/srv/_BlinkingLed.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_gensrv_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
