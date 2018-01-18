//
//  NationDataSource.m
//  HumanWorldDemo
//
//  Created by 小雨科技 on 2018/1/18.
//  Copyright © 2018年 jiajianhao. All rights reserved.
//

#import "NationDataSource.h"
#import "NationCell.h"
@implementation NationDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NationCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellIdentifier
                                                                           forIndexPath:indexPath];
    cell.tag = indexPath.section * 100 + indexPath.row;
    
    id item = [self itemAtIndexPath:indexPath];
    
    self.block(cell, item); return cell;
}
@end
