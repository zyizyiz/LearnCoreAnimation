//
//  AlphaViewController.m
//  LearnCoreAnimation
//
//  Created by ios on 2019/1/17.
//  Copyright © 2019年 KN. All rights reserved.
//

#import "AlphaViewController.h"

@interface AlphaViewController ()

@end

@implementation AlphaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button1 = [self customButton];
    button1.center = CGPointMake(50, 150);
    [self.view addSubview:button1];
    
    
    UIButton *button2 = [self customButton];
    button2.center = CGPointMake(250, 150);
    [self.view addSubview:button2];
    [button2 setAlpha:0.5f];
    
    // 没区别
    [button2.layer setShouldRasterize:true];
    
}

- (UIButton *)customButton {
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 150, 50)];
    [button setBackgroundColor:[UIColor greenColor]];
    [button.layer setCornerRadius:10.0f];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 110, 30)];
    [label setText:@"Hello World"];
    [label setTextAlignment:(NSTextAlignmentCenter)];
    [label setFont:[UIFont systemFontOfSize:16.0]];
    [label setTextColor:[UIColor blackColor]];
    [label setBackgroundColor:[UIColor greenColor]];
    [button addSubview:label];
    return button;
}

@end
