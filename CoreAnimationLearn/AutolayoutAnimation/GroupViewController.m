//
//  GroupViewController.m
//  AutolayoutAnimation
//
//  Created by 陈诚 on 15/12/9.
//  Copyright © 2015年 陈诚. All rights reserved.
//

#import "GroupViewController.h"

@interface GroupViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation GroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   }

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //平移旋转缩放
    
    //创建对象
    CAAnimationGroup *group = [CAAnimationGroup animation];
    //往里面填加多个动画
    
    //1.平移
    CABasicAnimation *positionAni = [CABasicAnimation animation];
    positionAni.keyPath = @"position";
    positionAni.toValue = [NSValue valueWithCGPoint:CGPointMake(250, 250)];
    
    //2.旋转
    CABasicAnimation *rotationAni = [CABasicAnimation animation];
    rotationAni.keyPath = @"transform.rotation";
    rotationAni.toValue = @(M_PI_2);
    
    //3.缩放
    CABasicAnimation *scaleAni = [CABasicAnimation animation];
    scaleAni.keyPath = @"transform.scale";
    scaleAni.toValue = @(0.5);
    group.duration = 2;
    group.animations = @[positionAni,rotationAni,scaleAni];
    
    //把组动画添加到图层上
    [self.imgView.layer addAnimation:group forKey:nil];

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
