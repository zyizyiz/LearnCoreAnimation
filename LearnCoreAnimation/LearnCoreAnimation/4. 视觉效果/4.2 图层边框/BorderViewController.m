//
//  BorderViewController.m
//  LearnCoreAnimation
//
//  Created by ios on 2019/1/17.
//  Copyright © 2019年 KN. All rights reserved.
//

/*
 边框是跟随图层的边界变化的，而不是图层里面的内容
 */
#import "BorderViewController.h"

@interface BorderViewController ()

@end

@implementation BorderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *topLayer = [CALayer layer];
    [topLayer setFrame:CGRectMake(100, 100, 200, 200)];
    [topLayer setBackgroundColor:[UIColor grayColor].CGColor];
    [self.view.layer addSublayer:topLayer];
    
    CALayer *bottomLayer = [CALayer layer];
    [bottomLayer setFrame:CGRectMake(100, 400, 200, 200)];
    [bottomLayer setBackgroundColor:[UIColor grayColor].CGColor];
    [self.view.layer addSublayer:bottomLayer];
    
    CALayer *topRedLayer = [CALayer layer];
    [topRedLayer setFrame:CGRectMake(0, 0, 100, 100)];
    [topRedLayer setBackgroundColor:[UIColor redColor].CGColor];
    [topLayer addSublayer:topRedLayer];
    
    CALayer *bottomRedLayer = [CALayer layer];
    [bottomRedLayer setFrame:CGRectMake(-50, -50, 100, 100)];
    [bottomRedLayer setBackgroundColor:[UIColor redColor].CGColor];
    [bottomLayer addSublayer:bottomRedLayer];
    
    CALayer *borderLayer = [CALayer layer];
    [borderLayer setFrame:CGRectMake(100, 650, 100, 100)];
    borderLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"border"].CGImage);
    borderLayer.contentsGravity = kCAGravityCenter;
    [self.view.layer addSublayer:borderLayer];
    
    
    [topLayer setCornerRadius:20.0f];
    [bottomLayer setCornerRadius:20.0f];
    
    [topLayer setBorderWidth:5.0f];
    [bottomLayer setBorderWidth:5.0f];
    [borderLayer setBorderWidth:5.0f];
    
    [topLayer setMasksToBounds:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
