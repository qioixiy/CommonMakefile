# platform-specs.mk

## load all the $(PLATFORM_SPECS).mk file, it provide make a spec platform method
$(foreach specfile,$(PLATFORM_SPECS),$(eval -include $(specfile)))
