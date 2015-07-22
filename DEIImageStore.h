//
//  DEIImageStore.h
//  Homepwner
//
//  Created by G.D. Sanders on 7/22/15.
//  Copyright (c) 2015 DigitalEquity, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DEIImageStore : NSObject

+ (instancetype)sharedStore;

- (void)setImage:(UIImage *)image forKey: (NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;
- (void)deleteImageForKey:(NSString *)key;

@end
