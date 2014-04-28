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
@property (strong, nonatomic) ODLNetworkManager *networkManager;

@end

@implementation ODLMasterViewModel

#pragma mark - Initializer
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _updatedContentSignal = [[RACSubject subject] setNameWithFormat:@"ODLMasterViewModel updatedContentSignal"];
        _networkManager = [[ODLNetworkManager alloc] init];
        
        [RACObserve(self, data) subscribeNext:^(id x) {
            [(RACSubject *)self.updatedContentSignal sendNext:nil];
        }];
    }
    
    return self;
}

#pragma mark - Content
- (void)updateContent
{
    @weakify(self);
    [[self fetchAllDeviceLabs] subscribeNext:^(id x) {
        @strongify(self);
        self.data = [[[x rac_sequence] map:^id(id value) {
            return [[ODLDeviceLabViewModel alloc] initWithModel:value];
        }] array];
    }];
}

- (NSInteger)numberOfSections
{
    return 1;
}

- (NSInteger)numberOfItemsInSection:(NSInteger)section
{
    return self.data.count;
}

- (NSString *)titleForSection:(NSInteger)section
{
    return nil;
}

- (NSString *)titleAtIndexPath:(NSIndexPath *)indexPath
{
    return [self deviceLabViewModelForIndexPath:indexPath].titleFormattedName;
}

- (NSString *)subtitleAtIndexPath:(NSIndexPath *)indexPath
{
    return [self deviceLabViewModelForIndexPath:indexPath].titleFormattedLocation;
}

- (ODLDeviceLabViewModel *)deviceLabViewModelForIndexPath:(NSIndexPath *)indexPath
{
    return self.data[indexPath.row];
}

#pragma mark - Network

- (RACSignal *)fetchAllDeviceLabs
{
    return [[self.networkManager fetchAllDeviceLabs] takeUntil:self.rac_willDeallocSignal];
}

@end
