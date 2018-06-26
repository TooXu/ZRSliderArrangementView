//
//  UIConst.h
//  fishing
//
//  Created by dongjianbo on 15-6-2.
//  Copyright (c) 2015年 mahua. All rights reserved.
//

/********** iPhoneX相关 **********/
//  1==iPhone X
#define IS_IPhoneX (kScreenHeight == 812.0 ? 1 : 0)
//  系统控件高度
#define kStatusBarHeight        (CGRectGetHeight([UIApplication sharedApplication].statusBarFrame))
#define kNavigationBarHeight    (44 + kStatusBarHeight)
#define kTabBarHeight           49
#define kSafeAreaBottomHeight (IS_IPhoneX == 1 ? 34 : 0)

#define kMainPostBtnPlusHeight 0

#define kCommentCount 500
#define kLeTVLocalDevID @"kLeTVLocalDevID"

#define DYLaunchScreenImageKey @"DYLaunchScreenImageKey"
/** 记录热更新补丁包号 */
#define kHotFixVersion @"kHotFixVersion"

/** 记录热钓商城首页提示 */
#define kRediaoShopTip @"kRediaoShopTip"

/** 缓存上次成功下载的js文件 */
#define kDYUpdateFile @"kDYUpdateFile"

#define kTaoBaoPrefix            @"taobao://"
/** DeviceTokenStr */
#define kDeviceTokenStr @"kDeviceTokenStr"

/** 3G/4G下是否显示高清图片 */
#define kShouldHDPhoto @"kShouldHDPhoto"

/** 重新定位时间间隔 */
#define kResetLocationTime (30 * 60)

//  论坛ID
#define kYuhuoType @"11"
#define kLureType @"98"
#define kJiqiaoType @"2"
#define kYujuType @"55"
#define kChaGuan @"28"

/**
 *  自定义textView相关常量
 */
#define kTextViewMinH 40.7
#define kTopBomMargin 10

//常用宏
#define kWindow [UIApplication sharedApplication].keyWindow
#define kLastWindow [UIApplication sharedApplication].windows.lastObject
#define kNotificationCenter [NSNotificationCenter defaultCenter]
#define kUserDefaults                        [NSUserDefaults standardUserDefaults]
// 用在block中的weakSelf
#define kWS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define kWeakSelf  kWS(weakSelf)
#define NSLogFunc  NSLog(@"%s", __func__);
#define NSLogCallStack NSLog(@"%s-callStackSymbols=%@",__func__, [NSThread callStackSymbols]);

//  缓存筛选类型
#define kFishingType @"kFishingType"
#define kChangeType @"kChangeType"
#define kActivitiesType @"kActivitiesType"
#define kMapType @"kMapType"

//提醒评论记录时间
#define kRefuseCommentTime @"kRefuseCommentTime"
#define kRetainRefreshTime @"kRetainRefreshTime"

//提醒评论记录状态
#define isCancel @"isCancel"
#define isRefuseComment @"isRefuseComment"

//  保存夜间模式状态
#define kSecondLoad @"kSecondLoad"
#define kNightMode @"kNightMode"
#define kFontSizeMode @"kFontSizeMode"

//  缓存在本地的顶数据
#define kReplyDing @"kReplyDing"
#define kSkillDing @"kSkillDing"

//  保存搜索历史记录
#define kHistoryRecord @"kHistoryRecord"
//  清除搜索记录
#define kClearHistoryKey @"清除搜索记录"
//  城市DB版本
#define kCityDBVersionKey @"kCityDBVersionKey"
//  static包版本
#define kPackageVersionKey @"kPackageVersionKey"
//  搜索提示列表cell高度
#define kCellHeight 40

//  保存guide状态
#define kFishFarmVC @"kFishFarmVC"
#define kMainViewVC @"kMainViewVC"
#define kSkillVC    @"kSkillVC"


// 图片压缩比例
#define KCompressionQuality 0.99
// 图片最大宽度
#define kImageMaxWith 1280.f

//  大小尺寸
// 设备屏幕尺寸

