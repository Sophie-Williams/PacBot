FILE(REMOVE_RECURSE
  "../msg_gen"
  "../srv_gen"
  "../msg_gen"
  "../srv_gen"
  "../src/Echoes/msg"
  "../src/Echoes/srv"
  "CMakeFiles/ROSBUILD_genmsg_cpp"
  "../msg_gen/cpp/include/Echoes/Sonar.h"
  "../msg_gen/cpp/include/Echoes/IR.h"
  "../msg_gen/cpp/include/Echoes/Towers.h"
  "../msg_gen/cpp/include/Echoes/Rfid.h"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_cpp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
