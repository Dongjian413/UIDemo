//
//  BarView.m
//  DouShanMachine
//
//  Created by 东健 on 2019/8/2.
//  Copyright © 2019 qwang. All rights reserved.
//

#import "BarView.h"
#import "BarModel.h"

@interface BarView () <UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation BarView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        _barCollection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _barCollection.delegate = self;
        _barCollection.dataSource = self;
        _barCollection.backgroundColor = [UIColor clearColor];
        _barCollection.showsVerticalScrollIndicator = NO;
        _barCollection.showsHorizontalScrollIndicator = NO;
        
        
        [_barCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    }
    return self;
}

- (void)setBarDataModel:(BarModel *)barDataModel
{
    _barDataModel = barDataModel;
    if (barDataModel.subBarModel.count) {
        if (_barCollection.superview == nil) {
            [self addSubview:_barCollection];
            [_barCollection mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
            }];
        }
        
        CGFloat maxHeight = ((BarModel *)barDataModel).barValue;
        // 算出柱子的值与总高度之前的比例
        for (BarModel *bar in barDataModel.subBarModel) {
            bar.barScale = bar.barValue * 1.0 / ((maxHeight) * 1.0);
        }
        [self.barCollection reloadData];
    }
}

#pragma mark -
#pragma mark - UICollectionViewDelegate UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.barDataModel.subBarModel.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BarModel *barModel = self.barDataModel.subBarModel[indexPath.row];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.contentView.backgroundColor = barModel.barColor;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    BarModel *showModel = self.barDataModel.subBarModel[indexPath.row];
    NSLog(@"%f",showModel.barValue);
}

//cell的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    BarModel *showModel = self.barDataModel.subBarModel[indexPath.row];
    return CGSizeMake(self.frame.size.width, self.superBarHeight * showModel.barScale);
}

//定义每个section四边间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0,0,0,0);
}

@end
