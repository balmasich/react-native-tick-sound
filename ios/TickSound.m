#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(TickSound, NSObject)

RCT_EXTERN_METHOD(stopSound)
RCT_EXTERN_METHOD(playSound: (nonnull NSInteger *) rate)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
