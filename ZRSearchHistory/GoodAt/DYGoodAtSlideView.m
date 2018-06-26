//
//  DYGoodAtSlideView.m
//  ZRSearchHistory
//
//  Created by Zhongrui on 2018/6/25.
//  Copyright © 2018年 XZR. All rights reserved.
//

#import "DYGoodAtSlideView.h"

@interface DYGoodAtSlideView ()
@property(nonatomic, strong) NSMutableArray *buttonArr;
@end

/// button 文字两边空隙
CGFloat const goodatBtnEnhanceW = 22;
/// button 左右之间间距
CGFloat const goodatBtnMargin = 16;
/// button 与屏幕间距
CGFloat const goodatBtnSpace = 16;
/// button 高度
CGFloat const goodatBtnH = 24;

@implementation DYGoodAtSlideView
- (void)setGoodAt:(NSArray<NSString *> *)goodAt {
    _goodAt = goodAt;

    [self.buttonArr enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
      [obj enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        [obj removeFromSuperview];
      }];
    }];
    [self.buttonArr removeAllObjects];

    for (int index = 0; index < _goodAt.count; index++) {
        NSString *buttonTitle = goodAt[index];
        UIButton *btn = [UIButton new];
        btn.titleLabel.font = kFont28px;
        [btn setTitleColor:kColor333333 forState:UIControlStateNormal];
        [btn setTitle:buttonTitle forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.enabled = NO;
        [btn sizeToFit];

        UIImage *backImage = [UIImage imageNamed:@"UserPage_Skill_LabelBackground"];
        [btn setBackgroundImage:[backImage resizableImageWithCapInsets:UIEdgeInsetsMake(10, 30, 10, 30)
                                                          resizingMode:UIImageResizingModeStretch]
                       forState:UIControlStateNormal];

        UIButton *lastBtn = [self.buttonArr lastObject];
        CGFloat btnX = goodatBtnMargin + CGRectGetMaxX(lastBtn.frame);

        btn.frame = CGRectMake(btnX, 0, btn.frame.size.width + goodatBtnEnhanceW * 2, goodatBtnH);

        [self.buttonArr addObject:btn];
        [self addSubview:btn];
    }
    UIButton *lastBtn = [self.buttonArr lastObject];
    self.contentSize = CGSizeMake(CGRectGetMaxX(lastBtn.frame) + goodatBtnSpace, 0);
    self.showsHorizontalScrollIndicator = NO;
}

- (void)btnAction:(UIButton *)sender {
    NSLog(@"UIButton %@", sender);
}

- (NSMutableArray *)buttonArr {
    if (!_buttonArr) {
        _buttonArr = [[NSMutableArray alloc] init];
    }
    return _buttonArr;
}

@end
