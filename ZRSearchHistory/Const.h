//
//  Const.h
//  fishing
//
//  Created by dongjianbo on 15-6-2.
//  Copyright (c) 2015年 mahua. All rights reserved.
//
// 主目录
#define kPathRoot           [NSString stringWithFormat:@"%@/Library/aimdev", NSHomeDirectory()]
// 文件缓存目录
#define kPathCache          [NSString stringWithFormat:@"%@/cache", kPathRoot]
#define RunTimeSysVersion   ([[UIDevice currentDevice].systemVersion floatValue])
#define IS_IOS_7            (RunTimeSysVersion >= 7.0f)
#define IS_IOS_8             (RunTimeSysVersion >= 8.0f)
#define IS_IOS_9             (RunTimeSysVersion >= 9.0f)
#define IS_IOS_92             (RunTimeSysVersion >= 9.2f)
#define IS_IOS_11             (RunTimeSysVersion >= 11.0f)
#define IS_IOS_12             (RunTimeSysVersion >= 12.0f)

/**
 *  app版本号
 */
#define kApiVersion @"2.8.8"

/**
 *  渠道
 *  91       ============ @"_91"
 *  appStore ============ @""
 */
#define kDYChannel @""

/**
 *  银联mode(00-线上  01-测试)
 */
#define kUPPayMode @"00"

#define API_Prefix          [DYNetWorkManager defaultManager].dy_API_Prefix
#define Rediao_API_Prefix   [DYNetWorkManager defaultManager].dy_Rediao_API_Prefix
#define Group_API_Prefix    [DYNetWorkManager defaultManager].dy_Group_API_Prefix
#define CONSUMER_KEY        [DYNetWorkManager defaultManager].dy_CONSUMER_KEY
#define CONSUMER_SECRET     [DYNetWorkManager defaultManager].dy_CONSUMER_SECRET

#define CONSUMER_KEY_Release        @"a6629e5bee253e965fd419d3dc4fa874"
#define CONSUMER_SECRET_Release     @"7be13316ccfa7e18d758059584b5354a"

#define CONSUMER_KEY_Test           @"330a0d79423034bb5a81adbf65ddb457"
#define CONSUMER_SECRET_Test        @"0e993995e7185afbd589341610646490"

/** 钓鱼123 */
#define API_Test @"http://api.diaoyu123.cc/"
#define API_Release @"https://api.diaoyu123.com/"
/** 热钓 */
#define Rediao_API_Test @"https://dev.api.rediao.com/"
#define Rediao_API_Release @"https://api.rediao.com/"
/** 拼团 */
#define Group_API_Test @"https://dev.api.rediao.com/"
#define Group_API_Release @"https://api.rediao.com/"

#define APP_API_HOST    [NSString stringWithFormat:@"%@app/", API_Prefix]
/**
 *  钓鱼123+目录为app的接口地址
 */
#define MAKE_REQUEST_URL(module) [NSString stringWithFormat:@"%@%@", APP_API_HOST, module]
/**
 *  钓鱼123+全域名+模块
 */
#define MAKE_REQUEST_ALL_URL(module) [NSString stringWithFormat:@"%@%@", API_Prefix, module]


/**
 *  热钓+全域名+模块 不带app/
 */
#define Rediao_MAKE_REQUEST_URL(module) [NSString stringWithFormat:@"%@%@", Rediao_API_Prefix, module]
/**
 *  热钓+全域名+模块 带app/
 */
#define Rediao_MAKE_REQUEST_APP_URL(module) [NSString stringWithFormat:@"%@app/%@", Rediao_API_Prefix, module]

/**
 *  拼团+全域名+模块 不带app/
 */
#define Group_MAKE_REQUEST_URL(module) [NSString stringWithFormat:@"%@%@", Group_API_Prefix, module]
/**
 *  拼团+全域名+模块 带app/
 */
#define Group_MAKE_REQUEST_APP_URL(module) [NSString stringWithFormat:@"%@app/%@", Group_API_Prefix, module]

#define XcodeAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

// 友盟
#define UMENG_APPKEY           @"55ac6eff67e58e09c0001ec7"
// AppleMechantID
#define kAppleMechantID        @"merchant.com.lchr.rediao"
// 微信支付key
#define Rediao_WechatPay_Key   @"wxea101aa8b7baa2ad"
// 微信小程序key
#define KRediao_WeChatMini_key @"gh_1e3aeadc8ba3"
// 百度地图key
#define KRediao_BMKMap_key     @"o0DzYkVj3vhOsZpmTpddfozPZ0Gihhwx"

/**
 *  DBversion
 */
#define kCityDBVersion @"20161121"

/**
 *  模板version
 */
#define kTemplateVersion 0

