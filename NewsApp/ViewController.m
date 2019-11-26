//
//  ViewController.m
//  NewsApp
//
//  Created by lugeek on 2019/11/26.
//  Copyright © 2019 lugeek. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    label.backgroundColor = [UIColor redColor];
    label.text = @"hello";
    [self.view addSubview:label];
}


@end
