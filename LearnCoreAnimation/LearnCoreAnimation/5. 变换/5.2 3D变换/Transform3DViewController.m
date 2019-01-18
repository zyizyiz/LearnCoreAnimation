//
//  Tranform3DViewController.m
//  LearnCoreAnimation
//
//  Created by ios on 2019/1/17.
//  Copyright © 2019年 KN. All rights reserved.
//

#import "Transform3DViewController.h"

@interface Transform3DViewController ()

// layerView
@property(nonatomic,strong)UIView *layerView;
@end

@implementation Transform3DViewController

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
    static int i = 0;
    if (i % 2 == 0) {
        CATransform3D transform = CATransform3DIdentity;
        // *** 注意 : m34调用要在最前面，要不然无效
        // m34为-1.0 / d来应用透视效果。通常500-1000就已经很好了，但对于特定的图层有时候更小后者更大的值会看起来更舒服，减少距离的值会增强透视效果
        transform.m34 = - 1.0 / 500.0;
        transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
        _layerView.layer.transform = transform;
    }else {
        _layerView.layer.affineTransform = CGAffineTransformIdentity;
    }
    i++;
}
@end
