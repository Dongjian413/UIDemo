//
//  BarCollectionCell.m
//  DouShanMachine
//
//  Created by 东健 on 2019/8/2.
//  Copyright © 2019 qwang. All rights reserved.
//

#import "BarCollectionCell.h"
#import "BarModel.h"
#import "BarView.h"

#define Space 5
#define TopTitle 16
#define AnimationTime 0.5

@interface BarCollectionCell ()
@property (nonatomic, strong) BarView *barView;
@property (nonatomic, strong) UILabel *bottomTitleLabel;
@property (nonatomic, strong) UILabel *topLabel;
@end

@implementation BarCollectionCell

- (void)setBarData:(BarModel *)barData
{
    _barData = barData;
    _barView.superBarHeight = (self.bounds.size.height - barData.barBottomTitleHeight - Space - TopTitle) * barData.barScale;
    _barView.barDataModel = barData;
    _barView.backgroundColor = barData.barColor;
    if (barData.barRadius) {
        _barView.layer.cornerRadius = barData.barRadius;
        _barView.layer.masksToBounds = YES;
    }
    _bottomTitleLabel.text = barData.barBottomTitle;
    _bottomTitleLabel.font = [UIFont systemFontOfSize:barData.bottomTitleFontSize];
    _topLabel.text = [NSString stringWithFormat:@"%@",@(barData.barValue)];
    
    weakSelfs;
    if (barData.animations) {
        [self.contentView layoutIfNeeded];
        [UIView animateWithDuration:AnimationTime animations:^{
            [weakSelf.barView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(weakSelf.contentView.mas_centerX);
                make.bottom.equalTo(weakSelf.bottomTitleLabel.mas_top).offset(-Space);
                make.width.offset(BAR_WIDTH);
                make.height.offset(weakSelf.barView.superBarHeight);
            }];
            [weakSelf.contentView layoutIfNeeded];
        }];
    } else {
        [weakSelf.barView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(weakSelf.contentView.mas_centerX);
            make.bottom.equalTo(weakSelf.bottomTitleLabel.mas_top).offset(-Space);
            make.width.offset(BAR_WIDTH);
            make.height.offset(weakSelf.barView.superBarHeight);
        }];
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews
{
    _bottomTitleLabel = [[UILabel alloc] init];
    _bottomTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_bottomTitleLabel];
    [_bottomTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(0);
        make.right.equalTo(self.contentView.mas_right).offset(0);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
    }];
    
    _barView = [[BarView alloc] init];
    [self.contentView addSubview:_barView];
    [_barView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.bottom.equalTo(self.bottomTitleLabel.mas_top).offset(-Space);
        make.width.offset(BAR_WIDTH);
        make.height.offset(0.1);
    }];
    
    _topLabel = [[UILabel alloc] init];
    _topLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_topLabel];
    [_topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(0);
        make.right.equalTo(self.contentView.mas_right).offset(0);
        make.bottom.equalTo(self.barView.mas_top).offset(0);
    }];
}




@end
