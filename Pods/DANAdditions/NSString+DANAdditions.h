//
//  NSString+DANAdditions.h
//
//  Copyright (c) 2014 Daniel Tomlinson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DANAdditions)

- (NSURL *)url;

+ (NSString *)localCachePath;
+ (NSString *)localDocsPath;

- (NSString *)urlFriendlyFileName;
- (NSString *)stringByAppendingURLPathComponent:(NSString *)pathComponent;
- (NSString *)stringByDeletingLastURLPathComponent;

- (NSString *)sha512;
- (NSString *)base64Encode;
- (NSString *)base64Decode;

- (NSString*)stringBetweenString:(NSString *)start andString:(NSString *)end;

- (NSString *)stringByStrippingHTML;

- (NSString *)trim;
- (BOOL)isNumeric;
- (BOOL)containsString:(NSString *)needle;

__attribute__((overloadable))
NSString *substr(NSString *str, int start);
__attribute__((overloadable))
NSString *substr(NSString *str, int start, int length);

@end

@interface NSObject (isEmpty)

- (BOOL)mag_isEmpty;

@end
