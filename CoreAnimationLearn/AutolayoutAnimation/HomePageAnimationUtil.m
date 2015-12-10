//
//  HomePageAnimationUtil.m
//  AutolayoutAnimation
//
//  Created by 陈诚 on 15/12/7.
//  Copyright © 2015年 陈诚. All rights reserved.
//

#import "HomePageAnimationUtil.h"

@implementation HomePageAnimationUtil

+ (void)titleAnimationWithLabel:(UILabel *)label withView:(UIView *)view
{
    [UIView animateWithDuration:1.5 animations:^{
        label.transform = CGAffineTransformIdentity;
    }];
}
+ (void)textFieldBottomLineAnimationWithConstraint:(NSLayoutConstraint *)constraint WithView:(UIView *)view
{
    constraint.constant = 228;
    [UIView animateWithDuration:1.5 animations:^{
        [view layoutIfNeeded];
    }];
}
+ (void)phoneImageWithImageView:(UIImageView *)imageView WithView:(UIView *)view
{
    [UIView animateWithDuration:1.5 animations:^{
        imageView.transform = CGAffineTransformIdentity;
    }];
}
+ (void)tipsLabelMaskAniamation:(UIView *)view withBeginTime:(NSTimeInterval)beginTime
{
    CGPathRef beginPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 0, CGRectGetHeight(view.bounds))].CGPath;
    CGPathRef endPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, CGRectGetWidth(view.bounds), CGRectGetHeight(view.bounds))].CGPath;
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.path = beginPath;
    view.layer.mask = layer;
    
    CABasicAnimation *aniamtion = [CABasicAnimation animationWithKeyPath:@"path"];
    aniamtion.duration = 1;
    aniamtion.beginTime = CACurrentMediaTime() + beginTime;
    aniamtion.fromValue = (id)layer.path;
    aniamtion.toValue = (__bridge id)endPath;
    aniamtion.removedOnCompletion = NO;
    aniamtion.fillMode = kCAFillModeForwards;
    [layer addAnimation:aniamtion forKey:@"shapeLayerPath"];
}

+ (void)registerButtonAnimationWithButton:(UIButton *)button withView:(UIView *)view
{
    [UIView animateWithDuration:1.5 animations:^{
        button.transform = CGAffineTransformIdentity;
    }];
}

@end
