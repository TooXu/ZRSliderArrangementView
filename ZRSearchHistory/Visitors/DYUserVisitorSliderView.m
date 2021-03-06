//
//  DYUserVisitorSliderView.m
//  ZRSearchHistory
//
//  Created by Zhongrui on 2018/6/25.
//  Copyright © 2018年 XZR. All rights reserved.
//

#import "DYUserVisitorSliderView.h"
#import "DYVisitorModel.h"

@interface DYVisitorAvatarView : UIView
@property(nonatomic, strong) UIImageView *avatarImg;
@end

@implementation DYVisitorAvatarView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kColore5e5e5;
        self.layer.cornerRadius = self.width * 0.5;
        self.layer.masksToBounds = YES;
        [self setupView];
    }
    return self;
}

- (void)setupView {
    UIImageView *avatarImg = [UIImageView new];
    self.avatarImg = avatarImg;
    [self addSubview:avatarImg];
    avatarImg.size = CGSizeMake(self.width - 2, self.height - 2);
    avatarImg.center = CGPointMake(self.width * 0.5, self.height * 0.5);
}

@end

@interface DYUserVisitorSliderView ()
@property(nonatomic, strong) NSMutableArray *avatarArr;
@end

@implementation DYUserVisitorSliderView
/// button 左右之间间距
CGFloat const avatarImgMargin = 4;
/// button 与屏幕间距
CGFloat const avatarImgSpace = 16;
/// button 高度
CGFloat const avatarImgH = 54;

- (void)setVisitorsArr:(NSArray<DYVisitorModel *> *)visitorsArr {
    _visitorsArr = visitorsArr;

    [self.avatarArr makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.avatarArr removeAllObjects];

    for (int index = 0; index < _visitorsArr.count; index++) {
        DYVisitorAvatarView *avatarView =
            [[DYVisitorAvatarView alloc] initWithFrame:CGRectMake(0, 0, avatarImgH, avatarImgH)];
        UIImageView *lastImg = [self.avatarArr lastObject];
        [avatarView.avatarImg sd_setImageWithURL:[NSURL URLWithString:_visitorsArr[index].img]
                                placeholderImage:[UIImage imageNamed:@"default_face"]];
        CGFloat imgX = avatarImgMargin + CGRectGetMaxX(lastImg.frame);
        if (index == 0) {
            imgX = avatarImgSpace + CGRectGetMaxX(lastImg.frame);
        }
        avatarView.tag = index;
        avatarView.frame = CGRectMake(imgX, 0, avatarImgH, avatarImgH);
        [avatarView addTapAction:@selector(avatarViewClicked:) target:self];
        [self.avatarArr addObject:avatarView];
        [self addSubview:avatarView];
    }
    UIImageView *lastImg = [self.avatarArr lastObject];
    self.contentSize = CGSizeMake(CGRectGetMaxX(lastImg.frame) + avatarImgSpace, 0);
    self.showsHorizontalScrollIndicator = NO;
}

- (NSMutableArray *)avatarArr {
    if (!_avatarArr) {
        _avatarArr = [[NSMutableArray alloc] init];
    }
    return _avatarArr;
}
- (void)avatarViewClicked:(UIGestureRecognizer *)gesture {
    DYVisitorModel *model = self.visitorsArr[gesture.view.tag];
    if (self.dyDelegate && [self.dyDelegate respondsToSelector:@selector(visitorSliderViewClickedAvatat:)]) {
        [self.dyDelegate visitorSliderViewClickedAvatat:model];
    }
}

@end
