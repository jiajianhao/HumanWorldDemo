//
//  BaseDataSource.h
//  HumanWorldDemo
//
//  Created by 小雨科技 on 2018/1/17.
//  Copyright © 2018年 jiajianhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void (^CellConfigureBlock)(id cell, id item);

@interface BaseDataSource:NSObject<UITableViewDataSource, UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, copy)   NSString *cellIdentifier;
@property (nonatomic, copy)   CellConfigureBlock block;

- (id)initWithCellIdentifier:(NSString *)cellID
          configureCellBlock:(CellConfigureBlock)block;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;


@end
