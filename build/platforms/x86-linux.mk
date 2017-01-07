# x86-linux.mk

PLATFORM_NAME:=x86-linux

## ar pkg
AR:=ar
ARFLAGS:=-rv

## complier obj
CC:=gcc
CPP:=gcc -E
CXX:=g++
CPPFLAGS:=
CFLAGS:=-Wall
CXXFLAGS:=-Wall

## link command
LD:=$(CXX)
LDLIBS:=
LDFLAGS:=
