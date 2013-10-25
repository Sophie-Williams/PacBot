FILE(REMOVE_RECURSE
  "../src/predgram.tab.cpp"
  "../src/predgram.tab.hpp"
  "../src/predflex.cpp"
  "../src/rulesgram.tab.cpp"
  "../src/rulesgram.tab.hpp"
  "../src/rulesflex.cpp"
  "../src/shapegram.tab.cpp"
  "../src/shapegram.tab.hpp"
  "../src/shapeflex.cpp"
  "../src/assgram.tab.cpp"
  "../src/assgram.tab.hpp"
  "../src/assflex.cpp"
  "CMakeFiles/checker.dir/src/check.cpp.o"
  "CMakeFiles/checker.dir/src/predgram.tab.cpp.o"
  "CMakeFiles/checker.dir/src/predflex.cpp.o"
  "CMakeFiles/checker.dir/src/rulesgram.tab.cpp.o"
  "CMakeFiles/checker.dir/src/rulesflex.cpp.o"
  "CMakeFiles/checker.dir/src/shapegram.tab.cpp.o"
  "CMakeFiles/checker.dir/src/shapeflex.cpp.o"
  "CMakeFiles/checker.dir/src/assgram.tab.cpp.o"
  "CMakeFiles/checker.dir/src/assflex.cpp.o"
  "../bin/checker.pdb"
  "../bin/checker"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang CXX)
  INCLUDE(CMakeFiles/checker.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
