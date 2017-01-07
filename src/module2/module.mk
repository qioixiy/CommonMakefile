# module.mk

MODULE_PATH:=$(call current_path)
MODULE_NAME:=module2

## product spec parts
PRODUCT_SPECS:=$(MODULE_PATH)/spec.mk
## platform spec parts
PLATFORM_SPECS:=
## target spec parts
TARGET_SPECS:=

include $(BUILD_CONFIGURE)

SRC_FILES:=$(MODULE_PATH)/module2.cpp

## build shared library
$(call build_target,$(BUILD_SHARED_LIBRARY),$(MODULE_PATH)/module2.so)
