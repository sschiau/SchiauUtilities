/*

    Author: Silviu Schiau (@sschiau on Twitter)
    Web: www.schiau.co
    File: SchiauUtilities.h
    Copyright (c) 2014 Schiau. All rights reserved.

    Created: 1393484700 (UNIX Time)
    Modified: 1393484700 (UNIX Time)

    License: Apache License Version 2.0 http://www.apache.org/licenses/LICENSE-2.0.txt

    This header should NOT be removed if you want to use Schiau Utilities.
 
 */

#if ! __has_feature(objc_arc)
#error SchiauUtilities library is ARC only.
#endif

#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
#error SchiauUtilities library needs iOS 7.0 or later.
#endif

#import <Foundation/Foundation.h>

@interface SchiauUtilities : NSObject

+ (SchiauUtilities *)sharedInstance;

- (NSArray *)removeDuplicatesNSArray:(NSArray *)array;
- (NSArray *)mergeTwoArraysByPreservingOriginalOrder:(NSArray *)arrayOne arrayTwo:(NSArray *)arrayTwo;

- (NSUInteger)searchForFreeRowAtColumn:(NSUInteger)columnNo matrix:(NSMutableArray*)matrix;

@end