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

- (RACSignal *)fetchJSONFromURL:(NSURL *)url
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url
                                                                     completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (! error)
            {
                NSError *jsonError = nil;
                id json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
                if (! jsonError)
                {
                    [subscriber sendNext:json];
                }
                else
                {
                    [subscriber sendError:jsonError];
                }
            }
            else
            {
                [subscriber sendError:error];
            }
            
            [subscriber sendCompleted];
        }];
        
        [dataTask resume];
        
        return [RACDisposable disposableWithBlock:^{
            [dataTask cancel];
        }];
    }];
}

- (RACSignal *)fetchAllDeviceLabs
{
    return [[self fetchJSONFromURL:[NSURL URLWithString:@"http://api.opendevicelab.com"]] map:^id(NSArray *value) {
        return [ODLDeviceLab labsWithArray:value];
    }];
}

@end
