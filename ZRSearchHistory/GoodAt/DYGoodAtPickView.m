//
//  HistoryWords.m
//  ZRSearchHistory
//
//  Created by ZhongruiXu on 2017/4/20.
//  Copyright © 2017年 XZR. All rights reserved.
//

#import "DYGoodAtPickView.h"

//#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define btnW (kScreenWidth - 16 * 2 - 10 * 2) / 3

@class DYBoardButton;
static UIColor *BorderColor() { return kCOLORWithHex(0xDEDEDE); }
static UIColor *selectedBorderColor() { return kCOLORWithHex(0x3997FF); }

static UIFont *normalFont() { return [DYThemeManager getUsualFont:16]; }
static UIFont *selectedFont() { return [DYThemeManager getBoldFont:16]; }

@interface DYBoardButton : UIButton

@end

@implementation DYBoardButton

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    self.layer.borderColor = (selected) ? selectedBorderColor().CGColor : BorderColor().CGColor;
    self.titleLabel.font = (selected) ? selectedFont() : normalFont();
}

- (void)setHighlighted:(BOOL)highlighted {
    //重写此方法 防止点击时闪烁
}

@end
@interface DYGoodAtPickView ()
@property(nonatomic, strong) NSMutableArray *rowsContainer;
@property(nonatomic, assign) CGFloat selfHeight;
@property(nonatomic, assign) CGRect selfFrame;
/// 每次至多选择三个选项
@property(nonatomic, strong) NSMutableArray<NSString *> *selectedButtonArr;

@end
/// button 文字两边空隙
CGFloat const pickBtnEnhanceW = 24;
/// button 左右之间间距
CGFloat const pickBtnMargin = 10;
/// button 与屏幕间距
CGFloat const pickBtnSpace = 16;
/// button 上下间距
CGFloat const pickBtnMarginTB = 12;
/// button 高度
CGFloat const pickBtnH = 40;

///列数
NSInteger const pickColNum = 3;

@implementation DYGoodAtPickView
#pragma mark - Setter

- (void)setHistoryWordsArr:(NSArray<NSString *> *)historyWordsArr {
    _historyWordsArr = historyWordsArr;
    NSUInteger count = historyWordsArr.count;

    for (int i = 0; i < count; i++) {
        NSString *hitoryWord = historyWordsArr[i];

        NSInteger row = i / pickColNum;
        NSInteger col = i % pickColNum;

        CGFloat btnX = (btnW + pickBtnMargin) * col;
        CGFloat btnY = (pickBtnH + pickBtnMarginTB) * row;

        DYBoardButton *button = [DYBoardButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:hitoryWord forState:UIControlStateNormal];

        [button addTarget:self action:@selector(keyButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 20;
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageWithColor:kColorWhite size:CGSizeMake(1, 1)]
                          forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageWithColor:kColorWhite size:CGSizeMake(1, 1)]
                          forState:UIControlStateHighlighted];
        [button setBackgroundImage:[UIImage imageWithColor:kCOLORWithHex(0xDEEFFD) size:CGSizeMake(1, 1)]
                          forState:UIControlStateSelected];

        [button setTitleColor:kColor666666 forState:UIControlStateNormal];
        [button setTitleColor:kColor3997ff forState:UIControlStateSelected];
        button.titleLabel.font = kFont32px;

        [button.layer setBorderWidth:0.5];
        [button.layer setCornerRadius:3.0];
        [button.layer setBorderColor:kCOLORWithHex(0xDEDEDE).CGColor];
        button.frame = CGRectMake(btnX, btnY, btnW, pickBtnH);
        [self addSubview:button];
        if (i == count - 1) {
            _selfHeight = CGRectGetMaxY(button.frame);
            [self setNeedsLayout];
        }
    }
}

#pragma mark - setter
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    _selfFrame = frame;
}

#pragma mark - getter

- (NSMutableArray *)rowsContainer {
    if (!_rowsContainer) {
        _rowsContainer = [[NSMutableArray alloc] init];
    }
    return _rowsContainer;
}

- (NSMutableArray<NSString *> *)selectedButtonArr {
    if (!_selectedButtonArr) {
        _selectedButtonArr = [[NSMutableArray alloc] init];
    }
    return _selectedButtonArr;
}

#pragma mark - private method
- (void)keyButtonAction:(DYBoardButton *)button {
    button.selected = !button.selected;
    if (button.selected) {
        if (self.selectedButtonArr.count == 3) {
            button.selected = NO;
            return;
        }
        [self.selectedButtonArr addObject:button.titleLabel.text];
    } else {
        [self.selectedButtonArr removeObject:button.titleLabel.text];
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(goodAtPickViewDidEndSelected:)]) {
        [self.delegate goodAtPickViewDidEndSelected:self.selectedButtonArr];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.frame = CGRectMake(_selfFrame.origin.x, _selfFrame.origin.y, _selfFrame.size.width, _selfHeight);
}
@end


