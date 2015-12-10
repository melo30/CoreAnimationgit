//
//  ShakeViewController.m
//  AutolayoutAnimation
//
//  Created by 陈诚 on 15/12/8.
//  Copyright © 2015年 陈诚. All rights reserved.
//

#import "ShakeViewController.h"
#import "TransitionViewController.h"
#import "GroupViewController.h"
@interface ShakeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgIcon;

@end

@implementation ShakeViewController
- (IBAction)beginBtn:(id)sender {
    //抖动图片 使用帧动画
    CAKeyframeAnimation *rotationAni = [CAKeyframeAnimation animation];
    rotationAni.keyPath = @"transform.rotation";
    
    CGFloat angle = M_PI_4 * 0.3;
    //设置旋转的路径第一个值和第二个值之间相差90度
    rotationAni.values = @[@(-angle),@(angle),@(-angle)];
    
    //设置动画执行的次数
    rotationAni.repeatCount = MAXFLOAT;
    [self.imgIcon.layer addAnimation:rotationAni forKey:@"shake"];
}
- (IBAction)stopBtn:(id)sender {
    //通过这个key停止动画
    [self.imgIcon.layer removeAnimationForKey:@"shake"];
}
- (IBAction)jumpBtn:(id)sender {
    TransitionViewController *transVc = [[TransitionViewController alloc]init];
    [self presentViewController:transVc animated:YES completion:nil];
}
- (IBAction)groupBtn:(id)sender {
    GroupViewController *groupVc = [[GroupViewController alloc]init];
    [self presentViewController:groupVc animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
