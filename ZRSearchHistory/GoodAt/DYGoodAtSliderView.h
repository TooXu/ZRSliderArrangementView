//
//  DYGoodAtSliderView.h
//  ZRSearchHistory
//
//  Created by Zhongrui on 2018/6/25.
//  Copyright © 2018年 XZR. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DYGoodAtModel;

@interface DYGoodAtSliderView : UIScrollView
//@property(nonatomic, strong) NSArray<NSString *> *goodAt;
@property (nonatomic, strong) NSArray<DYGoodAtModel *> *goodAtArr;
@end
