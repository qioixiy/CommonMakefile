# helper.mk

## define how to import system info
define import_system
  $(eval include $(SYSTEMS_PATH)/system.mk)
endef

## define how to import product
define import_product
$(eval include $(PRODUCTS_PATH)/$(TARGET_PRODUCT)/vendor.mk \
  $(PRODUCTS_PATH)/$(TARGET_PRODUCT)/features.mk \
  $(PRODUCTS_PATH)/$(TARGET_PRODUCT)/product-specs.mk)
endef

## define how to import platform
define import_platform
$(eval include $(PLATFORMS_PATH)/$(TARGET_PLATFORM).mk \
  $(PLATFORMS_PATH)/platform-specs.mk)
endef

##build target <target class> <target>
define build_target
  $(call assert_not_null, $(INTERMEDIATE_OBJ_PATH), INTERMEDIATE_OBJ_PATH is not set) \
  $(call assert_not_null, $(INTERMEDIATE_LIB_PATH), INTERMEDIATE_LIB_PATH is not set) \
  $(call assert_not_null, $(INTERMEDIATE_BIN_PATH), INTERMEDIATE_BIN_PATH is not set) \
  $(call expect_not_null, $(SRC_FILES), no source file is included) \
  $(if $(strip $2), \
    $(eval TARGET :=$(strip $2)), \
    $(if $(call equals, $1, $(BUILD_EXECUTABLE)), $(eval TARGET:=$(INTERMEDIATE_BIN_PATH)/$(MODULE_NAME))) \
    $(if $(call equals, $1, $(BUILD_STATIC_LIBRARY)), $(eval TARGET:=$(INTERMEDIATE_LIB_PATH)/$(MODULE_NAME).a)) \
    $(if $(call equals, $1, $(BUILD_SHARED_LIBRARY)), $(eval TARGET:=$(INTERMEDIATE_LIB_PATH)/lib$(MODULE_NAME).so)) \
) \
$(eval include $1 \
  $(TARGETS_PATH)/target-specs.mk)
endef
