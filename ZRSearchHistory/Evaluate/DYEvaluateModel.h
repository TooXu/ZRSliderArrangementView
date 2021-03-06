//
//  DYEvaluateModel.h
//  ZRSearchHistory
//
//  Created by Zhongrui on 2018/6/26.
//  Copyright © 2018年 XZR. All rights reserved.
//

#import <Foundation/Foundation.h>

//"profile_id": "17",
//"profile": "cuidiaodashi",
//"name": "垂钓大师",
//"value": "",
//"is_check": 0,
//"font_color": "#ffffff",
//"bg_color": "#aaaaaa"

@interface DYEvaluateModel : NSObject

@property(nonatomic, strong) NSString *profile_id;
@property(nonatomic, strong) NSString *profile;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *value;
@property(nonatomic, strong) NSString *is_check;
@property(nonatomic, strong) NSString *font_color;
@property(nonatomic, strong) NSString *bg_color;
@property(nonatomic, strong) UIColor *color;
@end
