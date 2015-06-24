//
//  DEIItemsViewController.m
//  Homepwner
//
//  Created by G.D. Sanders on 6/20/15.
//  Copyright (c) 2015 DigitalEquity, Inc. All rights reserved.
//

#import "DEIItemsViewController.h"
#import "DEIItemsStore.h"
#import "BNRItem.h"

@implementation DEIItemsViewController

- (instancetype)init
{
    // Call the superclass's designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (int i =0; i < 5; i++) {
            [[DEIItemsStore shareStore] createItem];
        }
    }
    
    
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[DEIItemsStore shareStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Get a new or recycled cell
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    /* Set the text on the cell with the description of the item
     that is the nth index of items, where n = row this cell will appear in the tableview
     */
    NSArray *items = [[DEIItemsStore shareStore] allItems];
    BNRItem *item = items[indexPath.row];
    
    cell.textLabel.text = [item description];
    
    return cell;
}


@end
