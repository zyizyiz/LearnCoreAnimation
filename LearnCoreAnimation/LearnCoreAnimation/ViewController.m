//
//  ViewController.m
//  LearnCoreAnimation
//
//  Created by ios on 2019/1/16.
//  Copyright © 2019年 KN. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>

static NSString *cellIdentifier = @"vcCell";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

// tableView
@property(nonatomic,strong)UITableView *tableView;

// 控制器数组
@property(nonatomic,copy)NSArray *vcList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"iOS核心动画高级技巧";
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _vcList = @[
                @"UseLayerViewController",
                @"ContentsViewController",
                @"DrawViewController",
                @"AnchorPointViewController",
                @"CoordinateViewController",
                @"HitTestingViewController",
                @"FilletViewController"];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _vcList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellIdentifier];
    }
    [cell.textLabel setText:_vcList[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:false];
    
    id vc = [[NSClassFromString(_vcList[indexPath.row]) alloc]init];
    [self.navigationController pushViewController:vc animated:true];
}

@end
