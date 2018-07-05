//
//  DYUserVisitorSliderView.h
//  ZRSearchHistory
//
//  Created by Zhongrui on 2018/6/25.
//  Copyright © 2018年 XZR. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DYVisitorModel;

@protocol DYUserVisitorSliderViewDelegate<NSObject>
@optional

- (void)visitorSliderViewClickedAvatat:(DYVisitorModel *)visitorModel;

@end

@interface DYUserVisitorSliderView : UIScrollView

@property(nonatomic, weak) id<DYUserVisitorSliderViewDelegate> dyDelegate;
@property(nonatomic, strong) NSArray<DYVisitorModel *> *visitorsArr;

@end
