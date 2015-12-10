//
//  HomePageAnimationUtil.h
//  AutolayoutAnimation
//
//  Created by 陈诚 on 15/12/7.
//  Copyright © 2015年 陈诚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HomePageAnimationUtil : NSObject
+ (void)titleAnimationWithLabel:(UILabel *)label withView:(UIView *)view;

+ (void)textFieldBottomLineAnimationWithConstraint:(NSLayoutConstraint *)constraint WithView:(UIView *)view;

+ (void)phoneImageWithImageView:(UIImageView *)imageView WithView:(UIView *)view;

+ (void)tipsLabelMaskAniamation:(UIView *)view withBeginTime:(NSTimeInterval)beginTime;

//+ (void)registerButtonWidthAnimation:(UIButton *)button withView:(UIView *)view andProgress:(CGFloat)progress;

+ (void)registerButtonAnimationWithButton:(UIButton *)button withView:(UIView *)view;
@end
