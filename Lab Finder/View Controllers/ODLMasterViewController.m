//
//  ODLMasterViewController.m
//  Lab Finder
//
//  Created by Daniel Tomlinson on 28/04/2014.
//  Copyright (c) 2014 We Are Base. All rights reserved.
//

#import "ODLMasterViewController.h"
#import "ODLMasterViewModel.h"

@interface ODLMasterViewController ()

@end

@implementation ODLMasterViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        NSLog(@"Hello");
        _viewModel = [ODLMasterViewModel new];
        [_viewModel updateContent];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
