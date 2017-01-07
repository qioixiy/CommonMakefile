# module.mk

MODULE_PATH:=$(call current_path)
MODULE_NAME:=hello

PRODUCT_SPECS:=$(MODULE_PATH)/spec.mk
PLATFORM_SPECS:=
TARGET_SPECS:=

include $(BUILD_CONFIGURE)
SRC_FILES:= $(MODULE_PATH)/hello.c

$(call build_target,$(BUILD_STATIC_LIBRARY), $(MODULE_PATH)/hello.a)
