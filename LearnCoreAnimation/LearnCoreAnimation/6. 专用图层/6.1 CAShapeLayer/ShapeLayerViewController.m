//
//  ShapeLayerViewController.m
//  LearnCoreAnimation
//
//  Created by ios on 2019/1/21.
//  Copyright © 2019年 KN. All rights reserved.
//

#import "ShapeLayerViewController.h"

@interface ShapeLayerViewController ()

// 灰色图层
@property(nonatomic,strong)CALayer *grayLayer;

@end

@implementation ShapeLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _grayLayer = [CALayer layer];
    [_grayLayer setFrame:(CGRectMake(0, 0, 200, 200))];
    [_grayLayer setPosition:self.view.center];
    [_grayLayer setBackgroundColor:[UIColor grayColor].CGColor];
    [self.view.layer addSublayer:_grayLayer];
    
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    // 起点
    [path moveToPoint:CGPointMake(175, 100)];
    // 画圆
    [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2 * M_PI clockwise:true];
    // 起点
    [path moveToPoint:CGPointMake(150, 125)];
    // 从起点开始画直线
    [path addLineToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(125, 225)];
    [path moveToPoint:CGPointMake(150, 175)];
    [path addLineToPoint:CGPointMake(175, 225)];
    [path moveToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(200, 150)];

    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setPath:path.CGPath];
    // 线的宽度
    [shapeLayer setLineWidth:5.0f];
    // 线的颜色
    [shapeLayer setStrokeColor:[UIColor redColor].CGColor];
    // 填充的颜色
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    // 折线的样式
    [shapeLayer setLineJoin:kCALineJoinRound];
    [shapeLayer setLineCap:kCALineCapRound];
    
    [_grayLayer addSublayer:shapeLayer];
    
    // 一个直角，三个圆角
    CGRect rect = CGRectMake(50, 50, 100, 100);
    CGSize radii = CGSizeMake(20, 20);
    UIRectCorner corners = UIRectCornerTopRight | UIRectCornerBottomRight | UIRectCornerBottomLeft;
    //create path
    UIBezierPath *customPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:radii];
    CAShapeLayer *customShaperLayer = [CAShapeLayer layer];
    [customShaperLayer setPath:customPath.CGPath];
    [customShaperLayer setStrokeColor:[UIColor greenColor].CGColor];
    [customShaperLayer setFillColor:[UIColor clearColor].CGColor];
    [customShaperLayer setLineCap:kCALineCapRound];
    [customShaperLayer setLineJoin:kCALineJoinRound];
    [_grayLayer addSublayer:customShaperLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
