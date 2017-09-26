# product-specs.mk

## load PRODUCT_SPECS.mk, custom product infomation
$(foreach specfile,$(PRODUCT_SPECS),$(eval -include $(specfile)))
