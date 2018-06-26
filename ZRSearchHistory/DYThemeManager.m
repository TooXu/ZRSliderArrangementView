//
//  DYThemeManager.m
//  fishing
//
//  Created by Will on 15/6/18.
//  Copyright (c) 2015年 mahua. All rights reserved.
//

#import "DYThemeManager.h"
#import "Const.h"
#import "UIConst.h"

@interface DYThemeManager ()
@property (nonatomic, assign) BOOL isSecondLoad;
@end

@implementation DYThemeManager
+ (instancetype)defaultManager
{
    static DYThemeManager *_defaultManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _defaultManager = [[DYThemeManager alloc] init];
        _defaultManager.isSecondLoad = [kUserDefaults boolForKey:kSecondLoad];
        _defaultManager.isNightMode = [kUserDefaults boolForKey:kNightMode];
        if (_defaultManager.isSecondLoad) {
            _defaultManager.fontMode = [kUserDefaults integerForKey:kFontSizeMode];
        } else {
            _defaultManager.fontMode = DYThemeFontSizeModeNormal;
            _defaultManager.isSecondLoad = YES;
            [kUserDefaults setBool:YES  forKey:kSecondLoad];
            [kUserDefaults synchronize];
        }
        
    });
    return _defaultManager;
}

+ (UIFont *)getUsualFont:(CGFloat)fontSize {
    [DYThemeManager defaultManager];
    UIFont *font;
    if (IS_IOS_9) {
        font = [UIFont fontWithName:@"PingFang SC" size:fontSize];
    }else {
        font = [UIFont systemFontOfSize:fontSize];
    }
    return font;
}

+ (UIFont *)getPriceFont:(CGFloat)fontSize {
    [DYThemeManager defaultManager];
    UIFont *font;
    if (IS_IOS_9) {
        font = [UIFont fontWithName:@"PingFang SC" size:fontSize];
    }else {
        font = [UIFont systemFontOfSize:fontSize];
    }
    return font;
}

+ (UIFont *)getBoldFont:(CGFloat)fontSize {
    [DYThemeManager defaultManager];
    UIFont *font;
    if (IS_IOS_9) {
        font = [UIFont fontWithName:@"PingFangSC-Semibold" size:fontSize];
    }else {
        font = [UIFont boldSystemFontOfSize:fontSize];
    }
    return font;
}

+ (UIFont *)getThinFont:(CGFloat)fontSize {
    [DYThemeManager defaultManager];
    UIFont *font;
    if (IS_IOS_9) {
        font = [UIFont fontWithName:@"PingFangSC-Light" size:fontSize];
    }else {
        font = [UIFont systemFontOfSize:fontSize];
    }
    return font;
}

- (void)setFontMode:(DYThemeFontSizeMode)fontMode {
    _fontMode = fontMode;
    [kUserDefaults setInteger:fontMode forKey:kFontSizeMode];
    [kUserDefaults synchronize];
}

//夜间模式
- (void)setIsNightMode:(BOOL)isNightMode
{
    
    _isNightMode = isNightMode;
    if (!isNightMode) {//白天
        _farmLeftNavTitleColor = kColor06a3F9;
        _farmSegmentNormarlTitleColor = kColorFF;
        _farmSegmentHighlTitleColor = kColor06a3F9;
        _farmChooseViewNorTitleColor = kColor666666;
        _farmChooseViewHighTitleColor = kColor06a3F9;
        _dividingLineColor = kColorD7D7D7;
        _textColor = kCOLORWithHex(0x333333);
        _barColor = [UIColor whiteColor];
        _HomeContentBgColor = kRGB(234, 234, 234);
    }else{//夜间模式
        
    }
    [kUserDefaults setBool:isNightMode forKey:kNightMode];
    [kUserDefaults synchronize];
    
    
}

@end
