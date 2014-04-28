//
//  ODLDetailViewController.m
//  Lab Finder
//
//  Created by Daniel Tomlinson on 28/04/2014.
//  Copyright (c) 2014 We Are Base. All rights reserved.
//

#import "ODLDetailViewController.h"
#import "ODLDetailViewModel.h"
#import "ODLAddressTableViewCell.h"

#import <UIView+AutoLayout/UIView+AutoLayout.h>

@interface ODLDetailViewController ()
@property (strong, nonatomic, readonly) ODLDetailViewModel *viewModel;
@end

@implementation ODLDetailViewController

- (instancetype)initWithViewModel:(ODLDetailViewModel *)viewModel;
{
    self = [super init];
    if (self)
    {
        _viewModel = viewModel;
        RAC(self, title, @"Device Lab") = RACObserve(self.viewModel, title);
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ODLAddressTableViewCell"
                                               bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"address"];
    
    self.tableView.tableFooterView = [UIView new];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.viewModel numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.viewModel numberOfItemsInSection:section];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.viewModel titleForSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        ODLAddressTableViewCell *addressTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"address" forIndexPath:indexPath];
        [self configureCell:addressTableViewCell atIndexPath:indexPath];
        
        return addressTableViewCell;
    }
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        
        [self configureCell:cell atIndexPath:indexPath];
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (indexPath.section == 0 ? 100 : 67);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

#pragma mark - Private Methods

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    if (cell.class == ODLAddressTableViewCell.class)
    {
        ODLAddressTableViewCell *addressCell = cell;
        addressCell.addressTextView.text = [self.viewModel titleAtIndexPath:indexPath];
    }
    else
    {
    cell.textLabel.text = [self.viewModel titleAtIndexPath:indexPath];
    cell.detailTextLabel.text = [self.viewModel subtitleAtIndexPath:indexPath];
    }
}

@end
