//
//  BaseViewController.m
//  HumanWorldDemo
//
//  Created by 小雨科技 on 2018/1/17.
//  Copyright © 2018年 jiajianhao. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    serialPGQueue = dispatch_queue_create("com.rylan", DISPATCH_QUEUE_SERIAL);
    
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
 
    // prevent user action before viewDidApperar
    [self.navigationController.view setUserInteractionEnabled:NO];
 
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // restore interaction. Cannt respond back action before viewDidAppear
    [self.navigationController.view setUserInteractionEnabled:YES];
}
#pragma mark -- Setter/Getter
 
#pragma mark -- UIActivityIndicatorView
- (void)showIndicatorView
{
     UIActivityIndicatorView* idView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
     idView.center = CGPointMake(kWidth/2, (kHeight-kNavBarHeightWithStatusBar)/2);
    [idView setHidden:NO];
    self.idView=idView;
    [self.view addSubview:idView];
    [self.idView startAnimating];
}

- (void)hideIndicatorView
{
    if (!self.idView) {
        return;
    }
    [self.idView stopAnimating];
    [self.idView setHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