#define IS_LESS40INCH_SCREEN (kScreenHeight <= 568)

#define kiPhone4          (kScreenHeight < 500)
#define kScreenWidth          ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight         ([UIScreen mainScreen].bounds.size.height)


#define kIsPlus             ([UIScreen mainScreen].scale >= 3.f)
#define kLineHeight             ([UIScreen mainScreen].scale >= 2.f ? 0.5 : 1)

//#define kNormalFont(fontSize)      [UIFont fontWithName:@"Helvetica" size:fontSize]
//#define kBoldFont(fontSize)        [UIFont fontWithName:@"Helvetica-Bold" size:fontSize]
//#define kItalicFont(fontSize)      [UIFont fontWithName:@"Helvetica-Oblique" size:fontSize]

#define kColorWhite     [UIColor whiteColor]
#define kColorBlack     [UIColor blackColor]
#define kColorDrakGray  [UIColor darkGrayColor]
#define kColorLightGray [UIColor darkGrayColor]
#define kColorGray      [UIColor grayColor]
#define kColorRed       [UIColor redColor]
#define kColorGreen     [UIColor greenColor]
#define kColorBlue      [UIColor blueColor]
#define kColorCyan      [UIColor cyanColor]
#define kColorYellow    [UIColor yellowColor]
#define kColorMagenta   [UIColor magentaColor]
#define kColorOrange    [UIColor orangeColor]
#define kColorPurple    [UIColor purpleColor]
#define kColorBrown     [UIColor brownColor]
#define kColorClear     [UIColor clearColor]
#define kColor33        [UIColor colorWithRed:0x33/255.0 green:0x33/255.0 blue:0x33/255.0 alpha:1.0]
#define kColor66        [UIColor colorWithRed:0x66/255.0 green:0x66/255.0 blue:0x66/255.0 alpha:1.0]
#define kColor99        [UIColor colorWithRed:0x99/255.0 green:0x99/255.0 blue:0x99/255.0 alpha:1.0]
#define kColorFA        [UIColor colorWithRed:0xFA/255.0 green:0xFA/255.0 blue:0xFA/255.0 alpha:1.0]
#define kColorFF        [UIColor colorWithRed:0xFF/255.0 green:0xFF/255.0 blue:0xFF/255.0 alpha:1.0]
#define kColorCC        [UIColor colorWithRed:0xCC/255.0 green:0xCC/255.0 blue:0xCC/255.0 alpha:1.0]
#define kRGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define kRGB(r, g, b)                        kRGBA(r, g, b, 1.0f)
#define kCOLORWithHex(c)                     [UIColor colorWithRed:((c>>16)&0xFF)/255.0f green:((c>>8)&0xFF)/255.0f blue:(c&0xFF)/255.0f alpha:1.0f]
#define kCOLORWithHexAndAlpha(c, a)          [UIColor colorWithRed:((c>>16)&0xFF)/255.0f green:((c>>8)&0xFF)/255.0f blue:(c&0xFF)/255.0f alpha:a]
#define kRandomColor kRGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#define NAVIGATORBAR_BAR_COLOR [HAColorUtil colorWithInt:0x7f555a66]
#define NAVIGATORBAR_TEXT_COLOR [HAColorUtil colorWithInt:0xaaaaaa]
#define NAVIGATORBAR_TEXT_HIGHLIGHT_COLOR [HAColorUtil colorWithInt:0xd1d1d1]


