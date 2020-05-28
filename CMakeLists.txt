cmake_minimum_required(VERSION 3.13)
project(resourcegen C CXX)
set(CMAKE_CXX_STANDARD 11)
set(src_dir ${CMAKE_CURRENT_LIST_DIR})

# ----------------------------------------------------

add_custom_command(
  OUTPUT SyncPlayer.h
  COMMAND xxd -i ${src_dir}/sync-player.png > SyncPlayer.h
  COMMENT "Generating Image Resource"
  )

list(APPEND mylib_sources SyncPlayer.h)

# ----------------------------------------------------

include_directories(${src_dir})
list(APPEND mylib_sources ${src_dir}/lib.cpp)
add_library(mylib STATIC ${mylib_sources})
list(APPEND deps mylib)
  
# ----------------------------------------------------

add_executable(test test.cpp)
target_link_libraries(test mylib)
add_dependencies(test ${deps})
