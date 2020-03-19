//
//  HomeViewCell.h
//  NewsApp
//
//  Created by lugeek on 2020/3/10.
//  Copyright © 2020 lugeek. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HomeViewCellDelegate <NSObject>
- (void) btnClickWithCell:(UITableViewCell *)cell button:(UIButton *)btn;
@end

@interface HomeViewCell : UITableViewCell
@property(nonatomic, weak)id<HomeViewCellDelegate> delegate;
- (void)configCell;
@end

NS_ASSUME_NONNULL_END
