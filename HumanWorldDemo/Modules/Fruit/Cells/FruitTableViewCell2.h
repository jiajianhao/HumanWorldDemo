//
//  FruitTableViewCell2.h
//  HumanWorldDemo
//
//  Created by 小雨科技 on 2018/2/2.
//  Copyright © 2018年 jiajianhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FruitModel.h"

typedef void (^FruitCheckMoreBlock)(Boolean doClick);

@interface FruitTableViewCell2 : UITableViewCell
@property (strong, nonatomic) UIImageView *posterView;
@property (strong, nonatomic) UILabel *countLabel;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UIButton *moreButton;

@property (nonatomic, copy)   FruitCheckMoreBlock fMoreblock;
- (void)configureWithFruitObj:(FruitModel *)obj;
-(void)moreActionOnClick:(FruitCheckMoreBlock)block;
@end
