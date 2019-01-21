//
//  ContainerViewController.m
//  LearnCoreAnimation
//
//  Created by ios on 2019/1/21.
//  Copyright © 2019年 KN. All rights reserved.
//

#import "ContainerViewController.h"
#import <GLKit/GLKit.h>

#define LIGHT_DIRECTION 0, 1, -0.5
#define AMBIENT_LIGHT 0.5
@interface ContainerViewController ()

// 容器对象
@property(nonatomic,strong)UIView *containerView;

// 数组
@property(nonatomic,copy)NSMutableArray *faceList;

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _faceList = [[NSMutableArray alloc]init];
    [UIColor redColor];
    NSArray *colorList = @[
                           [UIColor redColor],
                           [UIColor greenColor],
                           [UIColor blueColor],
                           [UIColor lightGrayColor],
                           [UIColor orangeColor],
                           [UIColor yellowColor]
                           ];
    
    _containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    [_containerView setCenter:self.view.center];
    [_containerView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:_containerView];
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500.0f;
    
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
    // sublayerTransform子类都继承该方法
    _containerView.layer.sublayerTransform = perspective;
    
    for (int i = 0; i < 6; i ++) {
        [self createFaceViewForBounds:CGRectMake(0, 0, 100, 100) setNum:[NSString stringWithFormat:@"%i",i + 1] setNumColor:colorList[i]];
    }
    
    //add cube face 1
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 50);
    [self addFace:0 withTransform:transform];
    //add cube face 2
    transform = CATransform3DMakeTranslation(50, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    [self addFace:1 withTransform:transform];
    //add cube face 3
    transform = CATransform3DMakeTranslation(0, -50, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    [self addFace:2 withTransform:transform];
    //add cube face 4
    transform = CATransform3DMakeTranslation(0, 50, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
    [self addFace:3 withTransform:transform];
    //add cube face 5
    transform = CATransform3DMakeTranslation(-50, 0, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
    [self addFace:4 withTransform:transform];
    //add cube face 6
    transform = CATransform3DMakeTranslation(0, 0, -50);
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    [self addFace:5 withTransform:transform];
}

- (void)applyLightingToFace:(CALayer *)face
{
    //add lighting layer
    CALayer *layer = [CALayer layer];
    layer.frame = face.bounds;
    [face addSublayer:layer];
    //convert the face transform to matrix
    //(GLKMatrix4 has the same structure as CATransform3D)
    //译者注：GLKMatrix4和CATransform3D内存结构一致，但坐标类型有长度区别，所以理论上应该做一次float到CGFloat的转换，感谢[@zihuyishi](https://github.com/zihuyishi)同学~
    CATransform3D transform = face.transform;
    GLKMatrix4 matrix4 = *(GLKMatrix4 *)&transform;
    GLKMatrix3 matrix3 = GLKMatrix4GetMatrix3(matrix4);
    //get face normal
    GLKVector3 normal = GLKVector3Make(0, 0, 1);
    normal = GLKMatrix3MultiplyVector3(matrix3, normal);
    normal = GLKVector3Normalize(normal);
    //get dot product with light direction
    GLKVector3 light = GLKVector3Normalize(GLKVector3Make(LIGHT_DIRECTION));
    float dotProduct = GLKVector3DotProduct(light, normal);
    //set lighting layer opacity
    CGFloat shadow = 1 + dotProduct - AMBIENT_LIGHT;
    UIColor *color = [UIColor colorWithWhite:0 alpha:shadow];
    layer.backgroundColor = color.CGColor;
}

- (void)addFace:(NSInteger)index withTransform:(CATransform3D)transform
{
    UIView *face = self.faceList[index];
    [self.containerView addSubview:face];
    CGSize containerSize = self.containerView.bounds.size;
    face.center = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);
    face.layer.transform = transform;
    
    [self applyLightingToFace:face.layer];
}

- (void)createFaceViewForBounds:(CGRect) bounds setNum:(NSString*) num setNumColor:(UIColor*) color {
    UIView *face = [[UIView alloc]init];
    [face setBackgroundColor:[UIColor whiteColor]];
    [face setBounds:bounds];
    
    UILabel *label = [[UILabel alloc]init];
    [label setFrame:CGRectMake(0, 0, 100, 100)];
    [label setCenter:CGPointMake(face.bounds.size.width / 2, face.bounds.size.height / 2)];
    [label setTextColor:color];
    [label setTextAlignment:(NSTextAlignmentCenter)];
    [label setFont:[UIFont systemFontOfSize:24.0f]];
    [label setText:num];
    [face addSubview:label];
    
    [_faceList addObject:face];
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
