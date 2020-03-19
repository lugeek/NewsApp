//
//  HomeViewCell.m
//  NewsApp
//
//  Created by lugeek on 2020/3/10.
//  Copyright © 2020 lugeek. All rights reserved.
//

#import "HomeViewCell.h"
#import "HomePopView.h"

@interface HomeViewCell()

@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *sourceLabel;
@property (nonatomic, strong)UILabel *commentLabel;
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UIImageView *rightImage;
@property (nonatomic, strong)UIButton *deleteButton;

@end

@implementation HomeViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI
{
    [self.contentView addSubview:({
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel;
    })];
    [self.contentView addSubview:({
        self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 75, 50, 20)];
        self.sourceLabel.font = [UIFont systemFontOfSize:12];
        self.sourceLabel.textColor = [UIColor grayColor];
        self.sourceLabel;
    })];
    [self.contentView addSubview:({
        self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 75, 50, 20)];
        self.commentLabel.font = [UIFont systemFontOfSize:12];
        self.commentLabel.textColor = [UIColor grayColor];
        self.commentLabel;
    })];
    [self.contentView addSubview:({
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 75, 50, 20)];
        self.timeLabel.font = [UIFont systemFontOfSize:12];
        self.timeLabel.textColor = [UIColor grayColor];
        self.timeLabel;
    })];
    [self.contentView addSubview:({
        self.rightImage = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.rightImage.image = [UIImage imageNamed:@"detail"];
        self.rightImage.userInteractionEnabled = YES;
        [self.rightImage addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickButton)]];
        self.rightImage;
    })];
    [self.contentView addSubview:({
        self.deleteButton = [[UIButton alloc] initWithFrame:CGRectZero];
        self.deleteButton.layer.cornerRadius = 8;
        self.deleteButton.layer.borderColor = [UIColor grayColor].CGColor;
        self.deleteButton.layer.borderWidth = 1;
        [self.deleteButton setTitle:@"哈哈哈" forState:UIControlStateNormal];
        self.deleteButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [self.deleteButton addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
        self.deleteButton;
    })];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.frame = CGRectMake(12, 12, self.contentView.frame.size.width - 12 - 100, 60);
    self.rightImage.frame = CGRectMake(self.contentView.frame.size.width - 100 + 10, 12, 80, 80);
    [self.deleteButton sizeToFit];
    self.deleteButton.frame = CGRectMake(self.contentView.frame.size.width - 100 - self.deleteButton.frame.size.width - 10, 70, self.deleteButton.frame.size.width, self.deleteButton.frame.size.height);
    
    [self.sourceLabel sizeToFit];
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 12, self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + 12, self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
}

- (void) configCell
{
    self.titleLabel.text = @"主标题主标题主标题主标题主标题主标题主标题主标题";
    self.sourceLabel.text = @"来源";
    
    self.commentLabel.text = @"评论";
    
    self.timeLabel.text = @"时间";
    
    [self.deleteButton setTitle:@"❌" forState:UIControlStateNormal];
    [self.deleteButton setTitle:@"✅" forState:UIControlStateHighlighted];
    
    [self setNeedsLayout];
}
- (void) showAlert
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"标题" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:confirm];
    [alert addAction:cancel];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
}

- (void) clickButton
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(btnClickWithCell:button:)]) {
        [self.delegate btnClickWithCell:self button:self.deleteButton];
    }
}

@end
