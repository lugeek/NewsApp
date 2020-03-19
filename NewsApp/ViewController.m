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
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.titleLabel.backgroundColor = [UIColor redColor];
    self.titleLabel.text = @"hello";
    [self.view addSubview:self.titleLabel];
}


@end
