#import <Foundation/Foundation.h>
#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>
#import <version.h>

@interface ZoomTouchSwitch : NSObject <FSSwitchDataSource>
@end

extern "C" Boolean _AXSZoomTouchEnabled();
extern "C" void _AXSZoomTouchSetEnabled(BOOL enabled);

@implementation ZoomTouchSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier {
	return _AXSZoomTouchEnabled() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier {
	if (newState == FSSwitchStateIndeterminate)
		return;
	_AXSZoomTouchSetEnabled(newState == FSSwitchStateOn);
}

- (void)applyAlternateActionForSwitchIdentifier:(NSString *)switchIdentifier {
	NSURL *url = [NSURL URLWithString:(IS_IOS_OR_NEWER(iOS_13_0) ? @"prefs:root=ACCESSIBILITY&path=ZOOM_TITLE#ZoomTouchEnabled" : @"prefs:root=General&path=ACCESSIBILITY/ZOOM_TITLE#ZoomTouchEnabled")];
	[[FSSwitchPanel sharedPanel] openURLAsAlternateAction:url];
}

@end