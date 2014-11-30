//
//  LHTableViewCell.h
//  iLihuxAutoLayoutInOC
//
//  Created by lihux on 14/11/30.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LHTableViewCellDelegate <NSObject>

- (void)cancelButtonTapped;

@end

@interface LHTableViewCell : UITableViewCell

@property (nonatomic, weak) id<LHTableViewCellDelegate> delegate;

@end
