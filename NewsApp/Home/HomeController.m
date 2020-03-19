//
//  HomeController.m
//  NewsApp
//
//  Created by lugeek on 2019/11/27.
//  Copyright © 2019 lugeek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeController.h"
#import "ViewController.h"
#import "HomeViewCell.h"
#import "NewsDetailController.h"
#import "HomePopView.h"

@interface HomeController () <UITableViewDataSource, UITableViewDelegate, HomeViewCellDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) HomePopView *popView;

@end

@implementation HomeController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"首页";
        self.tabBarItem.image = [UIImage imageNamed:@"tab_home"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_home"];
        
        self.dataArray = [NSMutableArray new];
        for (int i = 0; i < 40; i++) {
            [self.dataArray addObject:@(i)];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsDetailController *controller = [[NewsDetailController alloc] init];
    controller.title = [NSString stringWithFormat:@"详情 - %@", @(indexPath.row)];
    [self.navigationController pushViewController:controller animated:YES];
    if (self.popView != nil && self.popView.showing) {
        [self.popView dismiss];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.popView != nil && self.popView.showing) {
        [self.popView dismiss];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[HomeViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.delegate = self;
    }
    [cell configCell];
    return cell;
}

#pragma mark - HomeViewCellDelegate
- (void)btnClickWithCell:(UITableViewCell *)cell button:(UIButton *)btn
{
    CGRect rect = [cell convertRect:btn.frame toView:self.tableView];
    if (self.popView == nil) {
        self.popView = [[HomePopView alloc] initWithFrame:CGRectZero];
    }
    if (self.popView.showing) {
        [self.popView dismiss];
    }
    __weak typeof(self) wself = self;
    [self.popView showPop:rect.origin parent:self.tableView deleteClick:^{
        __strong typeof(self) strongself = self;
        [strongself.dataArray removeLastObject];
        [strongself.tableView deleteRowsAtIndexPaths:@[[strongself.tableView indexPathForCell:cell]]
                              withRowAnimation:UITableViewRowAnimationBottom];
    }];
}

@end
