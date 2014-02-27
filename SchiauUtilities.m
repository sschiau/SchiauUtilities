/*
 
    Author: Silviu Schiau (@sschiau on Twitter)
    Web: www.schiau.co
    File: SchiauUtilities.m
    Copyright (c) 2014 Schiau. All rights reserved.

    Created: 1393484700 (UNIX Time)
    Modified: 1393484700 (UNIX Time)

    License: Apache License Version 2.0 http://www.apache.org/licenses/LICENSE-2.0.txt

    This header should NOT be removed if you want to use Schiau Utilities.
 
 */

#import "SchiauUtilities.h"

@implementation SchiauUtilities

static SchiauUtilities * sharedInstance;

#pragma mark SHARED INSTANCE
+ (SchiauUtilities *) sharedInstance
{
    static SchiauUtilities * SchiauUtilitiesInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SchiauUtilitiesInstance = [[super allocWithZone: nil] init];
        
        [[NSNotificationCenter defaultCenter] addObserver: SchiauUtilitiesInstance selector: @selector(memoryWarningAction:) name: UIApplicationDidReceiveMemoryWarningNotification object: [UIApplication sharedApplication]];
        
        [[NSNotificationCenter defaultCenter] addObserver: SchiauUtilitiesInstance selector: @selector(memoryWarningAction:) name: UIApplicationWillTerminateNotification object: [UIApplication sharedApplication]];
    });
    
    return SchiauUtilitiesInstance;
}

+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

#pragma mark Remove duplicates from NSArray
- (NSArray *)removeDuplicatesNSArray:(NSArray *)array
{
    NSArray * newArray = [[NSSet setWithArray:array] allObjects];
    
    return newArray;
}

#pragma mark Merge two NSAArrays while preserving the original NSArray order
- (NSArray *)mergeTwoArraysByPreservingOriginalOrder:(NSArray *)arrayOne arrayTwo:(NSArray *)arrayTwo
{
    NSArray * newArray = [arrayOne arrayByAddingObjectsFromArray:arrayTwo];
    
    return newArray;
    
    // Use oldArray = [newArray mutableCopy] to rewrite old arrays with new Array;
}

#pragma mark - Search NSMutableArray for free row at colum x (assuming matrix has at index 0 (row w/ column) a value NSUInteger not equal to 0)
- (NSUInteger)searchForFreeRowAtColumn:(NSUInteger)columnNo matrix:(NSMutableArray*)matrix
{
    NSUInteger rowNo = 0;
    NSUInteger rowCount = matrix.count;
    
    while ( ([matrix[rowNo][columnNo][0] intValue] != 0) && (rowNo < rowCount) )
    {
        rowNo += 1;
    }
    
    return rowNo;
}

#pragma mark DEALLOC
- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver: self name: UIApplicationDidReceiveMemoryWarningNotification object: [UIApplication sharedApplication]];
    [[NSNotificationCenter defaultCenter] removeObserver: self name: UIApplicationWillTerminateNotification object: [UIApplication sharedApplication]];
}

- (void) memoryWarningAction: (NSNotification *) notification
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

@end
