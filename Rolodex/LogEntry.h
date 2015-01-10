//
//  LogEntry.h
//  Rolodex
//
//  Created by Jeff Hou on 1/9/15.
//  Copyright (c) 2015 A Moot Point. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LogEntry : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
