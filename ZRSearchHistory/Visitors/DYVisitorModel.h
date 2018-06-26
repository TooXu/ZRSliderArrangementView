//
//  DYVisitorModel.h
//  ZRSearchHistory
//
//  Created by Zhongrui on 2018/6/25.
//  Copyright © 2018年 XZR. All rights reserved.
//

#import <Foundation/Foundation.h>

//"title": "海涛渔具三木",
//"img": "http://p5.diaoyu123.com/group5/M00/45/DB/CgAAuFg6HDmAKIGgAAB7S78yo_c026.jpg",
//"target": "user",
//"target_val": 9353296

@interface DYVisitorModel : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *target;
@property (nonatomic, strong) NSString *target_val;
@end
