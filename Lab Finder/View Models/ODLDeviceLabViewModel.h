//
//  ODLDeviceLabViewModel.h
//  Lab Finder
//
//  Created by Daniel Tomlinson on 28/04/2014.
//  Copyright (c) 2014 We Are Base. All rights reserved.
//

#import "RVMViewModel.h"

@class ODLDeviceLab;

@interface ODLDeviceLabViewModel : RVMViewModel

- (instancetype)initWithModel:(ODLDeviceLab *)model;

@property (nonatomic, readonly) NSString *titleFormattedName;
@property (nonatomic, readonly) NSString *titleFormattedLocation;
@property (nonatomic, readonly) NSString *formattedAddress;
@end
