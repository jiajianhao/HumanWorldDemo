//
//  BaseDataSource.m
//  HumanWorldDemo
//
//  Created by 小雨科技 on 2018/1/17.
//  Copyright © 2018年 jiajianhao. All rights reserved.
//

#import "BaseDataSource.h"

@implementation BaseDataSource

- (id)initWithCellIdentifier:(NSString *)cellID
          configureCellBlock:(CellConfigureBlock)block
{
    self = [super init];
    if (self)
    {
        self.cellIdentifier = cellID;
        
        self.block = [block copy];
        self.items = [[NSMutableArray alloc] init];
    }
    return self;
}
- (id)initWithCellIdentifier:(NSString *)cellID CellIdentifier1:(NSString *)cellID2 configureCellBlock:(CellConfigureBlock)block
{
    self = [super init];
    if (self)
    {
        self.cellIdentifier = cellID;
        self.cellIdentifier2 = cellID2;

        self.block = [block copy];
        self.items = [[NSMutableArray alloc] init];
    }
    return self;
}
- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[(NSUInteger)indexPath.row];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
