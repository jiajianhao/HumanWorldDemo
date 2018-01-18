//
//  NationCell.m
//  HumanWorldDemo
//
//  Created by 小雨科技 on 2018/1/18.
//  Copyright © 2018年 jiajianhao. All rights reserved.
//

#import "NationCell.h"

@implementation NationCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
 
-(void)configureForModel:(NationModel *)model{
    self.posterView.image = model.posterImage;

}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.contentView.frame = self.bounds;
 }
@end
