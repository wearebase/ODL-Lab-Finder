//
//  ODLNetworkManager.m
//  Lab Finder
//
//  Created by Daniel Tomlinson on 28/04/2014.
//  Copyright (c) 2014 We Are Base. All rights reserved.
//

#import "ODLNetworkManager.h"
#import "ODLDeviceLab.h"

@implementation ODLNetworkManager

+ (RACSignal *)fetchAllDeviceLabs
{
    RACSignal *deviceLabSignal;
    
    NSLog(@"Hi?");
    
    deviceLabSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber)
                       {
                           NSLog(@"Yep");
                           [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:@"http://api.opendevicelab.com"]
                                                       completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                           NSLog(@"Somethings happening.");
                                                           if (error)
                                                           {
                                                               NSLog(@"%@", [error localizedDescription]);
                                                               [subscriber sendError:error];
                                                           }
                                                           else
                                                           {
                                                               NSLog(@"Hi");
                                                               NSArray *results = [NSJSONSerialization JSONObjectWithData:data
                                                                                                                  options:0
                                                                                                                    error:nil];
                                                               NSArray *mappedResults = [[[results rac_sequence] map:^id(id value) {
                                                                   return [ODLDeviceLab deviceLabWithDictionary:value];
                                                               }] array];
                                                               
                                                               [subscriber sendNext:mappedResults];
                                                           }
                                                           [subscriber sendCompleted];
                                                       }] resume];
                           return nil;
                       }];
    
    
    return deviceLabSignal;
}

@end
