ARCHS = armv7 armv7s arm64
SDKVERSION = 7.0

include theos/makefiles/common.mk

BUNDLE_NAME = ZoomTouch
ZoomTouch_FILES = Switch.xm
ZoomTouch_LIBRARIES = flipswitch
ZoomTouch_INSTALL_PATH = /Library/Switches
ZoomTouch_LDFLAGS = -lAccessibility

include $(THEOS_MAKE_PATH)/bundle.mk