//
//  CATextLayerViewController.m
//  LearnCoreAnimation
//
//  Created by ios on 2019/1/21.
//  Copyright © 2019年 KN. All rights reserved.
//

#import "CATextLayerViewController.h"
#import "LayerLabel.h"

@interface CATextLayerViewController ()

// 文本
@property(nonatomic,strong)CATextLayer *textLayer;
@end

@implementation CATextLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _textLayer = [CATextLayer layer];
    [_textLayer setBounds:CGRectMake(0, 0, 200, 200)];
    [_textLayer setPosition:self.view.center];
    
    [self.view.layer addSublayer:_textLayer];
    // 显示的颜色
    _textLayer.foregroundColor = [UIColor blackColor].CGColor;
    [_textLayer setAlignmentMode:kCAAlignmentCenter];
    _textLayer.wrapped = true;
    
    UIFont *font = [UIFont systemFontOfSize:15];
    // Core Foundation框架需要手动释放
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    _textLayer.font = fontRef;
    _textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing \t elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar \t leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc elementum, libero ut porttitor dictum, diam odio congue lacus, vel \t fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet \t lobortis";
    _textLayer.string = text;
    
    _textLayer.contentsScale = [UIScreen mainScreen].scale;
    
    LayerLabel *layerLabel = [[LayerLabel alloc]initWithFrame:CGRectMake(300, 300, 100, 100)];
    [layerLabel setText:@"123456"];
    [self.view addSubview:layerLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
