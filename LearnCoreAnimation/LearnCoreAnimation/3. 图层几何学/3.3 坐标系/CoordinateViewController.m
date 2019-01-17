//
//  CoordinateViewController.m
//  LearnCoreAnimation
//
//  Created by ios on 2019/1/17.
//  Copyright © 2019年 KN. All rights reserved.
//

#import "CoordinateViewController.h"

@interface CoordinateViewController ()

// 绿色图层
@property(nonatomic,strong)CALayer *greenLayer;

// 红色图层
@property(nonatomic,strong)CALayer *redLayer;

@end

@implementation CoordinateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _greenLayer = [CALayer layer];
    [_greenLayer setFrame:CGRectMake(100, 100, 200, 200)];
    [_greenLayer setBackgroundColor:[UIColor greenColor].CGColor];
    [self.view.layer addSublayer:_greenLayer];
    
    _redLayer = [CALayer layer];
    [_redLayer setFrame:CGRectMake(200, 200, 200, 200)];
    [_redLayer setBackgroundColor:[UIColor redColor].CGColor];
    [self.view.layer addSublayer:_redLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static int i = 0;
    if (i % 2 == 0) {
        _greenLayer.zPosition = 1.0f;
    }else {
        _greenLayer.zPosition = 0.0f;
    }
    i++;
}

@end
