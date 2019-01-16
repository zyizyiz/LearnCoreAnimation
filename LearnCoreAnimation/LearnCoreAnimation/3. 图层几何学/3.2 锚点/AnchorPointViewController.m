//
//  AnchorPointViewController.m
//  LearnCoreAnimation
//
//  Created by ios on 2019/1/16.
//  Copyright © 2019年 KN. All rights reserved.
//

#import "AnchorPointViewController.h"

@interface AnchorPointViewController ()

// 钟盘
@property(nonatomic,strong)CALayer *clock;

// 时钟
@property(nonatomic,strong)CALayer *hourHand;

// 分钟
@property(nonatomic,strong)CALayer *minuteHand;

// 秒钟
@property(nonatomic,strong)CALayer *secondHand;

// 定时器 ** 注意需要销毁，要不然退出界面后还在运行
@property(nonatomic,weak)NSTimer *timer;
@end

@implementation AnchorPointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self setAnchorPoint];
    [self tick];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [_timer invalidate];
}

- (void)tick {
    NSDate *nowDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger flags = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:flags fromDate:nowDate];
    CGFloat hourAngle = ([dateComponent hour] / 12.0f) * M_PI * 2.0f;
    CGFloat minuteAngle = ([dateComponent minute] / 60.0f) * M_PI * 2.0f;
    CGFloat secondAngle = ([dateComponent second] / 60.0f) * M_PI * 2.0f;
    
    _hourHand.transform = CATransform3DMakeRotation(hourAngle, 0, 0, 1);
    _minuteHand.transform = CATransform3DMakeRotation(minuteAngle, 0, 0, 1);
    _secondHand.transform = CATransform3DMakeRotation(secondAngle, 0, 0, 1);
    NSLog(@"timer ++");
}

- (void)setAnchorPoint {
    _hourHand.anchorPoint = CGPointMake(0.5, 0.9);
    _minuteHand.anchorPoint = CGPointMake(0.5, 0.9);
    _secondHand.anchorPoint = CGPointMake(0.5, 0.9);
}

- (void)setUI {
    
    _clock = [CALayer layer];
    _clock.contents = (__bridge id _Nullable)([UIImage imageNamed:@"clock"].CGImage);
    [_clock setFrame:CGRectMake(0, 0, 200, 200)];
    [_clock setPosition:self.view.center];
    [self.view.layer addSublayer:_clock];
    
    _hourHand = [CALayer layer];
    _hourHand.contents = (__bridge id _Nullable)([UIImage imageNamed:@"hour"].CGImage);
    [_hourHand setFrame:CGRectMake(0, 0, 30, 60)];
    [_hourHand setPosition:self.view.center];
    [self.view.layer addSublayer:_hourHand];
    
    _minuteHand = [CALayer layer];
    _minuteHand.contents = (__bridge id _Nullable)([UIImage imageNamed:@"minute"].CGImage);
    [_minuteHand setFrame:CGRectMake(0, 0, 20, 75)];
    [_minuteHand setPosition:self.view.center];
    [self.view.layer addSublayer:_minuteHand];
    
    
    _secondHand = [CALayer layer];
    _secondHand.contents = (__bridge id _Nullable)([UIImage imageNamed:@"second"].CGImage);
    [_secondHand setFrame:CGRectMake(0, 0, 10, 90)];
    [_secondHand setPosition:self.view.center];
    [self.view.layer addSublayer:_secondHand];
}


- (void)dealloc {
    NSLog(@"AnchorPointViewController dealloc");
}


@end
