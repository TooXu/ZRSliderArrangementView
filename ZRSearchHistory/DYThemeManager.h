//
//  DYThemeManager.h
//  fishing
//
//  Created by Will on 15/6/18.
//  Copyright (c) 2015年 mahua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DYThemeFontSizeMode) {
    DYThemeFontSizeModeSmall        = 0,
    DYThemeFontSizeModeNormal       = 1,
    DYThemeFontSizeModeBig          = 2
};
@interface DYThemeManager : NSObject

+ (instancetype)defaultManager;

/** 用于锁住点击事件 */
@property (nonatomic, assign) BOOL canClick;
/** 用于标记转屏是否可用 */
@property (nonatomic, assign) BOOL canRotate;
/** 价格字体 */
+ (UIFont *)getPriceFont:(CGFloat)fontSize;

/** 粗体字体 */
+ (UIFont *)getBoldFont:(CGFloat)fontSize;

/** 细体字体 */
+ (UIFont *)getThinFont:(CGFloat)fontSize;

/** 通用字体 */
+ (UIFont *)getUsualFont:(CGFloat)fontSize;
/** 字体大小(大中小) */
@property (nonatomic, assign) DYThemeFontSizeMode fontMode;

//是否是夜间模式
@property (nonatomic, assign) BOOL isNightMode;
/*
 钓场控件颜色
 */
@property (nonatomic, strong) UIColor *farmLeftNavTitleColor;
@property (nonatomic, strong) UIColor *farmSegmentNormarlTitleColor;
@property (nonatomic, strong) UIColor *farmSegmentHighlTitleColor;
@property (nonatomic, strong) UIColor *farmChooseViewNorTitleColor;
@property (nonatomic, strong) UIColor *farmChooseViewHighTitleColor;
/*
 公用颜色
 */
@property (nonatomic, strong) UIColor *dividingLineColor;

@property (nonatomic, readonly, strong)UIColor *textColor;
@property (nonatomic, readonly, strong)UIColor *barColor;
@property (nonatomic, readonly, strong)UIColor *HomeContentBgColor;



@end
