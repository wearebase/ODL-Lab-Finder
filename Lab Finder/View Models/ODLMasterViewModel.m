//
//  ODLMasterViewModel.m
//  Lab Finder
//
//  Created by Daniel Tomlinson on 28/04/2014.
//  Copyright (c) 2014 We Are Base. All rights reserved.
//

#import "ODLMasterViewModel.h"

#import "ODLDeviceLabViewModel.h"

#import "ODLNetworkManager.h"

@interface ODLMasterViewModel ()

@property (strong, nonatomic) RACSubject *updatedContentSignal;
@property (strong, nonatomic) NSArray *data;

@end

@implementation ODLMasterViewModel

#pragma mark - Initializer
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.updatedContentSignal = [[RACSubject subject] setNameWithFormat:@"ODLMasterViewModel updatedContentSignal"];
        
        [RACObserve(self, data) subscribeNext:^(id x) {
            [(RACSubject *)self.updatedContentSignal sendNext:nil];
        }];
    }
    
    return self;
}

#pragma mark - Content
- (void)updateContent
{
    RAC(self, data) = [self fetchAllDeviceLabs];
}

#pragma mark - Network

- (RACSignal *)fetchAllDeviceLabs
{
    return [ODLNetworkManager fetchAllDeviceLabs];
}

@end
