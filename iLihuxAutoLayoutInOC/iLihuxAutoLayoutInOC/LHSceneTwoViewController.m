//
//  LHSceneTwoViewController.m
//  iLihuxAutoLayoutInOC
//
//  Created by lihux on 14/11/30.
//  Copyright (c) 2014年 lihux. All rights reserved.
//

#import "LHSceneTwoViewController.h"

#import "LHTableViewCell.h"

@interface LHSceneTwoViewController () <UITableViewDataSource, UITableViewDelegate, LHTableViewCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *emptyView;
@property (nonatomic, assign) int tableRows;
@end

@implementation LHSceneTwoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableRows = 3;
    [self customUI];
}

- (void)customUI
{
    UIView *backgroundView = [UIView new];
    [backgroundView addSubview:self.emptyView];
    NSDictionary *views = @{@"backgroundView": self.emptyView};
    [backgroundView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[backgroundView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:views]];
    [backgroundView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[backgroundView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:views]];
    self.tableView.backgroundView = backgroundView;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - tableview delegates
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    self.tableView.backgroundView.hidden = self.tableRows > 0 ? YES : NO;
    return self.tableRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LHTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"doubi"];
    cell.delegate = self;
    return cell;
}

#pragma LHTableViewCellDelegate
- (void)cancelButtonTapped
{
    self.tableRows --;
    [self.tableView reloadData];
}

@end
