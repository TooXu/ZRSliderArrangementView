//
//  ViewController.m
//  ZRSearchHistory
//
//  Created by ZhongruiXu on 2017/4/20.
//  Copyright © 2017年 XZR. All rights reserved.
//

#import "ViewController.h"
#import "DYGoodAtPickView.h"
#import "DYGoodAtSlideView.h"
#import "UIView+Frame.h"
#import "UIConst.h"
#import "DYVisitorSliderView.h"
#import "DYVisitorModel.h"

@interface ViewController ()<DYGoodAtPickViewDelegate>
@property (nonatomic, strong) DYGoodAtPickView *historyView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *historyWordsArr = @[@"海钓",@"台钓",@"野钓",@"矶钓",@"路亚",@"传统钓",@"竞技",@"筏钓",@"远投"];
    
    DYGoodAtPickView *historyWordsView = [[DYGoodAtPickView alloc]initWithFrame:CGRectMake(16, 100, kScreenWidth, 0)];
    self.historyView = historyWordsView;
    historyWordsView.historyWordsArr = historyWordsArr;
    [historyWordsView layoutIfNeeded];
    historyWordsView.delegate = self;
    [self.view addSubview:historyWordsView];
    NSLog(@"historyWordsView - %@",historyWordsView);
    
    
    NSArray *goodATArr = @[@"海钓",@"台钓",@"传统钓",@"海钓",@"台钓",@"野钓"];
    
    DYGoodAtSlideView *goodAtView = [DYGoodAtSlideView new];
    goodAtView.frame = CGRectMake(0, historyWordsView.bottom + 12 , kScreenWidth, 24);
    goodAtView.goodAt = goodATArr;
    [self.view addSubview:goodAtView];
    
    DYVisitorModel *visitorA = [DYVisitorModel new];
    DYVisitorModel *visitorB = [DYVisitorModel new];
    DYVisitorModel *visitorC = [DYVisitorModel new];
    DYVisitorModel *visitorD = [DYVisitorModel new];
    DYVisitorModel *visitorE = [DYVisitorModel new];
    visitorA.img = @"http://p5.diaoyu123.com/group5/M00/45/DB/CgAAuFg6HDmAKIGgAAB7S78yo_c026.jpg";
    visitorB.img = @"http://p5.diaoyu123.com/group5/M00/45/DB/CgAAuFg6HDmAKIGgAAB7S78yo_c026.jpg";
    visitorC.img = @"http://p5.diaoyu123.com/group5/M00/45/DB/CgAAuFg6HDmAKIGgAAB7S78yo_c026.jpg";
    visitorD.img = @"http://p5.diaoyu123.com/group5/M00/45/DB/CgAAuFg6HDmAKIGgAAB7S78yo_c026.jpg";
    visitorE.img = @"http://p5.diaoyu123.com/group5/M00/45/DB/CgAAuFg6HDmAKIGgAAB7S78yo_c026.jpg";

    NSArray *visitorArr = @[visitorA,visitorB,visitorC,visitorD,visitorE,visitorA,visitorB,visitorC,visitorD,visitorE];
    
    DYVisitorSliderView *visitorView = [DYVisitorSliderView new];
    visitorView.frame = CGRectMake(0, goodAtView.bottom + 30, kScreenWidth, 54);
    visitorView.visitorsArr = visitorArr;
    [self.view addSubview:visitorView];
}



#pragma mark - HistoryWordsViewDelegate 
- (void)historyWordHasBeenClicked:(NSString *)keyWord {
    NSLog(@"keyWord -- %@",keyWord);
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    // Dispose of any resources that can be recreated.
}

@end
