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

@end
