# module.mk

MODULE_PATH:=$(call current_path)
MODULE_NAME:=main

## product spec cfg
PRODUCT_SPECS:=
## platform spec cfg
PLATFORM_SPECS:=
## target spec cfg
TARGET_SPECS:=

include $(BUILD_CONFIGURE)

## select source code
SRC_FILES:=$(MODULE_PATH)/main.cpp
LDLIBS += src/dump/dump.a \
	src/module1/module1.a \
	src/module2/module2.so \

## call build exe target
$(call build_target,$(BUILD_EXECUTABLE))
