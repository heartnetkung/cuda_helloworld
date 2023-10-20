cmake_minimum_required(VERSION 3.23.1 FATAL_ERROR)

project(MyProject VERSION 0.0.1 LANGUAGES CXX CUDA)

add_executable(tests test/simple_test.cpp)

include(cmake/CPM.cmake)
CPMAddPackage("gh:catchorg/Catch2@3.4.0")

# These tests can use the Catch2-provided main
target_link_libraries(tests Catch2::Catch2WithMain)
