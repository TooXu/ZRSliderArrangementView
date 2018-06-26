//
//  HistoryWords.m
//  ZRSearchHistory
//
//  Created by ZhongruiXu on 2017/4/20.
//  Copyright © 2017年 XZR. All rights reserved.
//

#import "HistoryWordsView.h"

#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define btnw (kScreenWidth - 16 * 2 - 10 * 2) / 3

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
@interface HistoryWordsView ()
@property(nonatomic, strong) NSMutableArray *rowsContainer;
@property(nonatomic, assign) CGFloat selfHeight;
@property(nonatomic, assign) CGRect selfFrame;

@property(nonatomic, strong) NSMutableArray<DYBoardButton *> *selectedButtonArr;

@end
/// button 文字两边空隙
CGFloat const btnEnhanceW = 24;
/// button 左右之间间距
CGFloat const btnMargin = 10;
/// button 与屏幕间距
CGFloat const btnSpace = 16;
/// button 上下间距
CGFloat const btnMarginTB = 12;
/// button 高度
CGFloat const btnH = 40;

@implementation HistoryWordsView
#pragma mark - Setter

- (void)setHistoryWordsArr:(NSArray<NSString *> *)historyWordsArr {
    _historyWordsArr = historyWordsArr;

    [self.rowsContainer enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
      [obj enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        [obj removeFromSuperview];
      }];
    }];
    [self.rowsContainer removeAllObjects];

    NSUInteger count = historyWordsArr.count;
    CGFloat tempSum = 0;

    NSMutableArray *btnsArr = [NSMutableArray array];
    [self.rowsContainer addObject:btnsArr];

    for (int i = 0; i < count; i++) {
        NSString *hitoryWord = historyWordsArr[i];

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

        [self addSubview:button];
        CGFloat btnW = (kScreenWidth - btnMargin * 4) / 3;
        tempSum += btnW;

        if (tempSum < self.bounds.size.width + btnMargin) {
            [btnsArr addObject:button];
        } else {
            tempSum = btnW;
            btnsArr = [NSMutableArray array];
            [btnsArr addObject:button];
            [_rowsContainer addObject:btnsArr];
        }
    }

    CGFloat btnY = 0;
    for (int index = 0; index < self.rowsContainer.count; index++) {
        NSArray<DYBoardButton *> *btnsArr = self.rowsContainer[index];
        if (index == 0) {
            btnY = 15;
        } else {
            btnY = 15 + (btnH + btnMarginTB) * index;
        }
        for (int i = 0; i < btnsArr.count; i++) {
            DYBoardButton *button = (DYBoardButton *)[btnsArr objectAtIndex:i];
            [button sizeToFit];
            if (i == 0) {
                button.frame = CGRectMake(0, btnY, btnw, btnH);
            } else {
                button.frame = CGRectMake(CGRectGetMaxX(btnsArr[i - 1].frame) + btnMargin, btnY, btnw, btnH);
            }
            if (index == self.rowsContainer.count - 1 && i == btnsArr.count - 1) {
                _selfHeight = CGRectGetMaxY(button.frame);
                [self setNeedsLayout];
            }
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

- (NSMutableArray<DYBoardButton *> *)selectedButtonArr {
    if (!_selectedButtonArr) {
        _selectedButtonArr = [[NSMutableArray alloc] init];
    }
    return _selectedButtonArr;
}

#pragma mark - private method
- (void)keyButtonAction:(DYBoardButton *)button {
    NSString *title = button.titleLabel.text;
    button.selected = !button.selected;
    if (button.selected) {
        if (self.selectedButtonArr.count == 3) {
            button.selected = NO;
            return;
        }
        [self.selectedButtonArr addObject:button];
    } else {
        [self.selectedButtonArr removeObject:button];
    }

    //    if (self.selectedButtonArr.count > 3) {
    //        return;
    //        DYBoardButton *firstBtn = [self.selectedButtonArr firstObject];
    //        firstBtn.selected = NO;
    //        [self.selectedButtonArr removeObject:firstBtn];
    //    }

    if (self.delegate && [self.delegate respondsToSelector:@selector(historyWordHasBeenClicked:)]) {
        [self.delegate historyWordHasBeenClicked:title];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.frame = CGRectMake(_selfFrame.origin.x, _selfFrame.origin.y, _selfFrame.size.width, _selfHeight);
    NSLog(@"layoutSubviews %@",self);
}
@end


