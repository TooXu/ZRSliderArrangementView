//
//  NSObject+JsonDicExchange.h
//  ZRSearchHistory
//
//  Created by Zhongrui on 2018/6/26.
//  Copyright © 2018年 XZR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JsonDicExchange)
- (NSString *)dictionaryToJson:(NSDictionary *)dic;
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
@end
