//
//  MainCollectionView.m
//  DYDemo
//
//  Created by wangxw on 2020/7/14.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "MainCollectionView.h"
#import "HZTMeProfileViewController.h"
@interface MainCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    CGFloat _itemW;
    CGFloat _itemH;
}
@property (weak, nonatomic) IBOutlet UICollectionView *mainCollectionView;
@property (nonatomic, copy) void(^scrollCallback)(UIScrollView *scrollView);
@end

@implementation MainCollectionView

+(instancetype)createView{
    MainCollectionView * view = [[NSBundle mainBundle] loadNibNamed:@"MainCollectionView" owner:nil options:nil].firstObject;
    return view;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    int cnt = 3;
    float lineSpace = 2;
    float scaleWH = 1.3;
    _itemW = ([UIScreen mainScreen].bounds.size.width-(cnt-1)*lineSpace)/3.0;
    _itemH = _itemW*scaleWH;
    self.mainCollectionView.delegate = self;
    self.mainCollectionView.dataSource = self;
    [self.mainCollectionView registerClass:NSClassFromString(@"UICollectionViewCell") forCellWithReuseIdentifier:@"UICollectionViewCell"];
}

-(void)setCount:(NSInteger)count{
    _count = count;
    [self.mainCollectionView reloadData];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(_itemW, _itemH);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HZTMeProfileViewController * vc = [HZTMeProfileViewController new];
    [AppDelegate pushViewController:vc animated:YES];
}

- (UIView *)listView {
    return self;
}

- (UIScrollView *)listScrollView {
    return self.mainCollectionView;
}

- (void)listViewDidScrollCallback:(void (^)(UIScrollView *))callback {
    self.scrollCallback = callback;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    !self.scrollCallback ?: self.scrollCallback(scrollView);
}

@end
