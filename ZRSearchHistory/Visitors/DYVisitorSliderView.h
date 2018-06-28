//
//  DYVisitorSliderView.h
//  ZRSearchHistory
//
//  Created by Zhongrui on 2018/6/25.
//  Copyright © 2018年 XZR. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DYVisitorModel;

@protocol DYVisitorSliderViewDelegate<NSObject>
@optional

- (void)visitorSliderViewClickedAvatat:(DYVisitorModel *)visitorModel;

@end

@interface DYVisitorSliderView : UIScrollView

@property(nonatomic, weak) id<DYVisitorSliderViewDelegate> dyDelegate;
@property(nonatomic, strong) NSArray<DYVisitorModel *> *visitorsArr;

@end
