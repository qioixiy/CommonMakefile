# config.mk

include $(BUILD_SYSTEM_PATH)/utility/helper.mk

## default config
DEFAULT_PRODUCT:=Sample
DEFAULT_PLATFORM:=x86-linux
DEFAULT_BUILD_TYPE:=Debug
TARGET_PRODUCT:=$(if $(TARGET_PRODUCT),$(TARGET_PRODUCT),$(DEFAULT_PRODUCT))
TARGET_PLATFORM:=$(if $(TARGET_PLATFORM),$(TARGET_PLATFORM),$(DEFAULT_PLATFORM))
TARGET_BUILD_TYPE:=$(if $(TARGET_BUILD_TYPE),$(TARGET_BUILD_TYPE),$(DEFAULT_BUILD_TYPE))

## import system product platform config
$(call import_system)
$(call import_product)
$(call import_platform)

## merge CPPFLAGS
CPPFLAGS+=$(OPTIONS)

## for debug version
ifeq "$(TARGET_BUILD_TYPE)" "Debug"
CPPFLAGS+=-D__DEBUG__
endif

# ENABLE_PLATFORM_SUFFIX
include $(PATH_SPECS)
