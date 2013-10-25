FILE(REMOVE_RECURSE
  "../msg_gen"
  "../srv_gen"
  "../msg_gen"
  "../srv_gen"
  "../src/Echoes/msg"
  "../src/Echoes/srv"
  "CMakeFiles/ROSBUILD_genmsg_lisp"
  "../msg_gen/lisp/Rfid.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_Rfid.lisp"
  "../msg_gen/lisp/IR.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_IR.lisp"
  "../msg_gen/lisp/Towers.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_Towers.lisp"
  "../msg_gen/lisp/Sonar.lisp"
  "../msg_gen/lisp/_package.lisp"
  "../msg_gen/lisp/_package_Sonar.lisp"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_genmsg_lisp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
