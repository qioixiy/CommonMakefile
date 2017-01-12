# module.mk

MODULE_PATH := $(call current_path)
MODULE_NAME := dump

PRODUCT_SPECS := $(MODULE_PATH)/spec.mk
PLATFORM_SPECS :=
TARGET_SPECS :=

include $(BUILD_CONFIGURE)
SRC_FILES := $(MODULE_PATH)/dump.c

$(call build_target,$(BUILD_STATIC_LIBRARY), $(MODULE_PATH)/dump.a)
