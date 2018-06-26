//
//  DYGoodAtPickView.h
//  ZRSearchHistory
//
//  Created by ZhongruiXu on 2017/4/20.
//  Copyright © 2017年 XZR. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DYGoodAtPickViewDelegate<NSObject>
@optional

- (void)goodAtPickViewDidEndSelected:(NSArray *)goodAtArr;

@end

@interface DYGoodAtPickView : UIView

@property(nonatomic, strong) NSArray<NSString *> *historyWordsArr;
@property(nonatomic, weak) id<DYGoodAtPickViewDelegate> delegate;

@end
