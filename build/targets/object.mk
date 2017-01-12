# object.mk

## pick up C/C++ source code from list
C_OBJS:=$(patsubst %.c,$(INTERMEDIATE_OBJ_PATH)/%.c.o,$(filter %.c,$(SRC_FILES)))
CPP_OBJS:=$(patsubst %.cpp,$(INTERMEDIATE_OBJ_PATH)/%.cpp.o, \
	$(filter %.cpp,$(SRC_FILES)))
OBJS:=$(C_OBJS) $(CPP_OBJS)
DEPS:=$(OBJS:.o=.d)

## -MMD auto gen source code dependencies
$(INTERMEDIATE_OBJ_PATH)/%.cpp.o: %.cpp
	$(quiet)echo CXX "$@"
	$(Q)$(MAKEDIR) $(dir $@)
	$(Q)$(CXX) $(CPPFLAGS) $(CXXFLAGS) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -MT"$(@:%.o=%.d)" -c "$<" -o "$@"
$(INTERMEDIATE_OBJ_PATH)/%.c.o: %.c
	$(quiet)echo CC "$@"
	$(Q)$(MAKEDIR) $(dir $@)
	$(Q)$(CC) $(CPPFLAGS) $(CFLAGS) -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -MT"$(@:%.o=%.d)" -c "$<" -o "$@"

ifeq ($(filter $(MAKECMDGOALS), clean distclean),)
-include $(DEPS)
endif
