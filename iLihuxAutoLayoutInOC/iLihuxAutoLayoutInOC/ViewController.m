//
//  ViewController.m
//  iLihuxAutoLayoutInOC
//
//  Created by lihux on 14/11/29.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *kidRightCenterConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *kidLeftCenterConstraint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)didTapOnDouBiButton:(id)sender
{
    [UIView animateWithDuration:0.4 animations:^{
        self.kidLeftCenterConstraint.active = YES;
        self.kidRightCenterConstraint.active = NO;
    }];
    [self.view setNeedsDisplay];
}

- (IBAction)didTapOnFuckButton:(id)sender
{
    [UIView animateWithDuration:0.4 animations:^{
        self.kidLeftCenterConstraint.active = NO;
        self.kidRightCenterConstraint.active = YES;
    }];
    [self.view setNeedsDisplay];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
