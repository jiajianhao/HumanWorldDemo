//
//  FruitDataSource.m
//  HumanWorldDemo
//
//  Created by 小雨科技 on 2018/1/18.
//  Copyright © 2018年 jiajianhao. All rights reserved.
//

#import "FruitDataSource.h"
#import "FruitTableViewCell.h"
#import "FruitTableViewCell2.h"

@implementation FruitDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row%2==0) {
        FruitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                                   forIndexPath:indexPath];
        cell.tag = indexPath.section * 100 + indexPath.row;
        
        id item = [self itemAtIndexPath:indexPath];
        
        self.block(cell, item);
        return cell;
    }
    else{
        FruitTableViewCell2 *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier2
                                                                   forIndexPath:indexPath];
        cell.tag = indexPath.section * 100 + indexPath.row;
        
        id item = [self itemAtIndexPath:indexPath];
        
        self.block(cell, item);
        return cell;
    }
}

@end
