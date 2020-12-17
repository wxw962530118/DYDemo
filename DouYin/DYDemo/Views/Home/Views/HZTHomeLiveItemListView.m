//
//  HZTHomeLiveItemListView.m
//  DYDemo
//
//  Created by wangxw on 2020/12/10.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTHomeLiveItemListView.h"
#import "MJRefreshNormalHeader.h"
@interface HZTHomeLiveItemListView ()<UICollectionViewDelegate,UICollectionViewDataSource>{
    CGFloat  _itemWH;
}
@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionView;
@end

@implementation HZTHomeLiveItemListView
+(instancetype)createView{
    HZTHomeLiveItemListView * view = [[NSBundle mainBundle] loadNibNamed:@"HZTHomeLiveItemListView" owner:nil options:nil].firstObject;
    return view;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self.mainCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    self.mainCollectionView.delegate = self;
    self.mainCollectionView.dataSource = self;
    [self prepareListData];
    [self.mainCollectionView reloadData];
    self.mainCollectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.mainCollectionView.mj_header endRefreshing];
        });
    }];
}

-(void)prepareListData{
    int ontLineCnt = IS_PAD ? 4 : 2;
    _itemWH = (kScreenW-(ontLineCnt+1)*15)/ontLineCnt;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.layer.cornerRadius = 15;
    cell.layer.masksToBounds = YES;
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(_itemWH ,_itemWH);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                       layout:(UICollectionViewLayout *)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(15,15, 15, 15);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 15;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 15;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(self.scrollCallback) self.scrollCallback(scrollView);
}

- (UIView *)listView {
    return self;
}

@end
