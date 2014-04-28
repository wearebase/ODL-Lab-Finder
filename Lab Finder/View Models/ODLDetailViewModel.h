//
//  ODLDetailViewModel.h
//  Lab Finder
//
//  Created by Daniel Tomlinson on 28/04/2014.
//  Copyright (c) 2014 We Are Base. All rights reserved.
//

#import "RVMViewModel.h"

@class ODLDeviceLabViewModel;

@interface ODLDetailViewModel : RVMViewModel


@property (strong, nonatomic, readonly) NSString *title;

- (instancetype)initWithDeviceLabViewModel:(ODLDeviceLabViewModel *)viewModel;

@end
