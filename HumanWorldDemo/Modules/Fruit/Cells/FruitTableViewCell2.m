//
//  FruitTableViewCell2.m
//  HumanWorldDemo
//
//  Created by 小雨科技 on 2018/2/2.
//  Copyright © 2018年 jiajianhao. All rights reserved.
//

#import "FruitTableViewCell2.h"
#define kWidth  [[UIScreen mainScreen] bounds].size.width

#define cellH 50
@implementation FruitTableViewCell2


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:self.posterView];
        [self.contentView addSubview:self.countLabel];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.moreButton];
        
//        [self.posterView setFrame:CGRectMake(10, 10, 40, 40)];
        [self.nameLabel setFrame:CGRectMake(10, (cellH -20)/2, 100, 20)];
        [self.countLabel setFrame:CGRectMake(160, (cellH -20)/2, 100, 20)];
        [self.moreButton setFrame:CGRectMake(kWidth-80, 5, 60, 50)];
        
//        self.posterView.layer.masksToBounds=YES;
//        self.posterView.layer.cornerRadius=20;
    }
    
    return self;
}

-(UIImageView *)posterView{
    if (!_posterView) {
        _posterView = [[UIImageView alloc]init];
        _posterView.clipsToBounds=YES;
        
    }
    return _posterView;
}
-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:19.0f];
        _nameLabel.textColor = [UIColor orangeColor];
        
    }
    return _nameLabel;
}
-(UILabel *)countLabel{
    if (!_countLabel) {
        _countLabel = [[UILabel alloc] init];
        _countLabel.font = [UIFont systemFontOfSize:11.0f];
        _countLabel.textColor = [UIColor redColor];
        
    }
    return _countLabel;
}
-(UIButton *)moreButton{
    if (!_moreButton) {
        _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_moreButton addTarget:self action:@selector(moreButtonOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_moreButton setTitle:@"更多" forState:UIControlStateNormal];
        [_moreButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return _moreButton;
}
- (void)configureWithFruitObj:(FruitModel *)obj{
    self.posterView.image = obj.posterImage;
    self.nameLabel.text        = obj.name;
    self.countLabel.text       = [NSString stringWithFormat:@"%ld",(long)obj.count];
}
#pragma mark -- Button Click
-(void)moreButtonOnClick:(UIButton*)sender{
    if (self.fMoreblock) {
        self.fMoreblock(YES);
    }
}
-(void)moreActionOnClick:(FruitCheckMoreBlock)block{
    self.fMoreblock = block;
}
@end
