PACKAGE_VERSION = 1.0.0
ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:11.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = ZoomTouchFS
ZoomTouchFS_FILES = Switch.xm
ZoomTouchFS_LIBRARIES = flipswitch
ZoomTouchFS_INSTALL_PATH = /Library/Switches
ZoomTouchFS_LDFLAGS = -lAccessibility

include $(THEOS_MAKE_PATH)/bundle.mk
