//
//  TransformViewController.m
//  AutolayoutAnimation
//
//  Created by 陈诚 on 15/12/9.
//  Copyright © 2015年 陈诚. All rights reserved.
//

#import "TransitionViewController.h"

@interface TransitionViewController ()

- (IBAction)tapView:(UITapGestureRecognizer *)sender;

@property (nonatomic, strong)NSMutableArray *imgs;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (nonatomic, assign)NSInteger currentImgIndex;//当前图片的索引
@end

@implementation TransitionViewController

- (NSMutableArray *)imgs
{
    if (!_imgs) {
        _imgs = [NSMutableArray array];
        for (NSInteger i = 1; i <8; i++) {
            NSString *imgName = [NSString stringWithFormat:@"%ld",i];
            [_imgs addObject:imgName];
        }
    }
    return _imgs;
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


- (IBAction)tapView:(UITapGestureRecognizer *)sender {
    //实现判断图片的左边还是右边点击
    //获取触摸点
    CGPoint point = [sender locationInView:sender.view];
    NSLog(@"%@",NSStringFromCGPoint(point));
    
    if (point.x <= sender.view.bounds.size.width * 0.5) {
        NSLog(@"上一张");
        [self previous];
    }else{
        NSLog(@"下一张");
        [self next];
    }
}
- (void)previous
{
    if (self.currentImgIndex == 0) {
        NSLog(@"这是第一张图");
        return;
    }
    self.currentImgIndex --;
    self.imgView.image = [UIImage imageNamed:self.imgs[self.currentImgIndex]];
    //转场动画使用
    CATransition *animation = [CATransition animation];
    //设置转场动画的类型
    // types include
    //fade(渐隐), moveIn, push（推出）, reveal（移开）, pageCurl(向上翻), pageUnCurl(向下翻), rippleEffect(滴水效果), suckEffect(遮布效果), cube(立方体效果), oglFlip(上下左右翻转), rotate(旋转效果), .
    //ogFlip,rotate
    animation.type = @"cube";
    animation.duration = 2;
    [self.imgView.layer addAnimation:animation forKey:nil];
}
- (void)next
{
    /**
     *  提示：转场动画类型能用字符串常量的就用字符串常量
     */
    //判断当前图片是不是最后一张
    if (self.currentImgIndex == self.imgs.count - 1) {
        NSLog(@"已经是最后一张啦");
        return;
    }
    //加索引
    self.currentImgIndex ++;
    self.imgView.image = [UIImage imageNamed:self.imgs[self.currentImgIndex]];
    
    //转场动画使用
    CATransition *animation = [CATransition animation];
    //设置转场动画的类型
    animation.type = @"fade";
    animation.duration = 2;
    [self.imgView.layer addAnimation:animation forKey:nil];
    
}
@end
