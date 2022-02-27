ARCHS = arm64 arm64e
THEOS_DEVICE_IP = 192.168.1.106#localhost -p 2222
INSTALL_TARGET_PROCESSES = SpringBoard
TARGET = iphone:clang:14.4:13
PACKAGE_VERSION = 2.0.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WeatherLS

WeatherLS_LIBRARIES += pddokdo
WeatherLS_PRIVATE_FRAMEWORKS = SpringBoardFoundation
WeatherLS_FILES = $(shell find Sources/WeatherLS -name '*.swift') $(shell find Sources/WeatherLSC -name '*.m' -o -name '*.c' -o -name '*.mm' -o -name '*.cpp')
WeatherLS_SWIFTFLAGS = -ISources/WeatherLSC/include
WeatherLS_CFLAGS = -fobjc-arc -ISources/WeatherLSC/include

include $(THEOS_MAKE_PATH)/tweak.mk
