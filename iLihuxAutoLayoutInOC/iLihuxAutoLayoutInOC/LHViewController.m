//
//  ViewController.m
//  iLihuxAutoLayoutInOC
//
//  Created by lihux on 14/11/29.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

/**
 *  场景1：简单的展示如何通过修改一个view的autolayout来实现动画，其基本思路
 *  是通过更改动画view的constraint属性在UIView的animation block中调用
 *  setNeedsLayout方法实现动画效果。
 *
 *  NOTICE: NSLayoutConstraint的active是iOS中新增的特性，在iOS7上无法应用
 *  因此做iOS7上的动画时要采用比较不同的方法
 */

#import "LHViewController.h"

@interface LHViewController ()

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *kidRightCenterConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *kidLeftCenterConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *douBi;

@end

@implementation LHViewController

static const float kAnimationDuration = 0.4;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)didTapOnDouBiButton:(id)sender
{
    [self animatedMoveDoubiIsLeft:YES];
}

- (IBAction)didTapOnFuckButton:(id)sender
{
    [self animatedMoveDoubiIsLeft:NO];
}

- (void)animatedMoveDoubiIsLeft:(BOOL)isLeft
{
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_1) {
        self.kidLeftCenterConstraint.active = isLeft;
        self.kidRightCenterConstraint.active = !isLeft;
        [UIView animateWithDuration:kAnimationDuration animations:^{
            [self.view layoutIfNeeded];
        }];
    } else {
        NSLayoutConstraint *constraintToRemove = !isLeft ? self.kidLeftCenterConstraint : self.kidRightCenterConstraint;
        NSLayoutConstraint *constriaintToUse = isLeft ? self.kidLeftCenterConstraint : self.kidRightCenterConstraint;
        [self.douBi.superview removeConstraint:constraintToRemove];
        [self.douBi.superview removeConstraint:constriaintToUse];
        [self.douBi.superview addConstraint:constriaintToUse];
        [UIView animateWithDuration:kAnimationDuration animations:^{
            [self.view layoutIfNeeded];
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
