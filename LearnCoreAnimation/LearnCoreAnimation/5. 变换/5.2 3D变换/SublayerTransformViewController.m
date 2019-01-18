//
//  SublayerTransformViewController.m
//  LearnCoreAnimation
//
//  Created by ios on 2019/1/17.
//  Copyright © 2019年 KN. All rights reserved.
//

#import "SublayerTransformViewController.h"

@interface SublayerTransformViewController ()

// layerView
@property(nonatomic,strong)UIView *layerView;

// 左边图层
@property(nonatomic,strong)CALayer *leftLayer;

// 右边图层
@property(nonatomic,strong)CALayer *rightLayer;
@end

@implementation SublayerTransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _layerView = [[UIView alloc]initWithFrame:CGRectMake(0, 300, 400, 200)];
    [_layerView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:_layerView];
    
    _leftLayer = [CALayer layer];
    [_leftLayer setFrame:CGRectMake(50, 50, 100, 100)];
    UIImage *image = [UIImage imageNamed:@"tree"];
    _leftLayer.contents = (__bridge id)image.CGImage;
    _leftLayer.contentsGravity = kCAGravityResizeAspect;
    [_layerView.layer addSublayer:_leftLayer];
    
    _rightLayer = [CALayer layer];
    [_rightLayer setFrame:CGRectMake(250, 50, 100, 100)];
    _rightLayer.contents = (__bridge id)image.CGImage;
    _rightLayer.contentsGravity = kCAGravityResizeAspect;
    [_layerView.layer addSublayer:_rightLayer];
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500.0;
    [_layerView.layer setSublayerTransform:perspective];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static int i = 0;
    if (i % 2 == 0) {
        _leftLayer.transform = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
        _rightLayer.transform = CATransform3DMakeRotation(-M_PI_4, 0, 1, 0);
    }else {
        _leftLayer.transform = CATransform3DIdentity;
        _rightLayer.transform = CATransform3DIdentity;
    }
    i++;
}

@end
