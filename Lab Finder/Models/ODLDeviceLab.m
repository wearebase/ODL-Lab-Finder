//
//  ODLDeviceLab.m
//  Lab Finder
//
//  Created by Daniel Tomlinson on 28/04/2014.
//  Copyright (c) 2014 We Are Base. All rights reserved.
//

#import "ODLDeviceLab.h"

@implementation ODLDeviceLab

+ (instancetype)deviceLabWithDictionary:(NSDictionary *)dictionary
{
    return [[self alloc] initWithDictionary:dictionary];
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        
    }
    
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [self init];
    if (self)
    {
        _name = dictionary[@"name"];
        _location = dictionary[@"loc"];
    }
    
    return self;
}

+ (NSArray *)labsWithArray:(NSArray *)array
{
    NSArray *labs = [[[array rac_sequence] map:^id(id value)
    {
        return [self deviceLabWithDictionary:value];
    }] array];
    
    return labs;
}

@end
