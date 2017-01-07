# target-specs.mk

$(foreach specfile, $(TARGET_SPECS), $(eval -include $(specfile)))
