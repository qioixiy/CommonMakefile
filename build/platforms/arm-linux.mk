# arm-linux.mk

PLATFORM_NAME := arm-linux

CROSS_COMPLIE ?= arm-linux-gnueabihf-
SYSROOT ?= ${HOME}/arm-linux-rootfs

## ar pkg
AR := ${CROSS_COMPLIE}ar
ARFLAGS := -rv

## complier obj
CC := ${CROSS_COMPLIE}gcc
CPP := ${CROSS_COMPLIE}gcc -E
CXX := ${CROSS_COMPLIE}g++
CPPFLAGS := -DARM_LINUX
CFLAGS := -Wall -pipe -I${SYSROOT}/usr/include -rdynamic -DARM_LINUX
CXXFLAGS := -std=c++11 -Wall -pipe -I${SYSROOT}/usr/include -rdynamic -Wl,-rpath,${SYSROOT}/usr/lib
CXXFLAGS += -DARM_LINUX
## link command
LD := $(CXX)
LDLIBS :=
LDFLAGS := -L${SYSROOT}/usr/lib -Wl,-rpath=$(SYSROOT)/usr/lib
