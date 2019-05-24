#!/bin/bash --posix

PERFIX=$(pwd)
pro_dir=$(dirname $0)
echo -en "工作目录:${PERFIX}\n"
echo -en "项目目录:${PERFIX}${pro_dir#.}\n"
echo -en "切换工作目录到项目根目录\n"
cd $(dirname $0)
echo -en "检查build目录存在性\n"
if [ -d build ]; then
	echo -en "构建目录build已存在\n正在清楚构建残余...\n"
	rm -r build/*
	echo -en "[ \e[31mOK\e[0m ] rm -r build/ \n"
else
	echo -en "构建目录build不存在\n正在创建目录..."\n
	mkdir build
	echo -en "[ \e[31mOK\e[0m ] mkdir build \n"
fi
if [ -d Release ]; then
	echo -en "正在ｃｌｅａｎ.\n"
	rm -r Release
	echo -en "[ \e[31mOK\e[0m ] rm -r Release\n"
fi
if [ -d Debug ]; then
	echo -en "正在ｃｌｅａｎ.\n"
	rm -r Debug
	echo -en "[ \e[31mOK\e[0m ] rm -r Debug \n"
fi
echo -en "\t*****-----> 开始生成Makefile <-----*****\n"
cd build
cmake ../ -DCMAKE_BUILD_TYPE="Release"
echo -en "[ \e[31mOK\e[0m ] cd build; cmake ../ -DCMAKE_BUILD_TYPE=\"Release\" \n"
echo -en "如果需要编译Debug版本，请修改CMAKE_BUILD_TYPE为<-DCMAKE_BUILD_TYPE=\"Debug\">.\n"

echo -en "\t*****-----> 开始编译 <-----*****\n"
make -j9
echo -en "[ \e[31mOK\e[0m ] make -j9 \n"
