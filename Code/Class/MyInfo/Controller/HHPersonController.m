//
//  HHPersonController.m
//  ssiwo
//
//  Created by maoziyue on 2017/11/9.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "HHPersonController.h"
#import "HHMyTripController.h"
#import "DejActivityView.h"

@interface HHPersonController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tbView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation HHPersonController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self initSubViews];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initData];
    
    [self loadData];
}

- (void)loadData
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [DejActivityView activityViewForView:window withLabel:@"正在加载"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [DejActivityView removeView];
        
        [self.dataSource addObject:@"aa"];
        [self.dataSource addObject:@"bb"];
        [self.tbView reloadData];

    });
}


- (void)initData
{
    self.dataSource = [[NSMutableArray alloc]init];
    
    [self.dataSource addObject:@"行程"];
    [self.dataSource addObject:@"钱包"];
    [self.dataSource addObject:@"设置"];
}


- (void)initSubViews
{
    self.tbView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.tbView.delegate = self;
    
    self.tbView.dataSource = self;
    
    self.tbView.rowHeight = 70;
    
    [self.view addSubview:self.tbView];
}


#pragma mark --delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    HHMyTripController *vc = [[HHMyTripController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}





@end
