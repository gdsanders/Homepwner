//
//  DEIItemsStore.m
//  Homepwner
//
//  Created by G.D. Sanders on 6/22/15.
//  Copyright (c) 2015 DigitalEquity, Inc. All rights reserved.
//

#import "DEIItemsStore.h"
#import "BNRItem.h"

@implementation DEIItemsStore

+ (instancetype)shareStore
{
    static DEIItemsStore *sharedStore;
    
    // Do I need to create a sharedStore?
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (instancetype)init
{
    [NSException raise:@"Singleton" format:@"Use +[DEIItemStore sharedStore]"];
    
    return nil;

}

- (instancetype)initPrivate
{
    self = [super init];
   
    return self;
}


@end
