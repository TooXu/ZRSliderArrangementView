//
//  DYUserMyTagView.m
//  ZRSearchHistory
//
//  Created by Zhongrui on 2018/6/26.
//  Copyright © 2018年 XZR. All rights reserved.
//

#import "DYUserMyTagView.h"
#import "DYEvaluateModel.h"

@interface DYPersonEvaluateButton : UIButton

@property(nonatomic, strong) UIColor *dottedLineColor;
@property(nonatomic, strong) CAShapeLayer *buttonLayer;

- (void)setDottedLineboard;
@end

@implementation DYPersonEvaluateButton

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    self.buttonLayer.fillColor = backgroundColor.CGColor;
}

- (void)setDottedLineColor:(UIColor *)dottedLineColor {
    self.buttonLayer.strokeColor = dottedLineColor.CGColor;
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    self.backgroundColor = selected ? self.backgroundColor : [UIColor clearColor];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //        [self dottedLineboard];
    }
    return self;
}
- (void)setDottedLineboard {
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    self.buttonLayer = borderLayer;
    borderLayer.frame = self.bounds;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:borderLayer.bounds
                                                    cornerRadius:CGRectGetHeight(borderLayer.bounds) / 2];
    borderLayer.path = path.CGPath;

    borderLayer.lineWidth = 1. / [[UIScreen mainScreen] scale];
    borderLayer.lineCap = @"round";
    borderLayer.lineDashPhase = 3;
    //虚线边框
    borderLayer.lineDashPattern = @[ @3, @3 ];
    //实线边框
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    //    borderLayer.strokeColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:borderLayer];
}

@end

@interface DYUserMyTagView ()
@property(nonatomic, strong) UIButton *lineButton;
//@property(nonatomic, strong) UIColor *selectedColor;
@property(nonatomic, strong) NSMutableArray *selectedBtnArr;
@end

/// button 文字两边空隙
CGFloat const EvaluateBtnEnhanceW = 12;
/// button 左右之间间距
CGFloat const EvaluateBtnMargin = 8;
/// button 与屏幕间距
CGFloat const EvaluateBtnSpace = 16;
/// button 上下间距
CGFloat const EvaluateBtnMarginTB = 12;
/// button 高度
CGFloat const EvaluateBtnH = 30;
///列数
NSInteger const EvaluateColNum = 3;

@implementation DYUserMyTagView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)setModelArr:(NSArray<DYEvaluateModel *> *)modelArr {
    _modelArr = modelArr;
    NSInteger count = _modelArr.count;
    
//    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    
    for (int i = 0; i < count; i++) {
        DYEvaluateModel *model = modelArr[i];
        model.color = kRandomColor;
        model.value = @"0";
        NSInteger row = i / EvaluateColNum;
        NSInteger col = i % EvaluateColNum;
        CGFloat btnX = 0;
        if (col > 0) {
            btnX = (CGRectGetMaxX(self.subviews[i - 1].frame) + EvaluateBtnMargin);
        }

        CGFloat btnY = (EvaluateBtnH + EvaluateBtnMarginTB) * row;

        DYPersonEvaluateButton *button = [DYPersonEvaluateButton new];
        [button.titleLabel setFont:kFont22px];
        [button setTitle:[NSString stringWithFormat:@"%@(%@)", model.name, model.value] forState:UIControlStateNormal];
        button.tag = i;
        [button sizeToFit];
        [button setTitleColor:[UIColor hexStringToColor:model.font_color] forState:UIControlStateNormal];
        button.frame = CGRectMake(btnX, btnY, button.width + EvaluateBtnEnhanceW * 2, EvaluateBtnH);
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [button setDottedLineboard];
        [button setDottedLineColor:[UIColor hexStringToColor:model.font_color]];
        [self addSubview:button];
    }
}

- (void)buttonAction:(DYPersonEvaluateButton *)button {
    if (self.selectedBtnArr.count == 3) {
        return;
    }
    button.selected = YES;
    [self.selectedBtnArr addObject:button];
    button.buttonLayer.lineDashPattern = nil;
    //    button.backgroundColor = [self.modelArr[button.tag].color colorWithAlphaComponent:0.7];
    button.backgroundColor = [UIColor hexStringToColor:self.modelArr[button.tag].bg_color];
}

- (NSMutableArray *)selectedBtnArr {
    if (!_selectedBtnArr) {
        _selectedBtnArr = [[NSMutableArray alloc] init];
    }
    return _selectedBtnArr;
}

@end
