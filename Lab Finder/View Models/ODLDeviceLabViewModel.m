//
//  ODLDeviceLabViewModel.m
//  Lab Finder
//
//  Created by Daniel Tomlinson on 28/04/2014.
//  Copyright (c) 2014 We Are Base. All rights reserved.
//

#import "ODLDeviceLabViewModel.h"
#import "ODLDeviceLab.h"

@interface ODLDeviceLabViewModel ()
@property (strong, nonatomic) ODLDeviceLab *model;
@end

@implementation ODLDeviceLabViewModel

- (instancetype)initWithModel:(ODLDeviceLab *)model
{
    self = [super init];
    if (self)
    {
        _model = model;
        
        RAC(self, titleFormattedName, @"") = RACObserve(self.model, name);
        RAC(self, titleFormattedLocation, @"") = [RACObserve(self.model, location) map:^id(NSDictionary *location) {
            return location[@"city"];
        }];
    }
    
    return self;
}

@end
