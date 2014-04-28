//
//  ODLDetailViewModel.m
//  Lab Finder
//
//  Created by Daniel Tomlinson on 28/04/2014.
//  Copyright (c) 2014 We Are Base. All rights reserved.
//

#import "ODLDetailViewModel.h"
#import "ODLDeviceLabViewModel.h"

@interface ODLDetailViewModel ()

@property (strong, nonatomic) ODLDeviceLabViewModel *deviceLabViewModel;

typedef NS_ENUM(NSInteger, ODLDetailViewTableViewSections)
{
    ODLDetailViewTableViewSectionAddress = 0,
    ODLDetailViewTableViewSectionDevices,
    ODLDetailViewTableViewSectionMap
};
@end

@implementation ODLDetailViewModel

- (instancetype)initWithDeviceLabViewModel:(ODLDeviceLabViewModel *)viewModel
{
    self = [super init];
    if (self)
    {
        _deviceLabViewModel = viewModel;
    }
    
    return self;
}

#pragma mark - Accessors

- (NSString *)title
{
    return self.deviceLabViewModel.titleFormattedName;
}

#pragma mark - Data source

- (NSInteger)numberOfSections
{
    return 2;
}

- (NSInteger)numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (NSString *)titleForSection:(NSInteger)section
{
    switch (section)
    {
        case ODLDetailViewTableViewSectionDevices:
        {
            return @"Devices";
            break;
        }
        case ODLDetailViewTableViewSectionAddress:
        {
            return @"Address";
            break;
        }
        case ODLDetailViewTableViewSectionMap:
        {
            return @"Map";
            break;
        }
        default:
        {
            return @"";
            break;
        }
    }
}

- (NSString *)titleAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case ODLDetailViewTableViewSectionDevices:
        {
            return @"";
            break;
        }
        case ODLDetailViewTableViewSectionAddress:
        {
            return self.deviceLabViewModel.formattedAddress;
            break;
        }
        case ODLDetailViewTableViewSectionMap:
        {
            return @"Map";
            break;
        }
        default:
        {
            return @"";
            break;
        }
    }
}

- (NSString *)subtitleAtIndexPath:(NSIndexPath *)indexPath
{
    return @"";
}

@end
