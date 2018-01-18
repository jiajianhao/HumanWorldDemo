//
//  NationCell.h
//  HumanWorldDemo
//
//  Created by 小雨科技 on 2018/1/18.
//  Copyright © 2018年 jiajianhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NationModel.h"
@interface NationCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
- (void)configureForModel:(NationModel *)model;

@end
