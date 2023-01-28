CXX = clang++
AR = ar

#
# Targets
#
TARGET = libffx_fsr2_api_x64.a
VK_TARGET = libffx_fsr2_api_vk_x64.a

FSR2 = FidelityFX-FSR2
FSR2_SRC = $(FSR2)/src/ffx-fsr2-api
FSR2_BUILD = $(FSR2)/build/VK/src/ffx-fsr2-api

OBJS = $(FSR2_SRC)/ffx_assert.o $(FSR2_SRC)/ffx_fsr2.o
VK_OBJS = $(FSR2_SRC)/vk/ffx_fsr2_vk.o $(FSR2_SRC)/vk/shaders/ffx_fsr2_shaders_vk.o

CFLAGS =  -std=c++11 -Os -fPIC -Wall -Wno-unused-function
CFLAGS += -DFFX_GCC=1 -Dwcscpy_s=wcscpy
CFLAGS += -I$(FSR2_BUILD)/shaders/vk
ARFLAGS = -rcs

#
# Build targets
#
all: $(TARGET) $(VK_TARGET)

.cpp.o:
	$(CC) $(CFLAGS) -c -o $@ $<

$(TARGET): $(OBJS)
	$(AR) $(ARFLAGS) $@ $^

$(VK_TARGET): $(VK_OBJS)
	$(AR) $(ARFLAGS) $@ $^

#
# Clean targets
#
clean:
	rm -f $(OBJS) $(VK_OBJS) *.a

#
# Install targets
#
install:
	mkdir -p ./lib/linux/x64/
	cp -f $(TARGET) $(VK_TARGET) ./lib/linux/x64/
