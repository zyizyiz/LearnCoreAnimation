//
//  ClockViewController.m
//  LearnCoreAnimation
//
//  Created by ios on 2019/1/12.
//  Copyright © 2019年 KN. All rights reserved.
//

#import "ClockViewController.h"

@interface ClockViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *ClockImageView;
@property (weak, nonatomic) IBOutlet UIImageView *HourHandImageView;
@property (weak, nonatomic) IBOutlet UIImageView *mimuteHandImageView;
@property (weak, nonatomic) IBOutlet UIImageView *secondHandImageView;

// 定时器
@property(nonatomic,weak)NSTimer *timer;
@end

@implementation ClockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.HourHandImageView.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.mimuteHandImageView.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    self.secondHandImageView.layer.anchorPoint = CGPointMake(0.5f, 0.9f);
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    [self tick];
}

- (void)tick {
    NSDate *nowDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = kCFCalendarUnitHour |  //小时
    kCFCalendarUnitMinute |  //分钟
    kCFCalendarUnitSecond;  // 秒
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:nowDate];
    
    CGFloat hoursAngle = (dateComponent.hour / 12.0) * M_PI * 2;
    CGFloat minuteAngle = (dateComponent.minute / 60.0) * M_PI * 2;
    CGFloat secondAngle = (dateComponent.second / 60.0) * M_PI * 2;
    
    self.HourHandImageView.transform = CGAffineTransformMakeRotation(hoursAngle);
    self.mimuteHandImageView.transform = CGAffineTransformMakeRotation(minuteAngle);
    self.secondHandImageView.transform = CGAffineTransformMakeRotation(secondAngle);
    
    
}

@end
