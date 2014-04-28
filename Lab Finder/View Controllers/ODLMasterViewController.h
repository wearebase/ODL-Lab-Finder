//
//  ODLMasterViewController.h
//  Lab Finder
//
//  Created by Daniel Tomlinson on 28/04/2014.
//  Copyright (c) 2014 We Are Base. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ODLMasterViewModel;

@interface ODLMasterViewController : UITableViewController

@property (nonatomic, readonly) ODLMasterViewModel *viewModel;

@end
