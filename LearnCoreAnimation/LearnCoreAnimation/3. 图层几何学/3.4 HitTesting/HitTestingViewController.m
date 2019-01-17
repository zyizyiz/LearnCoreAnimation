//
//  HitTestingViewController.m
//  LearnCoreAnimation
//
//  Created by ios on 2019/1/17.
//  Copyright © 2019年 KN. All rights reserved.
//

#import "HitTestingViewController.h"

@interface HitTestingViewController ()

// layerView
@property(nonatomic,strong)UIView *layerView;

// 蓝色图层
@property(nonatomic,copy)CALayer *blueLayer;
@end

@implementation HitTestingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _layerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    _layerView.center = self.view.center;
    [_layerView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:_layerView];
    
    _blueLayer = [CALayer layer];
    [_blueLayer setFrame:CGRectMake(50, 50, 100, 100)];
    [_blueLayer setBackgroundColor:[UIColor blueColor].CGColor];
    [self.layerView.layer addSublayer:_blueLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self.view];
    point = [self.layerView.layer convertPoint:point fromLayer:self.view.layer];
    if ([self.layerView.layer containsPoint:point]) {
        point = [self.blueLayer convertPoint:point fromLayer:self.layerView.layer];
        if ([self.blueLayer containsPoint:point]) {
            NSLog(@"Inside Blue Layer");
        }else {
            NSLog(@"Inside Gray Layer");
        }
    }
}

@end
