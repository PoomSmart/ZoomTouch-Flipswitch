#import "FSSwitchDataSource.h"
#import "FSSwitchPanel.h"

@interface ZoomTouchSwitch : NSObject <FSSwitchDataSource>
@end

extern "C" Boolean _AXSZoomTouchEnabled();
extern "C" void _AXSZoomTouchSetEnabled(BOOL enabled);

@implementation ZoomTouchSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	return _AXSZoomTouchEnabled() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	if (newState == FSSwitchStateIndeterminate)
		return;
	_AXSZoomTouchSetEnabled(newState == FSSwitchStateOn);
}

- (void)applyAlternateActionForSwitchIdentifier:(NSString *)switchIdentifier
{
	NSURL *url = [NSURL URLWithString:(kCFCoreFoundationVersionNumber > 1665.0f ? @"prefs:root=ACCESSIBILITY&path=ZOOM_TITLE#ZoomTouchEnabled" : @"prefs:root=General&path=ACCESSIBILITY/ZOOM_TITLE#ZoomTouchEnabled")];
	[[FSSwitchPanel sharedPanel] openURLAsAlternateAction:url];
}

@end