//
//  ViewController.m
//  LearnCoreAnimation
//
//  Created by ios on 2019/1/12.
//  Copyright © 2019年 KN. All rights reserved.
//

/*
 记住当对图层做变换的时候，比如旋转或者缩放，frame实际上代表了覆盖在图层旋转之后的整个轴对齐的矩形区域，也就是说frame的宽高可能和bounds的宽高不再一致了
 
 mask : 根据图片轮廓切割，任何有图层构成的都可以作为mask属性，不仅仅是静态图
 */
#import "ViewController.h"

@interface ViewController ()<CALayerDelegate>

// layerView
@property(nonatomic,strong)UIView *layerView;

// blueLayer
@property(nonatomic,strong)CALayer *blueLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    _layerView = [[UIView alloc]init];
    _layerView.center = self.view.center;
    _layerView.bounds = CGRectMake(0, 0, 200, 200);
    [_layerView.layer setBackgroundColor:[UIColor whiteColor].CGColor];
    [self.view addSubview:_layerView];
    
    _blueLayer = [CALayer layer];
    _blueLayer.frame = CGRectMake(50, 50, 100, 100);
    [_blueLayer setBackgroundColor:[UIColor blueColor].CGColor];
    [_layerView.layer addSublayer:_blueLayer];
    // 双面绘制
    _layerView.layer.doubleSided = false;
    _blueLayer.delegate = self;
    // 如果想以Retina的质量来显示，就要这么设置（根据屏幕分辨率渲染）
    _blueLayer.contentsScale = [UIScreen mainScreen].scale;
    
    [_blueLayer display];
    
    // 绘制火柴人
    UIBezierPath *path = [[UIBezierPath alloc]init];
    [path moveToPoint:CGPointMake(175, 175)];
    // 圆
    [path addArcWithCenter:CGPointMake(150, 175) radius:25 startAngle:0 endAngle:2 * M_PI clockwise:true];
    // 身体
    [path moveToPoint:CGPointMake(150, 200)];
    [path addLineToPoint:CGPointMake(150, 250)];
    // 左脚
    [path addLineToPoint:CGPointMake(125, 300)];
    // 右脚
    [path moveToPoint:CGPointMake(150, 250)];
    [path addLineToPoint:CGPointMake(175, 300)];
    // 手
    [path moveToPoint:CGPointMake(100, 225)];
    [path addLineToPoint:CGPointMake(200, 225)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    
    [_layerView.layer addSublayer:shapeLayer];
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 150);
    [self.view.layer addSublayer:textLayer];
    
    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentJustified;
    // 包裹在bounds里面
    textLayer.wrapped = YES;
    
    UIFont *font = [UIFont systemFontOfSize:15.0f];
    
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    NSString *text = @"🆚 ipsum dolor sit amet, consectetur adipiscing \ elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar \ leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel \ fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet \ lobortis";
    textLayer.string = text;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    
//    UIImage *snowImg = [UIImage imageNamed:@"Snowman"];
//    self.layerView.layer.contents = (__bridge id)snowImg.CGImage;
////    self.layerView.layer.contentsGravity = kCAGravityResizeAspect;
//    self.layerView.layer.contentsGravity = kCAGravityCenter;
//    self.layerView.layer.contentsScale = snowImg.scale;
//    self.layerView.layer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
    
}

// 如果没有自定义绘制的任务就不要在子类中写一个空的-drawRect:方法。会造成CPU资源和内存的浪费
-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    // 设置画笔的宽度
    CGContextSetLineWidth(ctx, 10.0f);
    // 设置画笔的颜色
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    // 设置画笔的形状
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static int num = 1;
    if (num % 2 != 0) {
        // 按照Y轴旋转
        [CATransaction begin];
        [CATransaction setAnimationDuration:1.0f];
        CATransform3D transform = CATransform3DIdentity;
        transform.m34 = -1.0/500.0;
        transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
        _layerView.layer.transform = transform;
        CATransform3D untransform = CATransform3DIdentity;
        untransform.m34 = -1.0/500.0;
        untransform = CATransform3DRotate(untransform, -M_PI_4, 0, 1, 0);
        _blueLayer.transform = untransform;
        [CATransaction commit];
    }else {
        [CATransaction begin];
        [CATransaction setAnimationDuration:1.0f];
        _layerView.layer.transform = CATransform3DIdentity;
        _blueLayer.transform = CATransform3DIdentity;
        [CATransaction commit];
    }
    num++;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end






















