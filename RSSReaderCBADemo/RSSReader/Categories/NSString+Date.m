//
//  NSString+Date.m
//  RSSReader


#import "NSString+Date.h"

@implementation NSString (Date)

// getting proper date by date string
- (NSDate *)getDate {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    // set date formatting
    NSString *dateformatString = @"yyyy-MM-dd HH:mm:ss";
    [dateFormatter setDateFormat:dateformatString];
    NSString *dateString = [self stringByTrimmingCharactersInSet:
                            [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    // getting date from string by format
    NSDate *date = [dateFormatter dateFromString:dateString];
    return date;
}

@end
