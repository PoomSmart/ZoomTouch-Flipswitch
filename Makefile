PACKAGE_VERSION = 1.0.0
TARGET = iphone:clang:latest:11.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = ZoomTouchFS
ZoomTouchFS_FILES = Switch.xm
ZoomTouchFS_LIBRARIES = Accessibility flipswitch
ZoomTouchFS_INSTALL_PATH = /Library/Switches

include $(THEOS_MAKE_PATH)/bundle.mk
