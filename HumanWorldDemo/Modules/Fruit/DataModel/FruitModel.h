//
//  FruitModel.h
//  HumanWorldDemo
//
//  Created by 小雨科技 on 2018/1/18.
//  Copyright © 2018年 jiajianhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FruitModel : NSObject
@property (nonatomic, strong) NSString  *name;
@property (nonatomic, strong) UIImage   *posterImage;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) id fruitObj;

@end
