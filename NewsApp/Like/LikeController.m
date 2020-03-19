//
//  LikeController.m
//  NewsApp
//
//  Created by lugeek on 2020/3/1.
//  Copyright © 2020 lugeek. All rights reserved.
//

#import "LikeController.h"

@interface LikeController ()

@property (nonatomic, strong)UIScrollView *scrollView;

@end

@implementation LikeController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"喜欢";
        self.tabBarItem.image = [UIImage imageNamed:@"star"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"star"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.scrollView];
    
}

#pragma mark - getter
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        NSArray *colorArray = @[[UIColor redColor], [UIColor blueColor], [UIColor greenColor], [UIColor yellowColor], [UIColor purpleColor]];
        for (NSInteger i = 0; i < 5; i++) {
            [_scrollView addSubview:({
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(_scrollView.bounds.size.width * i, 0, _scrollView.bounds.size.width, _scrollView.bounds.size.height)];
                view.backgroundColor = colorArray[i];
                view;
            })];
        }
        _scrollView.contentSize = CGSizeMake(_scrollView.bounds.size.width * 5, _scrollView.bounds.size.height);
    }
    return _scrollView;
}

@end
