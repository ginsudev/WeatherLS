#import <UIKit/UIKit.h>
#import <PeterDev/libpddokdo.h>

@interface _UILegibilitySettings : NSObject
@property (nonatomic, strong, readwrite) UIColor *primaryColor;
@end

@interface SBUILegibilityLabel : UIView
@property (nonatomic, copy, readwrite) UIColor *textColor;
@end

@interface SBFLockScreenDateView : UIView
@property (assign,nonatomic) double alignmentPercent;
@end

@interface SBFLockScreenDateViewController : UIViewController
@end

@interface UIDevice (Private)
+ (BOOL)currentIsIPad;
@end
