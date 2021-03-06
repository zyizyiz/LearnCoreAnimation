//
//  DrawViewController.m
//  LearnCoreAnimation
//
//  Created by ios on 2019/1/16.
//  Copyright © 2019年 KN. All rights reserved.
//

/*
 尽管我们没有用masksToBounds属性，绘制的那个圆仍然沿边界被裁剪了。这是因为当你使用CALayerDelegate绘制寄宿图的时候，并没有对超出边界外的内容提供绘制支持
 
 */
#import "DrawViewController.h"

@interface DrawViewController ()<CALayerDelegate>
// layerView
@property(nonatomic,strong)UIView *layerView;

// 蓝色图层
@property(nonatomic,strong)CALayer *blueLayer;
@end

@implementation DrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _layerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    _layerView.center = self.view.center;
    [_layerView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:_layerView];

    _blueLayer = [CALayer layer];
    [_blueLayer setFrame:CGRectMake(50, 50, 100, 100)];
    [_blueLayer setBackgroundColor:[UIColor blueColor].CGColor];
    // [DrawViewController isKindOfClass:]: message sent to deallocated instance
    // 由于代理有延时方法，造成野指针异常
    _blueLayer.delegate = self;
    _blueLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.layerView.layer addSublayer:_blueLayer];
    [_blueLayer display];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGContextSetLineWidth(ctx, 10);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}

- (void)dealloc {
    _blueLayer.delegate = nil;
    NSLog(@"wwww");
}

@end
