//
//  FilletViewController.m
//  LearnCoreAnimation
//
//  Created by ios on 2019/1/17.
//  Copyright © 2019年 KN. All rights reserved.
//

#import "FilletViewController.h"

@interface FilletViewController ()

@end

@implementation FilletViewController

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
    
    [topLayer setCornerRadius:20.0f];
    [bottomLayer setCornerRadius:20.0f];
    
    [topLayer setMasksToBounds:true];
}


@end
