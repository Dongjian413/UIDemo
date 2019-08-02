//
//  BarChartView.m
//  DouShanMachine
//
//  Created by 东健 on 2019/8/2.
//  Copyright © 2019 qwang. All rights reserved.
//

#import "BarChartView.h"
#import "BarModel.h"
#import "BarCollectionCell.h"

@interface BarChartView () <UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation BarChartView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.frame = frame;
        _barSpace = 20;
        _bottomTitleFontSize = 13;
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.itemSize = CGSizeMake(BAR_WIDTH, frame.size.height);
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        
        _barCollection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _barCollection.delegate = self;
        _barCollection.dataSource = self;
        _barCollection.backgroundColor = [UIColor clearColor];
        _barCollection.showsVerticalScrollIndicator = NO;
        _barCollection.showsHorizontalScrollIndicator = NO;
        [self addSubview:_barCollection];
        [_barCollection mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        [_barCollection registerClass:[BarCollectionCell class] forCellWithReuseIdentifier:@"BarCollectionCell"];
    }
    return self;
}

- (void)setBarDataArray:(NSArray *)barDataArray
{
    _barDataArray = barDataArray;
    CGFloat maxHeight = ((BarModel *)barDataArray.firstObject).barValue;
    CGFloat maxBarWidth = BAR_WIDTH;
    CGFloat bottomTitleHeight = 0;
    // 找到最大值
    for (BarModel *bar in barDataArray) {
        if (self.animations) {
            bar.animations = self.animations;
        }
        bar.barRadius = self.barRadius;
        bar.bottomTitleFontSize = self.bottomTitleFontSize;
        // 获取最大值
        if (bar.barValue > maxHeight) {
            maxHeight = bar.barValue;
        }
        // 就算只有一个柱子有标题，其他柱子底部仍然会空出相同距离
        if (bar.barBottomTitle.length) {
            CGSize textSize = [bar.barBottomTitle sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:self.bottomTitleFontSize]}];
            if (textSize.width + 10 > maxBarWidth) {
                maxBarWidth = textSize.width + 10;
            }
            if (textSize.height > bottomTitleHeight) {
                bottomTitleHeight = textSize.height;
            }
        }
    }
    
    // 算出柱子的值与总高度之前的比例
    for (BarModel *bar in barDataArray) {
        bar.barScale = bar.barValue * 1.0 / ((maxHeight) * 1.0);
        // 标题过长时，增加柱子所在cell的宽度，柱子本身宽度不变
        bar.barBottomTitleWidth = maxBarWidth;
        bar.barBottomTitleHeight = bottomTitleHeight;
    }
    [self.barCollection reloadData];
}

#pragma mark -
#pragma mark - UICollectionViewDelegate UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.barDataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BarModel *barModel = self.barDataArray[indexPath.row];
    BarCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BarCollectionCell" forIndexPath:indexPath];
    cell.barData = barModel;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    BarModel *showModel = self.barDataArray[indexPath.row];
    NSLog(@"%f",showModel.barValue);
}

//cell的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    BarModel *showModel = self.barDataArray[indexPath.row];
    return CGSizeMake(showModel.barBottomTitleWidth, self.frame.size.height);
}

//定义每个section四边间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0,self.barSpace,0,self.barSpace);
}

// 两行cell之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return self.barSpace;
}

// 两列cell之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return self.barSpace;
}


@end
