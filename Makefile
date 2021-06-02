PACKAGE_VERSION = 1.0.0
ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:11.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = ZoomTouch
ZoomTouch_FILES = Switch.xm
ZoomTouch_LIBRARIES = flipswitch
ZoomTouch_INSTALL_PATH = /Library/Switches
ZoomTouch_LDFLAGS = -lAccessibility

include $(THEOS_MAKE_PATH)/bundle.mk
