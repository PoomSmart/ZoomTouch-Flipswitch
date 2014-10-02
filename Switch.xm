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

@end