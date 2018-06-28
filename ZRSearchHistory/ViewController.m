//
//  ViewController.m
//  ZRSearchHistory
//
//  Created by ZhongruiXu on 2017/4/20.
//  Copyright © 2017年 XZR. All rights reserved.
//

#import "ViewController.h"
#import "DYGoodAtPickView.h"
#import "DYGoodAtSliderView.h"
#import "UIView+Frame.h"
#import "UIConst.h"
#import "DYVisitorSliderView.h"
#import "DYVisitorModel.h"
#import "DYPersonEvaluateView.h"
#import "DYEvaluateModel.h"
#import "DYGoodAtModel.h"
#import "NSObject+JsonDicExchange.h"

@interface ViewController ()<DYGoodAtPickViewDelegate, DYVisitorSliderViewDelegate>
@property(nonatomic, strong) DYGoodAtPickView *historyView;
@property (nonatomic, strong) DYVisitorSliderView *visitorView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.visitorView.visitorsArr = [self visitorArr];
}

#pragma mark - HistoryWordsViewDelegate
- (void)historyWordHasBeenClicked:(NSString *)keyWord {
    NSLog(@"keyWord -- %@", keyWord);
}
- (void)visitorSliderViewClickedAvatat:(DYVisitorModel *)visitorModel {
    NSLog(@"%@", visitorModel);
    [self.navigationController pushViewController:[UIViewController new] animated:YES];
    
}
- (void)goodAtPickViewDidEndSelected:(NSArray *)goodAtArr {
    NSLog(@"keyWord -- %@", goodAtArr);
}

- (NSArray *)good_atArr {
    NSString *json = @"{\"good_at\":[{\"profile_id\":\"15\",\"profile\":\"taidiao\",\"name\":\"台钓\",\"value\":\"\"},{"
                     @"\"profile_id\":\"14\",\"profile\":\"haidiao\",\"name\":\"海钓\",\"value\":\"\"},{\"profile_"
                     @"id\":\"16\",\"profile\":\"luya\",\"name\":\"路亚\",\"value\":\"\"}]}";
    NSDictionary *dic = [self dictionaryWithJsonString:json];
    return [DYGoodAtModel objectArrayWithKeyValuesArray:[dic objectForKey:@"good_at"]];
}

- (NSArray *)visitorArr {
    NSString *json = @"{\"visitors\":[{\"title\":\"新手要钓大鲫鱼\",\"img\":\"http://static.diaoyu123.com/app/default/img/default_avatar.png\",\"target\":\"user\",\"target_val\":\"9353299\"},{\"title\":\"洗洗嘻嘻嘻嘻\",\"img\":\"http://static.diaoyu123.com/app/default/img/default_avatar.png\",\"target\":\"user\",\"target_val\":\"9353298\"},{\"title\":\"苏州路亚新手小黑\",\"img\":\"http://static.diaoyu123.com/app/default/img/default_avatar.png\",\"target\":\"user\",\"target_val\":\"9353297\"},{\"title\":\"海涛渔具三木\",\"img\":\"http://p5.diaoyu123.com/group5/M00/45/DB/CgAAuFg6HDmAKIGgAAB7S78yo_c026.jpg\",\"target\":\"user\",\"target_val\":\"9353296\"}]}";
    NSDictionary *dic = [self dictionaryWithJsonString:json];

    return [DYVisitorModel objectArrayWithKeyValuesArray:[dic objectForKey:@"visitors"]];
}

