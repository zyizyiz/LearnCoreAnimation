//
//  RotateViewController.m
//  LearnCoreAnimation
//
//  Created by ios on 2019/1/21.
//  Copyright © 2019年 KN. All rights reserved.
//

#import "RotateViewController.h"

@interface RotateViewController ()

// 灰色图层
@property(nonatomic,strong)CALayer *grayLayer;

// 白色图层
@property(nonatomic,strong)CALayer *whiteLayer;

@end

@implementation RotateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _grayLayer = [CALayer layer];
    [_grayLayer setBackgroundColor:[UIColor grayColor].CGColor];
    [_grayLayer setFrame:CGRectMake(0, 0, 200, 200)];
    [_grayLayer setPosition:self.view.center];
    [self.view.layer addSublayer:_grayLayer];
    
    _whiteLayer = [CALayer layer];
    [_whiteLayer setFrame:CGRectMake(0, 0, 100, 100)];
    [_whiteLayer setBackgroundColor:[UIColor whiteColor].CGColor];
    [_whiteLayer setPosition:CGPointMake(_grayLayer.bounds.size.width / 2, _grayLayer.bounds.size.height / 2)];
    [_grayLayer addSublayer:_whiteLayer];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CATransform3D outer = CATransform3DIdentity;
    outer.m34 = -1.0 / 500.0f;
    outer = CATransform3DRotate(outer, M_PI_4, 0, 1, 0);
    _grayLayer.transform = outer;
    
    CATransform3D inner = CATransform3DIdentity;
    inner.m34 = -1.0 / 500.0f;
    inner = CATransform3DRotate(inner, -M_PI_4, 0, 1, 0);
    _whiteLayer.transform = inner;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
