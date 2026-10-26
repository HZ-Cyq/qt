cmake_minimum_required(VERSION 3.16)
project(test_md VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt6 REQUIRED COMPONENTS Widgets)

# 主项目：Dialog 对话框
add_executable(test_md
    main.cpp
    dialog.cpp
    dialog.h
    dialog.ui
)
target_link_libraries(test_md PRIVATE Qt6::Widgets)

# 教学示例：最简单的 Qt 程序
add_executable(simple
    simple/main.cpp
)
target_link_libraries(simple PRIVATE Qt6::Widgets)