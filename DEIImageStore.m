//
//  DEIImageStore.m
//  Homepwner
//
//  Created by G.D. Sanders on 7/22/15.
//  Copyright (c) 2015 DigitalEquity, Inc. All rights reserved.
//

#import "DEIImageStore.h"

@interface DEIImageStore ()

@property (nonatomic, strong) NSMutableDictionary * dictionary;

@end

@implementation DEIImageStore

+ (instancetype)sharedStore
{
    static DEIImageStore *sharedStore;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

// No one should call init
- (instancetype)init
{
    [NSException raise:@"Singleton" format:@"Use +[DEIImageStore sharedStore]"];
    return nil;
}

// Secret designated initializer
- (instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        _dictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)setImage:(UIImage *)image forKey:(NSString *)key
{
    [self.dictionary setObject:image forKey:key];
}

- (UIImage *)imageForKey:(NSString *)key
{
    return [self.dictionary objectForKey:key];
}

- (void)deleteImageForKey:(NSString *)key
{
    if (!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
}

@end
