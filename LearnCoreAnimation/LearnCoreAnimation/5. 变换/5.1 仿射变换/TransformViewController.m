//
//  TransformViewController.m
//  LearnCoreAnimation
//
//  Created by ios on 2019/1/17.
//  Copyright © 2019年 KN. All rights reserved.
//

#import "TransformViewController.h"

@interface TransformViewController ()

// layerView
@property(nonatomic,strong)UIView *layerView;
@end

@implementation TransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _layerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    _layerView.center = self.view.center;
    [_layerView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:_layerView];
    
    
    UIImage *image = [UIImage imageNamed:@"tree"];
    _layerView.layer.contents = (__bridge id)image.CGImage;
    _layerView.layer.contentsGravity = kCAGravityResizeAspect;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 这样子只会执行最后一行变换
//    _layerView.layer.affineTransform = CGAffineTransformMakeScale(0.5, 0.5);
//    _layerView.layer.affineTransform = CGAffineTransformMakeRotation(M_PI_2 / 180 * 30);
//    _layerView.layer.affineTransform = CGAffineTransformMakeTranslation(200, 0);
    static int i = 0;
    if (i % 2 == 0) {
        CGAffineTransform transform = CGAffineTransformIdentity;
        transform = CGAffineTransformScale(transform, 0.5, 0.5);
        transform = CGAffineTransformRotate(transform, M_PI / 180 * 30);
        transform = CGAffineTransformTranslate(transform, 200, 0);
        _layerView.layer.affineTransform = transform;
    }else {
        _layerView.layer.affineTransform = CGAffineTransformIdentity;
    }
    i++;
}


@end
