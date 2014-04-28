//
//  NSDate+DANAdditions.m
//
//  Copyright (c) 2014 Daniel Tomlinson. All rights reserved.
//

#import "NSDate+DANAdditions.h"

@implementation NSDate (DANAdditions)

# pragma mark Public Methods
# pragma mark -

# pragma mark Basic Methods

- (NSDate *)dateByModifyingSeconds:(NSInteger)seconds
{
	NSDateComponents *components = [self dateComponents];
	components.second = seconds;
	
	return [NSDate dateWithDateComponents:components];
}

- (NSDate *)dateByModifyingMinute:(NSInteger)minute
{
	NSDateComponents *components = [self dateComponents];
	components.minute = minute;
	
	return [NSDate dateWithDateComponents:components];
}

- (NSDate *)dateByModifyingHour:(NSInteger)hour
{
	NSDateComponents *components = [self dateComponents];
	components.hour = hour;
	
	return [NSDate dateWithDateComponents:components];
}

- (NSDate *)dateByModifyingDay:(NSInteger)day
{
	NSDateComponents *components = [self dateComponents];
	components.day = day;
	
	return [NSDate dateWithDateComponents:components];
}

- (NSDate *)dateByModifyingMonth:(NSInteger)month
{
	NSDateComponents *components = [self dateComponents];
	components.month = month;
	
	return [NSDate dateWithDateComponents:components];
}

- (NSDate *)dateByModifyingYear:(NSInteger)year
{
	NSDateComponents *components = [self dateComponents];
	components.year = year;
	
	return [NSDate dateWithDateComponents:components];
}

+ (NSDate *)dateFromYear:(NSInteger)year andMonth:(NSInteger)month andDay:(NSInteger)day
				 andHour:(NSInteger)hour andMinute:(NSInteger)minute andSecond:(NSInteger)second
{
	
	NSDateComponents *components = [[NSDate date] dateComponents];
	components.year = year;
	components.month = month;
	components.day = day;
	components.hour = hour;
	components.minute = minute;
	components.second = second;
	
	return [NSDate dateWithDateComponents:components];
}

+ (NSDate *)dateWithDay:(NSInteger)day andMonth:(NSInteger)month andYear:(NSInteger)year
{
	return [NSDate dateFromYear:year
					   andMonth:month
						 andDay:day
						andHour:0
					  andMinute:0
					  andSecond:0];
}

+ (NSDate *)dateWithHour:(NSInteger)hour andMinute:(NSInteger)minute onReferenceDate:(NSDate *)date
{
	NSDateComponents *components = [date dateComponents];
	components.hour = hour;
	components.minute = minute;
	components.second = 0;
	
	return [NSDate dateWithDateComponents:components];
}


- (NSArray *)timeAsArrayComponents
{
	NSArray *components = [[self timeStringWithSeperator:@""] componentsSeparatedByString:@""];
	
	return components;
}

- (NSString *)timeStringWithSeperator:(NSString *)seperator
{
	NSDateComponents *components = [self dateComponents];
	
	NSString *hourString = (components.hour >= 10 ? [NSString stringWithFormat:@"%d", components.hour] : [NSString stringWithFormat:@"0%d", components.hour]);
	
	NSString *minuteString = (components.minute >= 10 ? [NSString stringWithFormat:@"%d", components.minute] : [NSString stringWithFormat:@"0%d", components.minute]);
	
	return [NSString stringWithFormat:@"%@%@%@", hourString, seperator, minuteString];
}

+ (NSDate *)dateFromString:(NSString *)dateString
{
	return [self dateFromString:dateString withFormat:@"yyyy-MM-dd HH:mm:ss ZZZ"];
}

+ (NSDate *)dateFromString:(NSString *)dateString withFormat:(NSString *)formatString
{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatString];
	
	return [dateFormatter dateFromString:dateString];
}

- (NSDate *)yesterday
{
    return [self calculateDateWithOffset:-1];
}

- (NSDate *)tomorrow
{
    return [self calculateDateWithOffset:1];
}

- (NSDate *)calculateDateWithOffset:(int)daysOffset
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:daysOffset];
    
    return [[NSDate calendar] dateByAddingComponents:components toDate:self options:0];
}

- (BOOL)isWeekend
{
	int dayOfWeek = [[[NSCalendar currentCalendar] components:NSWeekdayCalendarUnit fromDate:self] weekday];
    if (dayOfWeek == Saturday || dayOfWeek == Sunday) {
        return YES;
    }
    
    return NO;
}

- (NSString *)weekdayName
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE"];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:[NSLocale preferredLanguages][0]]];
    return [dateFormatter stringFromDate:self];
}

- (BOOL)isEarlierThan:(NSDate*)otherDate
{
    return [self compare:otherDate] == NSOrderedAscending;
}

- (BOOL)isLaterThan:(NSDate*)otherDate
{
    return [self compare:otherDate] == NSOrderedDescending;
}

# pragma mark -
# pragma mark Private Methods
# pragma mark -

+ (NSCalendar *)calendar
{
	return [NSCalendar currentCalendar];
//	return [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
}

- (NSDateComponents *) dateComponents
{
	NSDateComponents *components = [[NSDate calendar] components:(NSSecondCalendarUnit|
																		   NSMinuteCalendarUnit|
																		   NSHourCalendarUnit  |
																		   NSDayCalendarUnit   |
																		   NSMonthCalendarUnit |
																		   NSYearCalendarUnit)
																 fromDate:self];
	return components;
}

+ (NSDate *)dateWithDateComponents:(NSDateComponents *)components
{
	return [[self calendar] dateFromComponents:components];
}


#pragma mark -
@end
