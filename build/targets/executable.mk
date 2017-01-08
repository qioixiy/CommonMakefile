# executable.mk

## complier gen obj common rule
include $(TARGETS_PATH)/object.mk

all: $(TARGET)
clean: $(TARGET).clean
distclean: $(TARGET).distclean

## define build execute obj rule
$(TARGET): $(OBJS) $(LDLIBS)
	$(quiet)echo EXE "$@"
	$(Q)$(MAKEDIR) $(dir $@)
	$(Q)$(LD) $(LDFLAGS) -o $@ $^

## clean target
.PHONY: $(TARGET).clean
$(TARGET).clean:
	$(Q)$(RM) $(TARGET) $(TARGET).exe $(OBJS) $(DEPS)

.PHONY: $(TARGET).distclean
$(TARGET).distclean:
	$(Q)$(RMDIR) $(TARGET) $(TARGET).exe $(INTERMEDIATE_BIN_PATH) $(INTERMEDIATE_OBJ_PATH)

ALL_TARGETS:=$(OBJS) $(TARGET) $(TARGET).clean $(TARGET).distclean
include $(TARGETS_PATH)/vars-stash.mk
