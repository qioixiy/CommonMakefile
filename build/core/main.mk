# main.mk

.PHONY: all clean distclean
all:

## define the global const value
### path
PRODUCTS_PATH:=$(BUILD_SYSTEM_PATH)/products
PLATFORMS_PATH:=$(BUILD_SYSTEM_PATH)/platforms
SYSTEMS_PATH:=$(BUILD_SYSTEM_PATH)/systems
TARGETS_PATH:=$(BUILD_SYSTEM_PATH)/targets
PATH_SPECS:=$(BUILD_SYSTEM_PATH)/path.mk
### config.mk
BUILD_CONFIGURE:=$(BUILD_SYSTEM_PATH)/config.mk
### target
BUILD_EXECUTABLE:=$(TARGETS_PATH)/executable.mk
BUILD_STATIC_LIBRARY:=$(TARGETS_PATH)/static-library.mk
BUILD_SHARED_LIBRARY:=$(TARGETS_PATH)/shared-library.mk

## import common function
include $(BUILD_SYSTEM_PATH)/utility/utility.mk

## if $(SPEC_MODULES) non-empty, Compile a specific module
## Multiple modules can be specified
ifneq "$(SPEC_MODULES)" ""
include $(SPEC_MODULES)
else
MODULES := $(strip $(call all-makefiles-under,.))
MODULES += $(strip $(call all-makefiles-under,src))
include $(MODULES)
endif