// 钓鱼app设计规范
// 配色
#define kColorC5C5C5    [UIColor colorWithRed:0xc5/255.0 green:0xc5/255.0 blue:0xc5/255.0 alpha:1.0]
#define kColor287CD9    [UIColor colorWithRed:0x28/255.0 green:0x7c/255.0 blue:0xd9/255.0 alpha:1.0]
#define kColor3997ff    [UIColor colorWithRed:0x39/255.0 green:0x97/255.0 blue:0xff/255.0 alpha:1.0]
#define kColore5e5e5    [UIColor colorWithRed:0xe5/255.0 green:0xe5/255.0 blue:0xe5/255.0 alpha:1.0]
#define kColorff4a00    [UIColor colorWithRed:0xff/255.0 green:0x4a/255.0 blue:0x00/255.0 alpha:1.0]
#define kColor06a3F9    [UIColor colorWithRed:0x06/255.0 green:0xa3/255.0 blue:0xf9/255.0 alpha:1.0]
#define kColorea6200    [UIColor colorWithRed:0xea/255.0 green:0x62/255.0 blue:0x00/255.0 alpha:1.0]
#define kColor12b6b0    [UIColor colorWithRed:0x12/255.0 green:0xb6/255.0 blue:0xb0/255.0 alpha:1.0]
#define kColor333333    [UIColor colorWithRed:0x33/255.0 green:0x33/255.0 blue:0x33/255.0 alpha:1.0]
#define kColor666666    [UIColor colorWithRed:0x66/255.0 green:0x66/255.0 blue:0x66/255.0 alpha:1.0]
#define kColor999999    [UIColor colorWithRed:0x99/255.0 green:0x99/255.0 blue:0x99/255.0 alpha:1.0]
#define kColorD7D7D7    [UIColor colorWithRed:0xd7/255.0 green:0xd7/255.0 blue:0xd7/255.0 alpha:1.0]
#define kColorDFDFDF    [UIColor colorWithRed:0xdf/255.0 green:0xdf/255.0 blue:0xdf/255.0 alpha:1.0]
#define kColorF3F3F3    [UIColor colorWithRed:0xF3/255.0 green:0xF3/255.0 blue:0xF3/255.0 alpha:1.0]
#define kColorFCFCFC    [UIColor colorWithRed:0xFC/255.0 green:0xFC/255.0 blue:0xFC/255.0 alpha:1.0]
#define kColor000000    [UIColor colorWithRed:0x00/255.0 green:0x00/255.0 blue:0x00/255.0 alpha:1.0]
#define kColor2fa414    [UIColor colorWithRed:0x2f/255.0 green:0xa4/255.0 blue:0x14/255.0 alpha:1.0]
#define kColorffa600    [UIColor colorWithRed:0xff/255.0 green:0xa6/255.0 blue:0x00/255.0 alpha:1.0]
#define kColorececec    [UIColor colorWithRed:0xec/255.0 green:0xec/255.0 blue:0xec/255.0 alpha:1.0]
#define kColorEEEEEE    [UIColor colorWithRed:0xee/255.0 green:0xee/255.0 blue:0xee/255.0 alpha:1.0]
#define kColorE1E1E1    [UIColor colorWithRed:0xe1/255.0 green:0xe1/255.0 blue:0xe1/255.0 alpha:1.0]
#define kColorFF9900    [UIColor colorWithRed:0xff/255.0 green:0x99/255.0 blue:0x00/255.0 alpha:1.0]
#define kColorFFB8B5    [UIColor colorWithRed:0xff/255.0 green:0xb8/255.0 blue:0xb5/255.0 alpha:1.0]
#define kColorFF5C2F    [UIColor colorWithRed:0xff/255.0 green:0x5c/255.0 blue:0x2f/255.0 alpha:1.0]
#define kColorFA2F23    [UIColor colorWithRed:0xfa/255.0 green:0x2f/255.0 blue:0x23/255.0 alpha:1.0]
#define kColorFF4A00    [UIColor colorWithRed:0xff/255.0 green:0x4a/255.0 blue:0x00/255.0 alpha:1.0]
#define kColorFFE4BC    [UIColor colorWithRed:0xfF/255.0 green:0xe4/255.0 blue:0xbc/255.0 alpha:1.0]
#define kColorFE4C01    [UIColor colorWithRed:0xfe/255.0 green:0x4c/255.0 blue:0x01/255.0 alpha:1.0]
#define kColorF7F7F7    [UIColor colorWithRed:0xf7/255.0 green:0xf7/255.0 blue:0xf7/255.0 alpha:1.0]
#define kColorBBBBBB    [UIColor colorWithRed:0xbb/255.0 green:0xbb/255.0 blue:0xbb/255.0 alpha:1.0]
// 字体
#define kFontWith(font)     [DYThemeManager getUsualFont:(font)]
#define kFont100px          kFontWith(50)
#define kFont65px           kFontWith(32.5)
#define kFont42px           kFontWith(21)
#define kFont36px           kFontWith(18)
#define kFont34px           kFontWith(17)
#define kFont32px           kFontWith(16)
#define kFont30px           kFontWith(15)
#define kFont28px           kFontWith(14)
#define kFont26px           kFontWith(13)
#define kFont24px           kFontWith(12)
#define kFont22px           kFontWith(11)
#define kFont20px           kFontWith(10)
#define kFont16px           kFontWith(9)
#define kFont10px           kFontWith(5)
#define kPointWithPx(px)       ((px)/2)
#define kRatioWidth(px) (px)/750.f * [UIScreen mainScreen].bounds.size.width
#define kRatioHeight(px) (px)/1334.f * [UIScreen mainScreen].bounds.size.height

