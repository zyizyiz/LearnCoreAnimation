//
//  UseLayerViewController.m
//  LearnCoreAnimation
//
//  Created by ios on 2019/1/16.
//  Copyright © 2019年 KN. All rights reserved.
//

/*
 UIView和CALayer是平行的层级关系。原因是要做职责分离，避免很多重复的代码。这体现了设计模式中的单一职责原则。
 
 */
#import "UseLayerViewController.h"

@interface UseLayerViewController ()

// layerView
@property(nonatomic,strong)UIView *layerView;
@end

@implementation UseLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _layerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    _layerView.center = self.view.center;
    [_layerView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:_layerView];
    
    CALayer *blueLayer = [CALayer layer];
    [blueLayer setFrame:CGRectMake(50, 50, 100, 100)];
    [blueLayer setBackgroundColor:[UIColor blueColor].CGColor];
    [self.layerView.layer addSublayer:blueLayer];
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
