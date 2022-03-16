cmake_minimum_required(VERSION 3.7 FATAL_ERROR)
project(ncurses_dart VERSION 1.0.0 LANGUAGES C)

link_libraries(ncurses form)

add_library(ncurses_dart SHARED ncurses_dart.c ncurses_dart.def)