// 按钮
#define kImportantButton(button) \
[button.layer setCornerRadius:2.0f];\
button.layer.masksToBounds = YES;\
[button setBackgroundImage:[[HAImageUtil imageWithColor:[UIColor colorWithRed:0x06/255.0 green:0xa3/255.0 blue:0xf9/255.0 alpha:1.0f] size:4] stretchableImageWithLeftCapWidth:2 topCapHeight:2] forState:UIControlStateNormal];\
[button setBackgroundImage:[[HAImageUtil imageWithColor:[UIColor colorWithRed:0x00/255.0 green:0x7b/255.0 blue:0xbe/255.0 alpha:1.0f] size:4] stretchableImageWithLeftCapWidth:2 topCapHeight:2] forState:UIControlStateHighlighted];\
[button setBackgroundImage:[[HAImageUtil imageWithColor:[UIColor colorWithRed:0xe5/255.0 green:0xe5/255.0 blue:0xe5/255.0 alpha:1.0f] size:4] stretchableImageWithLeftCapWidth:2 topCapHeight:2] forState:UIControlStateDisabled];\
[button setTitleColor:[UIColor colorWithRed:0xff/255.0 green:0xff/255.0 blue:0xff/255.0 alpha:1.0f] forState:UIControlStateNormal];\
[button setTitleColor:[UIColor colorWithRed:0xff/255.0 green:0xff/255.0 blue:0xff/255.0 alpha:0.7f] forState:UIControlStateHighlighted];\
[button setTitleColor:[UIColor colorWithRed:0x99/255.0 green:0x99/255.0 blue:0x99/255.0 alpha:1.0f] forState:UIControlStateDisabled];\
[button.titleLabel setFont:kFont32px];

#define kNormalButton(button) \
[button setBackgroundImage:[UIImage imageNamed:@"btn_normal"] forState:UIControlStateNormal];\
[button setBackgroundImage:[UIImage imageNamed:@"btn_highlighted"] forState:UIControlStateHighlighted];\
[button setBackgroundImage:[UIImage imageNamed:@"btn_normal"] forState:UIControlStateDisabled];\
[button setTitleColor:[UIColor colorWithRed:0x33/255.0 green:0x33/255.0 blue:0x33/255.0 alpha:1.0f] forState:UIControlStateNormal];\
[button setTitleColor:[UIColor colorWithRed:0xff/255.0 green:0xff/255.0 blue:0xff/255.0 alpha:1.0f] forState:UIControlStateHighlighted];\
[button setTitleColor:[UIColor colorWithRed:0x99/255.0 green:0x99/255.0 blue:0x99/255.0 alpha:1.0f] forState:UIControlStateDisabled];\
[button.titleLabel setFont:kFont32px];

// 模块
#define kTextSpan               10.0f
#define kModuleSpan             15.0f
#define kModuleInnerSpanColor   [UIColor colorWithRed:0xd7/255.0 green:0xd7/255.0 blue:0xd7/255.0 alpha:1.0f]
