//
//  BNRItem.h
//  RandomItems
//
//  Created by G.D. Sanders on 6/14/15.
//  Copyright (c) 2015 DigitalEquity, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly) NSDate *dateCreated;


// Class methods

+ (instancetype)randomItem;

// Designated initializer for BNRItem
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;




@end
