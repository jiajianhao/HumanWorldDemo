//
//  NationVC.m
//  HumanWorldDemo
//
//  Created by 小雨科技 on 2018/1/18.
//  Copyright © 2018年 jiajianhao. All rights reserved.
//

#import "NationVC.h"
#import "NationCell.h"
#import "NationModel.h"
#import "NationDataSource.h"
@interface NationVC ()<UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectView;
@property (nonatomic, strong) NationDataSource *dataSource;
@end

@implementation NationVC
#pragma mark -- Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.collectView];
     [self configView];
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
-(void)configView{
 
    CellConfigureBlock configureCell = ^(NationCell *cell, NationModel* model)
    {
        NSLog(@"%@-%lu",model.name,model.count);
        [cell configureForModel:model];
    };
    
    NationDataSource *pDataSource = [[NationDataSource alloc] initWithCellIdentifier:@"NationCell" configureCellBlock:configureCell];
    self.collectView.dataSource = pDataSource;
    [self setDataSource:pDataSource];
    
 }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -- Request
-(void)getMyData{
    NSMutableArray *arr1 =[[NSMutableArray alloc]init];
    for (int i =0 ; i<10; i++) {
        NationModel *model = [[NationModel alloc]init];
        model.name=[NSString stringWithFormat:@"%@",@"China"];
        model.count= 1;
        model.posterImage=[UIImage imageNamed:@"China"];
        [arr1 addObject:model];
    }
    self.dataSource.items = arr1;
    [self.collectView reloadData];
    [self hideIndicatorView];

}
#pragma mark - CollectionView Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%lu",indexPath.row);
}
#pragma mark -- Serter/Getter
-(UICollectionView *)collectView{
    if (!_collectView) {
        UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc] init];
        [layout setItemSize:CGSizeMake(kWidth/2-10,(kWidth/2-10)/996*878)];
        _collectView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight-kNavBarHeightWithStatusBar) collectionViewLayout:layout];
        _collectView.backgroundColor = [UIColor whiteColor];
        _collectView.delegate = self;
        
        // 注册cell、sectionHeader、sectionFooter
//        [_collectView registerClass:[NationCell class] forCellWithReuseIdentifier:@"NationCell"];
        [_collectView registerNib:[UINib nibWithNibName:@"NationCell" bundle:nil] forCellWithReuseIdentifier:@"NationCell"];

    }
    return _collectView;
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
