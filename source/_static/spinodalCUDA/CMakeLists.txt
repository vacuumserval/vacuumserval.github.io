cmake_minimum_required(VERSION 3.20 FATAL_ERROR)
project(example_project LANGUAGES CXX CUDA)

# 设置 C++ 标准
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# 寻找 CUDA 库
find_package(CUDA REQUIRED)

# 包含 CUDA 头文件目录
include_directories(${CUDA_INCLUDE_DIRS})

# 指定 CUDA 源文件
set(CUDA_SOURCES main.cu)

# 创建可执行文件
cuda_add_executable(spinodal ${CUDA_SOURCES})

# 链接 CUDA 库
target_link_libraries(spinodal ${CUDA_LIBRARIES} curand cufft)
