//
//  ODLDeviceLabViewModel.m
//  Lab Finder
//
//  Created by Daniel Tomlinson on 28/04/2014.
//  Copyright (c) 2014 We Are Base. All rights reserved.
//

#import "ODLDeviceLabViewModel.h"
#import "ODLDeviceLab.h"

@interface ODLDeviceLabViewModel ()
@property (strong, nonatomic) ODLDeviceLab *model;
@end

@implementation ODLDeviceLabViewModel

- (instancetype)initWithModel:(ODLDeviceLab *)model
{
    self = [super init];
    if (self)
    {
        _model = model;
        
        RAC(self, titleFormattedName, @"") = RACObserve(self.model, name);
        
        RACSignal *locationSignal = RACObserve(self.model, location);
        RAC(self, titleFormattedLocation, @"") = [locationSignal map:^id(NSDictionary *location) {
            return location[@"city"];
        }];
        
        RAC(self, formattedAddress, @"") = [locationSignal map:^id(NSDictionary *location) {
            return [NSString stringWithFormat:@"%@,\n%@,\n%@,\n%@", location[@"street_adress"], location[@"city"], location[@"zip"], location[@"country"]];
        }];
        
        RAC(self, formattedDeviceCount, @"0 devices") = [RACObserve(self.model, numberOfDevices) map:^id(NSNumber *numberOfDevices) {
            if ([numberOfDevices  isEqualToNumber:@0])
            {
                return @"0 devices";
            }
            else if ([numberOfDevices isEqualToNumber:@1])
            {
                return @"1 device";
            }
            else
            {
                return [[numberOfDevices stringValue] stringByAppendingString:@" devices"];
            }
        }];
    }
    
    return self;
}

@end
