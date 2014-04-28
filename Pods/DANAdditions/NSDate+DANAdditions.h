//
//  NSDate+DANAdditions.h
//
//  Copyright (c) 2014 Daniel Tomlinson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DANAdditions)

typedef NS_ENUM(NSInteger, month) {
	January = 1,
	February,
	March,
	April,
	May,
	June,
	July,
	August,
	September,
	October,
	November,
	December
};

typedef NS_ENUM(NSInteger, day) {
	Sunday = 1,
	Monday,
	Tuesday,
	Wednesday,
	Thursday,
	Friday,
	Saturday
};


- (NSDate *)dateByModifyingHour:(NSInteger)hour;
- (NSDate *)dateByModifyingMinute:(NSInteger)minute;
- (NSDate *)dateByModifyingSeconds:(NSInteger)seconds;
- (NSDate *)dateByModifyingDay:(NSInteger)day;
- (NSDate *)dateByModifyingMonth:(NSInteger)month;
- (NSDate *)dateByModifyingYear:(NSInteger)year;

+ (NSDate *)dateFromYear:(NSInteger)year
				 andMonth:(NSInteger)month
				   andDay:(NSInteger)day
				  andHour:(NSInteger)hour
			    andMinute:(NSInteger)minute
			    andSecond:(NSInteger)second;

/// Provide a day, month and year, and a date will be returned with the time 00:00
+ (NSDate *)dateWithDay:(NSInteger)day andMonth:(NSInteger)month andYear:(NSInteger)year;

/// Provide a 24 hour time, and a date (for the day/month/year), and return a time corrected version of the date, seconds will be 0.
+ (NSDate *)dateWithHour:(NSInteger)hour andMinute:(NSInteger)minute onReferenceDate:(NSDate *)date;

/// Return the time from date as [1,2,3,0] being 12:30
- (NSArray *)timeAsArrayComponents;

/// Return the dates time as a string, with a given seperator, for example, with a seperator of ':', it would return @"12:30"
- (NSString *)timeStringWithSeperator:(NSString *)seperator;

/// NSDate from a yyyy-MM-dd HH:mm:ss ZZZ style timestamp
+ (NSDate *)dateFromString:(NSString *)dateString;

+ (NSDate *)dateFromString:(NSString *)dateString withFormat:(NSString *)formatString;

/// Return the previous day.
- (NSDate *)yesterday;

/// Return the next day
- (NSDate *)tomorrow;

- (NSDate *)calculateDateWithOffset:(int)daysOffset;

- (BOOL)isWeekend;

- (NSString *)weekdayName;

- (BOOL)isEarlierThan:(NSDate*)otherDate;

- (BOOL)isLaterThan:(NSDate*)otherDate;

@end
