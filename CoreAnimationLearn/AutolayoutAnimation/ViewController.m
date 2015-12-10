//
//  ViewController.m
//  AutolayoutAnimation
//
//  Created by 陈诚 on 15/12/7.
//  Copyright © 2015年 陈诚. All rights reserved.
//

#import "ViewController.h"
#import "HomePageAnimationUtil.h"
#import "CAKeyframeAnimationViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *topTitileLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *phoneIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *topTipsLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomTipsView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textFieldBottomLineConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *textFieldBottomLine;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@end

@implementation ViewController
- (IBAction)btnClick:(id)sender {
    CAKeyframeAnimationViewController *keyframeVc = [CAKeyframeAnimationViewController new];
    [self presentViewController:keyframeVc animated:YES completion:nil];
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    _topTitileLabel.transform = CGAffineTransformMakeTranslation(0, -200);
    _bottomTitleLabel.transform = CGAffineTransformMakeTranslation(0, -200);
    _textFieldBottomLineConstraint.constant = 0;
    _phoneIconImageView.transform = CGAffineTransformMakeTranslation(-200, 0);
    _registerBtn.transform = CGAffineTransformMakeTranslation(400, 0);
}

- (void)viewDidAppear:(BOOL)animated
{
    [HomePageAnimationUtil titleAnimationWithLabel:_topTitileLabel withView:self.view];
    
    [HomePageAnimationUtil titleAnimationWithLabel:_bottomTitleLabel withView:self.view];
    
    [HomePageAnimationUtil textFieldBottomLineAnimationWithConstraint:_textFieldBottomLineConstraint WithView:self.view];
    [HomePageAnimationUtil phoneImageWithImageView:_phoneIconImageView WithView:self.view];
    
    [HomePageAnimationUtil tipsLabelMaskAniamation:_topTipsLabel withBeginTime:0];
    [HomePageAnimationUtil tipsLabelMaskAniamation:_bottomTipsView withBeginTime:1];
    
    [HomePageAnimationUtil registerButtonAnimationWithButton:_registerBtn withView:self.view];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    [self testBasicRotationAnimation];
}
- (void)testBasicRotationAnimation{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation.y";
    animation.byValue = @(M_PI * 2);
    animation.duration = 1.5;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [self.topTitileLabel.layer addAnimation:animation forKey:nil];
    
    CABasicAnimation *animation2 = [CABasicAnimation animation];
    animation2.keyPath = @"transform.rotation.x";
    animation2.byValue = @(M_PI * 2);
    animation2.duration = 1.5;
    animation2.removedOnCompletion = NO;
    animation2.fillMode = kCAFillModeForwards;
    [self.bottomTitleLabel.layer addAnimation:animation2 forKey:nil];
    
    CABasicAnimation *animation3 = [CABasicAnimation animation];
    animation3.keyPath = @"transform.scale.x";
    animation3.byValue = @0.5;
    animation3.duration = 1.5;
    //animation3.removedOnCompletion = NO;
    animation3.fillMode = kCAFillModeForwards;
    [self.textFieldBottomLine.layer addAnimation:animation3 forKey:nil];
    
    CABasicAnimation *animation4 = [CABasicAnimation animation];
    animation4.keyPath = @"transform.rotation.x";
    animation4.byValue = @(M_PI * 2);
    animation4.duration = 1.5;
    animation4.removedOnCompletion = NO;
    animation4.fillMode = kCAFillModeForwards;
    [self.phoneIconImageView.layer addAnimation:animation4 forKey:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
