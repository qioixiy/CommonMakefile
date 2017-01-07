# utility.mk

include $(BUILD_SYSTEM_PATH)/utility/assert.mk

# get the path of current module
##  @return current module path
define current_path
$(patsubst %/,%, \
  $(dir $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))))
endef

## quiet command
#  wrap @
define quiet
@
endef
