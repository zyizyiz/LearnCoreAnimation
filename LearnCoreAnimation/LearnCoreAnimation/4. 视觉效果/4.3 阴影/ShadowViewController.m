//
//  ShadowViewController.m
//  LearnCoreAnimation
//
//  Created by ios on 2019/1/17.
//  Copyright © 2019年 KN. All rights reserved.
//

/*
 图层的阴影继承自内容的外形，而不是根据边界和角半径来确定
 maskToBounds 会裁剪掉阴影
 解决方案： 根据阴影继承自内容的外形这一特征，可在需要加阴影的图层外添加一个图层，在最外部图层添加阴影。
 */
#import "ShadowViewController.h"

@interface ShadowViewController ()

@end

@implementation ShadowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    CALayer *shadowLayer = [CALayer layer];
    [shadowLayer setFrame:CGRectMake(100, 100, 200, 200)];
    [shadowLayer setBackgroundColor:[UIColor clearColor].CGColor];
    [self.view.layer addSublayer:shadowLayer];
    
    CALayer *topLayer = [CALayer layer];
    [topLayer setFrame:CGRectMake(0, 0, 200, 200)];
    [topLayer setBackgroundColor:[UIColor grayColor].CGColor];
    [shadowLayer addSublayer:topLayer];
    
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
    
    [shadowLayer setShadowOpacity:0.5f];
    [shadowLayer setShadowRadius:5.0f];
    [shadowLayer setShadowOffset:CGSizeMake(0, 5.0f)];
    
    [bottomLayer setShadowOffset:CGSizeMake(0, 5.0f)];
    [bottomLayer setShadowRadius:5.0f];
    [bottomLayer setShadowOpacity:0.5f];
    
    [borderLayer setShadowOffset:CGSizeMake(0, 5.0f)];
    [borderLayer setShadowRadius:5.0f];
    [borderLayer setShadowOpacity:0.5f];
    // 设置独立于图层内容的阴影形状
    //  如果是一个矩形或者是圆，用CGPath会相当简单明了。但是如果是更加复杂一点的图形，UIBezierPath类会更合适，它是一个由UIKit提供的在CGPath基础上的Objective-C包装类。
    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(circlePath, NULL, borderLayer.bounds);
    [borderLayer setShadowPath:circlePath];
    CGPathRelease(circlePath);
    
    [topLayer setMasksToBounds:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
