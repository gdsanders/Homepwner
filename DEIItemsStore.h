//
//  DEIItemsStore.h
//  Homepwner
//
//  Created by G.D. Sanders on 6/22/15.
//  Copyright (c) 2015 DigitalEquity, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DEIItem;

@interface DEIItemsStore : NSObject

@property (nonatomic, readonly, copy) NSArray *allItems;

+ (instancetype)shareStore;


@end
