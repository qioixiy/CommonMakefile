# static-library.mk

## complier gen obj common rule
include $(TARGETS_PATH)/object.mk

all: $(TARGET)
clean: $(TARGET).clean
distclean: $(TARGET).distclean

## define static obj rule
$(TARGET): $(OBJS) $(ARLIBS)
	$(quiet)echo AR "$@"
	$(Q)$(MAKEDIR) $(dir $@)
	$(Q)$(AR) $(ARFLAGS) $@ $^

## clean target
.PHONY: $(TARGET).clean
$(TARGET).clean:
	$(quiet)echo clean "$@"
	$(Q)$(RM) $(TARGET) $(OBJS) $(DEPS)

.PHONY: $(TARGET).distclean
$(TARGET).distclean:
	$(Q)$(RMDIR) $(TARGET) $(INTERMEDIATE_LIB_PATH) $(INTERMEDIATE_OBJ_PATH)

ALL_TARGETS:=$(OBJS) $(TARGET) $(TARGET).clean $(TARGET).distclean
include $(TARGETS_PATH)/vars-stash.mk
