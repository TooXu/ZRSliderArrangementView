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
#import "DYPersonEvaluateView.h"
#import "DYEvaluateModel.h"

@interface ViewController ()<DYGoodAtPickViewDelegate,DYVisitorSliderViewDelegate>
@property (nonatomic, strong) DYGoodAtPickView *historyView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *historyWordsArr = @[@"海钓",@"台钓",@"野钓",@"矶钓",@"路亚",@"传统钓",@"竞技",@"筏钓",@"远投"];
    
    DYGoodAtPickView *dygoodatPickView = [[DYGoodAtPickView alloc]initWithFrame:CGRectMake(16, 100, kScreenWidth, 0)];
    self.historyView = dygoodatPickView;
    dygoodatPickView.historyWordsArr = historyWordsArr;
    [dygoodatPickView layoutIfNeeded];
    dygoodatPickView.delegate = self;
    [self.view addSubview:dygoodatPickView];
    NSLog(@"historyWordsView - %@",dygoodatPickView);
    
    
    NSArray *goodATArr = @[@"海钓",@"台钓",@"传统钓",@"海钓",@"台钓",@"野钓"];
    
    DYGoodAtSlideView *goodAtView = [DYGoodAtSlideView new];
    goodAtView.frame = CGRectMake(0, dygoodatPickView.bottom + 12 , kScreenWidth, 24);
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
    visitorView.delegate = self;
    visitorView.frame = CGRectMake(0, goodAtView.bottom + 30, kScreenWidth, 54);
    visitorView.visitorsArr = visitorArr;
    [self.view addSubview:visitorView];
    
    NSArray *evaluate = @[@"垂钓大师",@"钓鱼小白",@"爆护选手",@"钓鱼狂",@"野钓空军",@"垂钓大师"];
    NSMutableArray *evalutorModelArr = [NSMutableArray array];
    for (NSString *str in evaluate) {
        DYEvaluateModel *model = [DYEvaluateModel new];
        model.name = str;
        model.color = kRandomColor;
        model.value = [NSString stringWithFormat:@"%d",arc4random() % 1000];
        [evalutorModelArr addObject:model];
    }
    
    
    DYPersonEvaluateView *personview = [[DYPersonEvaluateView alloc]initWithFrame:CGRectMake(16, visitorView.bottom + 32, kScreenWidth - 32, 144)];
    personview.modelArr = [evalutorModelArr copy];
    [self.view addSubview:personview];
}

#pragma mark - HistoryWordsViewDelegate 
- (void)historyWordHasBeenClicked:(NSString *)keyWord {
    NSLog(@"keyWord -- %@",keyWord);
}

- (void)visitorSliderViewClickedAvatat:(DYVisitorModel *)visitorModel {
    NSLog(@"%@",visitorModel);
}
- (void)goodAtPickViewDidEndSelected:(NSArray *)goodAtArr {
    NSLog(@"keyWord -- %@",goodAtArr);

}

@end
