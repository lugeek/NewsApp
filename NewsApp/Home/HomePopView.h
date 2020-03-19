//
//  HomePopView.h
//  NewsApp
//
//  Created by lugeek on 2020/3/11.
//  Copyright © 2020 lugeek. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol HomePopViewDelegate <NSObject>
- (void)dismiss;
@end

@interface HomePopView : UIView
@property(nonatomic, weak)id<HomePopViewDelegate> delegate;
@property(nonatomic, assign)BOOL showing;
-(void)showPop:(CGPoint) point parent:(UIView *)parent deleteClick:(void (^)(void)) deleteClick;
-(void)dismiss;
@end

NS_ASSUME_NONNULL_END
