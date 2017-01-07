# shared-library.mk

## complier gen obj common rule
include $(TARGETS_PATH)/object.mk

all: $(TARGET)
clean: $(TARGET).clean
distclean: $(TARGET).distclean

## define shared obj rule
$(TARGET): $(OBJS) $(ARLIBS)
	$(quiet)$(MAKEDIR) $(dir $@)
	$(LD) $(LDFLAGS) -shared -o $@ $^

## clean target
.PHONY: $(TARGET).clean
$(TARGET).clean:
	$(RM) $(TARGET) $(OBJS) $(DEPS)

.PHONY: $(TARGET).distclean
$(TARGET).distclean:
	$(RMDIR) $(TARGET) $(INTERMEDIATE_LIB_PATH) $(INTERMEDIATE_OBJ_PATH)

ALL_TARGETS:=$(OBJS) $(TARGET) $(TARGET).clean $(TARGET).distclean
include $(TARGETS_PATH)/vars-stash.mk
