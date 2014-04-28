//
//  ODLMasterViewModel.h
//  Lab Finder
//
//  Created by Daniel Tomlinson on 28/04/2014.
//  Copyright (c) 2014 We Are Base. All rights reserved.
//

#import "RVMViewModel.h"

@class ODLDeviceLabViewModel;

@interface ODLMasterViewModel : RVMViewModel

@property (nonatomic, readonly) RACSignal *updatedContentSignal;

/**
 *  Cause the ViewModel to refresh its data, will return on -updatedContentSignal
 */
- (void)updateContent;

/**
 *  @return The number of sections in the content.
 */
- (NSInteger)numberOfSections;

/**
 *  @param section The section to return a value for.
 *
 *  @return The number of items to display in the given section.
 */
- (NSInteger)numberOfItemsInSection:(NSInteger)section;

/**
 *  @param section The section to return a value for.
 *
 *  @return The title for the given section.
 */
- (NSString *)titleForSection:(NSInteger)section;

/**
 *  @param indexPath The index path to return a title for.
 *
 *  @return The title that should be displayed.
 */
- (NSString *)titleAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  @param indexPath The index path to return a subtitle for.
 *
 *  @return The subtitle that should be displayed.
 */
- (NSString *)subtitleAtIndexPath:(NSIndexPath *)indexPath;

/**
 *  @param indexPath The index path to return a view model for.
 *
 *  @return The device lab view model.
 */
- (ODLDeviceLabViewModel *)deviceLabViewModelForIndexPath:(NSIndexPath *)indexPath;

@end
