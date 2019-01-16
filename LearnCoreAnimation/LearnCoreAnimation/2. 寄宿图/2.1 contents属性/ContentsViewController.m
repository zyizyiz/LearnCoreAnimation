//
//  ContentsViewController.m
//  LearnCoreAnimation
//
//  Created by ios on 2019/1/16.
//  Copyright © 2019年 KN. All rights reserved.
//

/*
 CALayer 有一个属性叫做contents，这个属性的类型被定义为id，意味着它可以是任何类型的对象。在这种情况下，你可以给contents属性赋任何值，你的app仍然能够编译通过。但是，在实践中，如果你给contents赋的不是CGImage，那么你得到的图层将是空白的
 
        UIView             CALayer
    contentMode        contentsGravity
 contentScaleFactor     contentsScale
   clipsToBounds        masksToBounds
 */
#import "ContentsViewController.h"

@interface ContentsViewController ()

// layerView
@property(nonatomic,strong)UIView *layerView;
@end

@implementation ContentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _layerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    _layerView.center = self.view.center;
    [_layerView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:_layerView];
    
    
    UIImage *image = [UIImage imageNamed:@"tree"];
    _layerView.layer.contents = (__bridge id)image.CGImage;
    // kCAGravityResizeAspect，它的效果等同于UIViewContentModeScaleAspectFit
    // 同时它还能在图层中等比例拉伸以适应图层的边界。
    _layerView.layer.contentsGravity = kCAGravityResizeAspect;
//    _layerView.layer.contentsGravity = kCAGravityCenter;
//    // 处理在retina屏幕的显示
//    _layerView.layer.contentsScale = [UIScreen mainScreen].scale;
    // 做图片截取
    _layerView.layer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
    
}



@end
