//
//  LHTableViewCell.m
//  iLihuxAutoLayoutInOC
//
//  Created by lihux on 14/11/30.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

#import "LHTableViewCell.h"

@implementation LHTableViewCell

- (IBAction)didTapOnCancelButton:(id)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(cancelButtonTapped)]) {
        [self.delegate cancelButtonTapped];
    }
}

@end
