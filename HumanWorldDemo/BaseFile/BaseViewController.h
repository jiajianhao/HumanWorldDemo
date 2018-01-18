//
//  BaseViewController.h
//  HumanWorldDemo
//
//  Created by 小雨科技 on 2018/1/17.
//  Copyright © 2018年 jiajianhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kStatusBarHeight             [[UIApplication sharedApplication] statusBarFrame].size.height

#define kWidth  [[UIScreen mainScreen] bounds].size.width
#define kHeight [[UIScreen mainScreen] bounds].size.height
#define SIZE_FACTOR     [UIScreen mainScreen].bounds.size.width / 320.f
#define PHOTO_LIST_SIZE CGSizeMake(78.5 * SIZE_FACTOR, 78.5 * SIZE_FACTOR)
#define kNavigationBarHeight         44
#define kNavBarHeightWithStatusBar     (44+kStatusBarHeight)
#define kTabBarHeight                 (iPhoneX? 83.0:49.0)
#define kContentHeight               (kHeight - kNavigationBarHeight)

#define WeakObj(o) try{}@finally{} __weak typeof(o) o##Weak = o;

@interface BaseViewController : UIViewController
{
    dispatch_queue_t serialPGQueue;
}
@property (nonatomic, weak) UIActivityIndicatorView *idView;


- (void)showIndicatorView;
- (void)hideIndicatorView;
@end
