# module.mk

MODULE_PATH:=$(call current_path)
MODULE_NAME:=module1

## product spec parts
PRODUCT_SPECS:=$(MODULE_PATH)/spec.mk
## platform spec parts
PLATFORM_SPECS:=
## target spec parts
TARGET_SPECS:=

include $(BUILD_CONFIGURE)

SRC_FILES:=$(MODULE_PATH)/module1.cpp

## build static library
$(call build_target,$(BUILD_STATIC_LIBRARY),$(MODULE_PATH)/module1.a)
