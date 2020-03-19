//
//  HomeRequest.m
//  NewsApp
//
//  Created by lugeek on 2020/3/19.
//  Copyright © 2020 lugeek. All rights reserved.
//

#import "HomeRequest.h"

@implementation HomeRequest

- (void) loadData
{
    NSURL *url = [NSURL URLWithString:@"http://www.mocky.io/v2/5e73391b300000c8412e6308"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"");
    }];
    [task resume];
}

@end
