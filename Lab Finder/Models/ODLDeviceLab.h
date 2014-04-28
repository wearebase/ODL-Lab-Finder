//
//  ODLDeviceLab.h
//  Lab Finder
//
//  Created by Daniel Tomlinson on 28/04/2014.
//  Copyright (c) 2014 We Are Base. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ODLDeviceLab : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSDictionary *location;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (instancetype)deviceLabWithDictionary:(NSDictionary *)dictionary;

+ (NSArray *)labsWithArray:(NSArray *)array;

@end
