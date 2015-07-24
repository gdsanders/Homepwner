//
//  DEIItemsStore.m
//  Homepwner
//
//  Created by G.D. Sanders on 6/22/15.
//  Copyright (c) 2015 DigitalEquity, Inc. All rights reserved.
//

#import "DEIItemsStore.h"
#import "BNRItem.h"
#import "DEIImageStore.h"

@interface DEIItemsStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

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

// If someone calls init, let them know the error
- (instancetype)init
{
    [NSException raise:@"Singleton" format:@"Use +[DEIItemStore sharedStore]"];
    
    return nil;

}

// Real initializer
- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    
   
    return self;
}

- (NSArray *)allItems
{
    return [self.privateItems copy];
}

- (BNRItem *)createItem
{
    BNRItem *item = [BNRItem randomItem];
    
    [self.privateItems addObject:item];
    
    return item;
}

- (void)removeItem:(BNRItem *)item
{
    NSString *key = item.itemKey;
    
    [[DEIImageStore sharedStore] deleteImageForKey:key];
    
    
    [self.privateItems removeObjectIdenticalTo:item];
}

- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    if (fromIndex == toIndex) {
        return;
    }
    
    // Get pointer to object being moved so you can re-insert it
    BNRItem *item = self.privateItems[fromIndex];
    
    // Remove item from array
    [self.privateItems removeObjectAtIndex:fromIndex];
    
    // Insert item in array at new location
    [self.privateItems insertObject:item atIndex:toIndex];
}

@end
