#import <UIKit/UIKit.h>
#import <PeterDev/libpddokdo.h>

@interface SBFLockScreenDateView : UIView
@property (assign,nonatomic) double alignmentPercent;
@end

@interface SBFLockScreenDateViewController : UIViewController
@end

@interface UIDevice (Private)
+ (BOOL)currentIsIPad;
@end
