//
//  MineController.m
//  NewsApp
//
//  Created by lugeek on 2020/3/1.
//  Copyright © 2020 lugeek. All rights reserved.
//

#import "UserController.h"

@interface UserController ()

@end

@implementation UserController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"我的";
        self.tabBarItem.image = [UIImage imageNamed:@"tab_user"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_user"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
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
