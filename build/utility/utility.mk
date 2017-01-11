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

ifeq ("$(origin V)", "command line")
  Q =
else
  Q = @
endif

# $1 iterator path
define walk
  $(wildcard $(1)) $(foreach e, $(wildcard $(1)/*), $(call walk, $(e)))
endef

define all-makefiles-under
  $(wildcard $(1)/*/module.mk)
endef
