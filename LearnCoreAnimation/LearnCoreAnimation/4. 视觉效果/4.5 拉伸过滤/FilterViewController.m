//
//  FilterViewController.m
//  LearnCoreAnimation
//
//  Created by ios on 2019/1/17.
//  Copyright © 2019年 KN. All rights reserved.
//

#import "FilterViewController.h"

@interface FilterViewController ()

// 视图数组
@property(nonatomic,copy)NSMutableArray *digitLayers;

// 定时器
@property(nonatomic,weak)NSTimer *timer;

@end

@implementation FilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _digitLayers = [[NSMutableArray alloc]init];
    UIImage *digits = [UIImage imageNamed:@"num"];
    
    for (int i = 0; i < 6; i++) {
        CALayer *layer = [CALayer layer];
        [layer setFrame:CGRectMake(10 + 50 * i, 200, 50, 50)];
        [layer setContents:(__bridge id)digits.CGImage];
        [layer setContentsRect:CGRectMake(0, 0, 0.1f, 1.0f)];
        [layer setContentsGravity:kCAGravityResizeAspect];
        // 暂时觉得加不加没区别
        layer.magnificationFilter = kCAFilterNearest;
        [self.view.layer addSublayer:layer];
        [_digitLayers addObject:layer];
    }
    
    [self tick];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:true];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_timer invalidate];
}

- (void)tick {
    NSDate *nowDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:unit fromDate:nowDate];
    [self setDigit:[components hour] / 10 forLayer:_digitLayers[0]];
    [self setDigit:[components hour] % 10 forLayer:_digitLayers[1]];
    [self setDigit:[components minute] / 10 forLayer:_digitLayers[2]];
    [self setDigit:[components minute] % 10 forLayer:_digitLayers[3]];
    [self setDigit:[components second] / 10 forLayer:_digitLayers[4]];
    [self setDigit:[components second] % 10 forLayer:_digitLayers[5]];
}

- (void)setDigit:(NSInteger)digit forLayer:(CALayer*)layer {
    [layer setContentsRect:CGRectMake(0.1 * digit, 0, 0.1f, 1.0f)];
}



@end
