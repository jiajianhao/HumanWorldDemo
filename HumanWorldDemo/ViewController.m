//
//  ViewController.m
//  HumanWorldDemo
//
//  Created by 小雨科技 on 2018/1/17.
//  Copyright © 2018年 jiajianhao. All rights reserved.
//

#import "ViewController.h"
#import "FruitVC.h"
#import "NationVC.h"
#define STRINGIZE_(x)  #x
#define haha(x) #x
#define metamacro_concat(A, B) A ## B
#ifdef  DEBUG
#define NSLog(format, ...) NSLog((@"%s [Line %d] " format), __func__, __LINE__, ##__VA_ARGS__);
#else
#define NSLog(format, ...)
#endif
//16位颜色
#define UIColorFromRGB(rgbValue) [UIColor  colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0  green:((float)((rgbValue & 0xFF00) >> 8))/255.0  blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%s",STRINGIZE_(10));
    NSLog(@"%s",STRINGIZE_());
    NSLog(@"%s",STRINGIZE_(1 r fe 34));
    NSLog(@"%s",haha(21 r fe 34));
    NSString *str      = @"This is a what!";
    NSLog(@"%@", metamacro_concat(st, r));  // This is Ryan!
    NSLog(@"%s",haha(21 r fe 34));
    NSLog(@"11");
    self.title=@"HumanWorld";
    self.navigationController.navigationBar.barTintColor=UIColorFromRGB(0x87CEFA);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)clickFruit:(id)sender{
    FruitVC *vc = [[FruitVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(IBAction)clickNation:(id)sender{
    NationVC *vc = [[NationVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
