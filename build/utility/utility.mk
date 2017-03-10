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

quiet-command = $(if $(V), $1,$(if $(2), echo $2 &&$1, @$1))

define all-makefiles-under
  $(wildcard $(1)/*/module.mk)
endef
