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
#import "NSObject+JsonDicExchange.h"

@interface ViewController ()<DYGoodAtPickViewDelegate, DYVisitorSliderViewDelegate>
@property(nonatomic, strong) DYGoodAtPickView *historyView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

#pragma mark - HistoryWordsViewDelegate
- (void)historyWordHasBeenClicked:(NSString *)keyWord {
    NSLog(@"keyWord -- %@", keyWord);
}
- (void)visitorSliderViewClickedAvatat:(DYVisitorModel *)visitorModel {
    NSLog(@"%@", visitorModel);
}
- (void)goodAtPickViewDidEndSelected:(NSArray *)goodAtArr {
    NSLog(@"keyWord -- %@", goodAtArr);
}

- (NSArray *)visitorArr {
    NSString *json = @"{\"visitors\":[{\"title\":\"cumulus\",\"img\":\"http:\\/\\/static.diaoyu123.com\\/app\\/"
                     @"default\\/img\\/"
                     @"default_avatar.png\",\"target\":\"user\",\"target_val\":9359124},{\"title\":\"stratus\","
                     @"\"img\":\"http:\\/\\/static.diaoyu123.com\\/app\\/default\\/img\\/"
                     @"default_avatar.png\",\"target\":\"user\",\"target_val\":9359123}]}";
    NSDictionary *dic = [self dictionaryWithJsonString:json];

    return [DYVisitorModel objectArrayWithKeyValuesArray:[dic objectForKey:@"visitors"]];
}

- (NSArray *)my_tagArr {
    NSString *json = @"{\"my_tag\":[{\"profile_id\":\"17\",\"profile\":\"cuidiaodashi\",\"name\":\"垂钓大师\","
                     @"\"value\":\"\",\"is_check\":0,\"font_color\":\"#fff\",\"bg_color\":\"#aaa\"},{\"profile_id\":"
                     @"\"18\",\"profile\":\"diaoyuxiaobai\",\"name\":\"钓鱼小白\",\"value\":\"\",\"is_check\":0,"
                     @"\"font_color\":\"#fff\",\"bg_color\":\"#aaa\"},{\"profile_id\":\"19\",\"profile\":"
                     @"\"baohuxuanshou\",\"name\":\"爆护选手\",\"value\":\"\",\"is_check\":0,\"font_color\":\"#fff\","
                     @"\"bg_color\":\"#aaa\"},{\"profile_id\":\"20\",\"profile\":\"kongjun\",\"name\":\"空军\","
                     @"\"value\":\"\",\"is_check\":0,\"font_color\":\"#fff\",\"bg_color\":\"#aaa\"}]}";
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

    NSArray *goodATArr = @[ @"海钓", @"台钓", @"传统钓", @"海钓", @"台钓", @"野钓" ];

    DYGoodAtSlideView *goodAtView = [DYGoodAtSlideView new];
    goodAtView.frame = CGRectMake(0, dygoodatPickView.bottom + 12, kScreenWidth, 24);
    goodAtView.goodAt = goodATArr;
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
    visitorView.delegate = self;
    visitorView.frame = CGRectMake(0, goodAtView.bottom + 30, kScreenWidth, 54);
    visitorView.visitorsArr = visitorArr;
    [self.view addSubview:visitorView];

    NSArray *evaluateArr = [self my_tagArr];
    //  @[
    //        @"垂钓大师", @"钓鱼小白", @"爆护选手", @"钓鱼狂", @"野钓空军", @"垂"
    //                                                                                          @"钓大"
    //                                                                                          @"师"
    //    ];
    NSMutableArray *evalutorModelArr = [NSMutableArray array];
    for (NSString *str in evaluateArr) {
        DYEvaluateModel *model = [DYEvaluateModel new];
        model.name = str;
        model.color = kRandomColor;
        model.value = [NSString stringWithFormat:@"%d", arc4random() % 1000];
        [evalutorModelArr addObject:model];
    }

    DYPersonEvaluateView *personview =
        [[DYPersonEvaluateView alloc] initWithFrame:CGRectMake(16, visitorView.bottom + 32, kScreenWidth - 32, 144)];
    personview.modelArr = evaluateArr;
    [self.view addSubview:personview];
}

@end
