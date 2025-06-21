#!/bin/bash

# 创建test目录和文件
mkdir -p test
cd test

# 创建main.cc文件
cat > main.cc << 'EOF'
#include <iostream>
#include <strings.h>
#include <regex>

using namespace std::string_literals;

int main(int argc, char **argv) {
    auto email = "xxx@gmail.com"s;
    auto pattern = std::regex("");
    std::cout << "C++20 项目已配置成功！\n";
    return 0;
}
EOF

# 创建CMakeLists.txt文件
cat > CMakeLists.txt << 'EOF'
cmake_minimum_required(VERSION 3.21)
project(Demo)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_executable(main main.cc)
EOF

# 创建Makefile实现一键操作
cat > Makefile << 'EOF'
all: 
	 @cmake -Bbuild
	 @cmake --build build
	 @./build/main
EOF

echo "项目已创建在 test/ 目录"
echo "目录结构："
tree --noreport .