- (NSArray *)my_tagArr {
    NSString *json = @"{\"my_tag\":[{\"profile_id\":\"17\",\"profile\":\"cuidiaodashi\",\"name\":\"垂钓大师\",\"value\":\"\",\"is_check\":0,\"font_color\":\"#ffffff\",\"bg_color\":\"#aaaaaa\"},{\"profile_id\":\"18\",\"profile\":\"diaoyuxiaobai\",\"name\":\"钓鱼小白\",\"value\":\"\",\"is_check\":0,\"font_color\":\"#ffffff\",\"bg_color\":\"#aaaaaa\"},{\"profile_id\":\"19\",\"profile\":\"baohuxuanshou\",\"name\":\"爆护选手\",\"value\":\"\",\"is_check\":0,\"font_color\":\"#ffffff\",\"bg_color\":\"#aaaaaa\"},{\"profile_id\":\"20\",\"profile\":\"kongjun\",\"name\":\"空军\",\"value\":\"\",\"is_check\":0,\"font_color\":\"#ffffff\",\"bg_color\":\"#aaaaaa\"}]}";
    NSDictionary *dic = [self dictionaryWithJsonString:json];
    return [DYEvaluateModel objectArrayWithKeyValuesArray:[dic objectForKey:@"my_tag"]];
}

- (void)setupView {
    NSArray *gdArr = @[
        @"海钓", @"台钓", @"野钓", @"矶钓", @"路亚", @"传统钓", @"竞技", @"筏"
                                                                                        @"钓",
        @"远投"
    ];

    DYGoodAtPickView *dygoodatPickView = [[DYGoodAtPickView alloc] initWithFrame:CGRectMake(16, 100, kScreenWidth, 0)];
    self.historyView = dygoodatPickView;
    dygoodatPickView.historyWordsArr = gdArr;
    [dygoodatPickView layoutIfNeeded];
    dygoodatPickView.delegate = self;
    [self.view addSubview:dygoodatPickView];
    NSLog(@"historyWordsView - %@", dygoodatPickView);


    NSArray *goodAtArr = [self good_atArr];
    DYGoodAtSliderView *goodAtView = [DYGoodAtSliderView new];
    goodAtView.frame = CGRectMake(0, dygoodatPickView.bottom + 12, kScreenWidth, 24);
    goodAtView.goodAtArr = goodAtArr;
    [self.view addSubview:goodAtView];

    //    DYVisitorModel *visitorA = [DYVisitorModel new];
    //    DYVisitorModel *visitorB = [DYVisitorModel new];
    //    DYVisitorModel *visitorC = [DYVisitorModel new];
    //    DYVisitorModel *visitorD = [DYVisitorModel new];
    //    DYVisitorModel *visitorE = [DYVisitorModel new];
    //    visitorA.img = @"http://p5.diaoyu123.com/group5/M00/45/DB/CgAAuFg6HDmAKIGgAAB7S78yo_c026.jpg";
    //    visitorB.img = @"http://p5.diaoyu123.com/group5/M00/45/DB/CgAAuFg6HDmAKIGgAAB7S78yo_c026.jpg";
    //    visitorC.img = @"http://p5.diaoyu123.com/group5/M00/45/DB/CgAAuFg6HDmAKIGgAAB7S78yo_c026.jpg";
    //    visitorD.img = @"http://p5.diaoyu123.com/group5/M00/45/DB/CgAAuFg6HDmAKIGgAAB7S78yo_c026.jpg";
    //    visitorE.img = @"http://p5.diaoyu123.com/group5/M00/45/DB/CgAAuFg6HDmAKIGgAAB7S78yo_c026.jpg";

    NSArray *visitorArr = [self visitorArr];
    //        @[ visitorA, visitorB, visitorC, visitorD, visitorE, visitorA, visitorB, visitorC, visitorD, visitorE ];

    DYVisitorSliderView *visitorView = [DYVisitorSliderView new];
    self.visitorView = visitorView;
    visitorView.dyDelegate = self;
    visitorView.frame = CGRectMake(0, goodAtView.bottom + 30, kScreenWidth, 54);
    visitorView.visitorsArr = visitorArr;
    [self.view addSubview:visitorView];
    NSArray *evaluateArr = [self my_tagArr];
    DYPersonEvaluateView *personview =
        [[DYPersonEvaluateView alloc] initWithFrame:CGRectMake(16, visitorView.bottom + 32, kScreenWidth - 32, 144)];
    personview.modelArr = evaluateArr;
    personview.backgroundColor = kColorOrange;

    [self.view addSubview:personview];
}

@end
