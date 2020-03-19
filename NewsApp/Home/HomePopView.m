//
//  HomePopView.m
//  NewsApp
//
//  Created by lugeek on 2020/3/11.
//  Copyright © 2020 lugeek. All rights reserved.
//

#import "HomePopView.h"

@interface HomePopView()

@property(nonatomic, strong) UIView *contentView;
@property(nonatomic, strong) void (^deleteClick)(void);

@end

@implementation HomePopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor purpleColor];
        self.showing = NO;
        
        [self addSubview:({
            self.contentView = [[UIView alloc] initWithFrame:CGRectZero];
            self.contentView.backgroundColor = [UIColor grayColor];
            [self.contentView addGestureRecognizer:({
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(delete)];
                tap;
            })];
            self.contentView;
        })];
    }
    return self;
}

-(void)showPop:(CGPoint) point parent:(UIView *)parent deleteClick:(void (^)(void)) deleteClick
{
    self.frame = CGRectMake(point.x - 100, point.y, 100, 100);
    self.deleteClick = deleteClick;
    CGRect fromRect = CGRectMake(point.x, point.y, 0, 0);
    CGRect toRect = CGRectMake(point.x - 100, point.y, 100, 100);
    [parent addSubview:self];
    self.contentView.frame = CGRectMake(100, 0, 0, 0);
    [UIView animateWithDuration:1.f animations:^{
        self.contentView.frame = CGRectMake(0, 0, 100, 100);
    }];
    self.showing = YES;
}

-(void)dismiss
{
    [self removeFromSuperview];
    self.showing = NO;
}

-(void)delete
{
    if (self.deleteClick) {
        self.deleteClick();
    }
    [self dismiss];
}

@end
