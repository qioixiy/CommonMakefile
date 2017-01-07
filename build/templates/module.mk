# module.mk

MODULE_PATH:=$(call current_path)
#TODO
MODULE_NAME:=

#TODO
PRODUCT_SPECS:=
PLATFORM_SPECS:=
TARGET_SPECS:=

# don't use CXX CPPFLAGS... value, because will be covered by $(BUILD_CONFIGURE)
include $(BUILD_CONFIGURE)

SRC_FILES:=$(MODULE_PATH)/main.cpp

$(call build_target,$(BUILD_EXECUTABLE))
