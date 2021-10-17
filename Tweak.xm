#import <PeterDev/libpddokdo.h>

@interface SBFLockScreenDateViewController : UIViewController
@end

@interface SBFLockScreenDateView : UIView
@property (assign,nonatomic) double alignmentPercent;
@property (nonatomic, strong) UIImageView *conditionImageView;
@property (nonatomic, strong) UILabel *tempLabel;

- (void)updateWeather;
@end

%hook SBFLockScreenDateView
%property (nonatomic, strong) UIImageView *conditionImageView;
%property (nonatomic, strong) UILabel *tempLabel;

- (instancetype)initWithFrame:(CGRect)frame {
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateWeather) name:@"WeatherLS_updateWeather" object:nil];
	return %orig;
}

- (void)layoutSubviews {
	%orig;
	self.alignmentPercent = 1;

	float imgSize = 70;

	if ([self viewWithTag:6] == nil) {
		self.conditionImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
		self.conditionImageView.tag = 6;
		self.conditionImageView.translatesAutoresizingMaskIntoConstraints = NO;
		[self addSubview:self.conditionImageView];

		self.tempLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		self.tempLabel.tag = 6;
		self.tempLabel.textColor = [UIColor whiteColor];
		self.tempLabel.font = [UIFont systemFontOfSize:28];
		self.tempLabel.textAlignment = NSTextAlignmentCenter;
		self.tempLabel.translatesAutoresizingMaskIntoConstraints = NO;
		[self addSubview:self.tempLabel];
	}

	[self.conditionImageView.widthAnchor constraintEqualToConstant:imgSize].active = YES;
	[self.conditionImageView.heightAnchor constraintEqualToConstant:imgSize].active = YES;
	[self.conditionImageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:15].active = YES;
	[self.conditionImageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor constant:-15].active = YES;

	//[self.tempLabel.widthAnchor constraintEqualToConstant:imgSize].active = YES;
	//[self.tempLabel.heightAnchor constraintEqualToConstant:imgSize].active = YES;
	[self.tempLabel.centerXAnchor constraintEqualToAnchor:self.conditionImageView.centerXAnchor].active = YES;
	[self.tempLabel.topAnchor constraintEqualToAnchor:self.conditionImageView.bottomAnchor constant:0].active = YES;
}

%new - (void)updateWeather {
	[[PDDokdo sharedInstance] refreshWeatherData];
	self.conditionImageView.image = [[PDDokdo sharedInstance] currentConditionsImage];
	self.tempLabel.text = [[PDDokdo sharedInstance] currentTemperature];
}

%end

%hook SBFLockScreenDateViewController
- (void)_startUpdateTimer {
	%orig;
	[[NSNotificationCenter defaultCenter] postNotificationName:@"WeatherLS_updateWeather" object:nil];
}
%end