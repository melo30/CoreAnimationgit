//
//  CAKeyframeAnimationViewController.m
//  AutolayoutAnimation
//
//  Created by 陈诚 on 15/12/8.
//  Copyright © 2015年 陈诚. All rights reserved.
//

#import "CAKeyframeAnimationViewController.h"
#import "ShakeViewController.h"
@interface CAKeyframeAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation CAKeyframeAnimationViewController
- (IBAction)shakeBtn:(id)sender {
    ShakeViewController *shakeVc = [[ShakeViewController alloc]init];
    
    [self presentViewController:shakeVc animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    //添加一个圆
    UIView *circleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenW, screenW)];
    circleView.backgroundColor = [UIColor yellowColor];
    circleView.layer.cornerRadius = screenW * 0.5;
    [self.view addSubview:circleView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //学习帧动画
    //创建
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    
    //设置动画执行的路径 指定四个点
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
     NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(250, 50)];
     NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(250, 250)];
     NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(50, 250)];
    //数组第一个是开始状态 最后一个是结束状态
    animation.values = @[value1,value2,value3,value4,value1];
    
    animation.duration = 4;
    
    //设置动画节奏
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];//kCAMediaTimingFunctionEaseIn 先慢后快 ...
    
    //设置一个路径
    //这个path的优先级大于上面value的优先级，所以上面的value就不执行了
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGPathAddEllipseInRect(path, nil, CGRectMake(0, 0, screenW, screenW));
    animation.path = path;
    //把图片移到顶部
    [self.view bringSubviewToFront:self.imgView];
    //C语言的数据类型 如果是create、copy、retain穿件的要释放
    CFRelease(path);
    //添加动画
    [self.imgView.layer addAnimation:animation forKey:nil];
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
