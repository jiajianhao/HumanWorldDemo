//
//  FruitVC.m
//  HumanWorldDemo
//
//  Created by 小雨科技 on 2018/1/17.
//  Copyright © 2018年 jiajianhao. All rights reserved.
//

#import "FruitVC.h"
#import "FruitDataSource.h"
#import "FruitTableViewCell.h"
#import "FruitModel.h"
@interface FruitVC ()<UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) FruitDataSource *dataSource;
@end

@implementation FruitVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    [self configTable];
    
}
-(void)configTable{
    CellConfigureBlock configCell = ^(FruitTableViewCell *cell, FruitModel *fMdeol)
    {
 
        [cell configureWithFruitObj:fMdeol];
        [cell moreActionOnClick:^(Boolean show){
            NSLog(@"1111");
        }];
    };
    FruitDataSource *aDataSource = [[FruitDataSource alloc] initWithCellIdentifier:@"FruitCell" configureCellBlock:configCell];
    self.tableView.dataSource = aDataSource;
    [self setDataSource:aDataSource];
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    __weak typeof(self) weakSelf=self;
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
    [self showIndicatorView];
     dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        __strong typeof(self) strongSelf=weakSelf;
         [strongSelf getMyData];
    });
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -- Request
-(void)getMyData{
    NSMutableArray *arr1 =[[NSMutableArray alloc]init];
    for (int i =0 ; i<20; i++) {
        FruitModel *model = [[FruitModel alloc]init];
        model.name=[NSString stringWithFormat:@"%@",@"Apple"];
        model.count=9000+i;
        model.posterImage=[UIImage imageNamed:@"apple"];
        [arr1 addObject:model];
    }
    self.dataSource.items = arr1;
    [self.tableView reloadData];
    [self hideIndicatorView];

}
#pragma mark -- UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld--%ld",(long)indexPath.section,(long)indexPath.row);
}
#pragma mark -- Setter/Getter
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, kWidth, kHeight-kNavBarHeightWithStatusBar) style:UITableViewStylePlain];
        _tableView.delegate = self;
         [_tableView setBackgroundColor:[UIColor clearColor]];
        [_tableView registerClass:[FruitTableViewCell class] forCellReuseIdentifier:@"FruitCell"];
        _tableView.scrollEnabled= YES;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.sectionHeaderHeight=0;
        _tableView.sectionFooterHeight=0;
 
    }
    return _tableView;
}
 

@end
