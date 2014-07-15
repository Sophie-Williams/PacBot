FILE(REMOVE_RECURSE
  "../msg_gen"
  "../srv_gen"
  "../msg_gen"
  "../srv_gen"
  "../src/Echoes/msg"
  "../src/Echoes/srv"
  "CMakeFiles/ROSBUILD_gensrv_lisp"
  "../srv_gen/lisp/ResetLed.lisp"
  "../srv_gen/lisp/_package.lisp"
  "../srv_gen/lisp/_package_ResetLed.lisp"
  "../srv_gen/lisp/BlinkingLed.lisp"
  "../srv_gen/lisp/_package.lisp"
  "../srv_gen/lisp/_package_BlinkingLed.lisp"
  "../srv_gen/lisp/FixedLed.lisp"
  "../srv_gen/lisp/_package.lisp"
  "../srv_gen/lisp/_package_FixedLed.lisp"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_gensrv_lisp.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
