//
//  FruitDataSource.m
//  HumanWorldDemo
//
//  Created by 小雨科技 on 2018/1/18.
//  Copyright © 2018年 jiajianhao. All rights reserved.
//

#import "FruitDataSource.h"
#import "FruitTableViewCell.h"
@implementation FruitDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FruitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                            forIndexPath:indexPath];
    cell.tag = indexPath.section * 100 + indexPath.row;
    
    id item = [self itemAtIndexPath:indexPath];
    
    self.block(cell, item);
    return cell;
}

@end
