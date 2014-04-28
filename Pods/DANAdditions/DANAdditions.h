//
//  DANAdditions.h
//
//  Copyright (c) 2014 Daniel Tomlinson. All rights reserved.
//

#ifndef DANAdditions_h
#define DANAdditions_h

#import "NSString+DANAdditions.h"
#import "UIColor+DANAdditions.h"
#import "UINavigationController+DANAdditions.h"
#import "UIView+DANAdditions.h"
#import "NSDate+DANAdditions.h"


// Useful defines
#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height - 568)? NO : YES) 
#define IS_OS_5_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
#define IS_OS_6_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IS_OS_7_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)


#endif
