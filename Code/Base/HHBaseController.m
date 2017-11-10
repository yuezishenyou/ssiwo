//
//  HHBaseController.m
//  ssiwo
//
//  Created by maoziyue on 2017/11/9.
//  Copyright © 2017年 maoziyue. All rights reserved.
//

#import "HHBaseController.h"

#define FBStatusBarH ([UIApplication sharedApplication].statusBarFrame.size.height)
#define FBNavigationBarH (FBStatusBarH + 44)

@interface HHBaseController ()

@end

@implementation HHBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}




- (void)setNavigationController
{
    UIView *navBarView = [[UIView alloc] init];
    navBarView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, FBNavigationBarH);
    navBarView.backgroundColor = [UIColor colorWithRed:38 / 255.0 green:41 / 255.0 blue:48 / 255.0 alpha:1.0];
    [self.view addSubview:navBarView];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(0, FBStatusBarH, [UIScreen mainScreen].bounds.size.width, 44);
    titleLabel.text = @"很好的上测滑";
    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.textColor = [UIColor colorWithRed:222 / 255.0 green:91 / 255.0 blue:78 / 255.0 alpha:1.0];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [navBarView addSubview:titleLabel];
    
    UIButton *profileButton = [[UIButton alloc] init];
    [profileButton setImage:[UIImage imageNamed:@"navigationbar_list_normal"] forState:UIControlStateNormal];
    [profileButton setImage:[UIImage imageNamed:@"navigationbar_list_hl"] forState:UIControlStateHighlighted];
    profileButton.frame = CGRectMake(0, FBNavigationBarH - 44, 80, 44);
    [profileButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    profileButton.imageEdgeInsets = UIEdgeInsetsMake(0, -35, 0, 0);
    profileButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [navBarView addSubview:profileButton];
    profileButton.backgroundColor = [UIColor redColor];
    
    // 右边按钮
    UIButton *searchButton = [[UIButton alloc] init];
    [searchButton setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    [searchButton setImage:[UIImage imageNamed:@"search_down"] forState:UIControlStateHighlighted];
    searchButton.frame = CGRectMake(0, 0, 44, 44);
    [searchButton addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];

    UIButton *msgButton = [[UIButton alloc] init];
    [msgButton setImage:[UIImage imageNamed:@"notification"] forState:UIControlStateNormal];
    [msgButton setImage:[UIImage imageNamed:@"notification_down"] forState:UIControlStateHighlighted];
    msgButton.frame = CGRectMake(44, 0, 44, 44);
    [msgButton addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];

    UIView *rightView = [[UIView alloc] init];
    rightView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 88 - 5, FBStatusBarH, 88, 44);
    [rightView addSubview:searchButton];
    [rightView addSubview:msgButton];
    [navBarView addSubview:rightView];

    searchButton.backgroundColor = [UIColor greenColor];
    msgButton.backgroundColor = [UIColor blueColor];
}

- (void)backClick
{
    
}

- (void)rightClick
{
    
}

































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
