ARCHS = arm64 arm64e
THEOS_DEVICE_IP = localhost -p 2222
INSTALL_TARGET_PROCESSES = SpringBoard
TARGET = iphone:clang:13.5:13
PREFIX = $(THEOS)/toolchain/Xcode11.xctoolchain/usr/bin/
PACKAGE_VERSION = 1.0.0


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WeatherLS

WeatherLS_FILES = Tweak.xm
WeatherLS_LIBRARIES += pddokdo
WeatherLS_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
