//
//  MaskViewController.m
//  LearnCoreAnimation
//
//  Created by ios on 2019/1/17.
//  Copyright © 2019年 KN. All rights reserved.
//

/*
 CALayer蒙板图层真正厉害的地方在于蒙板图不局限于静态图。任何有图层构成的都可以作为mask属性，这意味着蒙板可以通过代码甚至是动画实时生成。
 */
#import "MaskViewController.h"

@interface MaskViewController ()

// 寄宿图
@property(nonatomic,strong)CALayer *imageLayer;

// Mask蒙版图层
@property(nonatomic,strong)CALayer *maskLayer;

@end

@implementation MaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageLayer = [CALayer layer];
    [_imageLayer setFrame:CGRectMake(100, 100, 200, 200)];
    [_imageLayer setContents:(__bridge id)[UIImage imageNamed:@"tree"].CGImage];
    [self.view.layer addSublayer:_imageLayer];
    
    _maskLayer = [CALayer layer];
    [_maskLayer setFrame:_imageLayer.bounds];
    [_maskLayer setContents:(__bridge id)[UIImage imageNamed:@"border"].CGImage];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static int i = 0;
    
    if (i % 2 == 0) {
        [_imageLayer setMask:_maskLayer];
    }else {
        [_imageLayer setMask:nil];
    }
    i++;
}


@end
