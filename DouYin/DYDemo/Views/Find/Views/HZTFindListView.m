//
//  HZTFindListView.m
//  DYDemo
//
//  Created by wangxw on 2020/12/9.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTFindListView.h"
#import "HZTFindListLayout.h"
#import "HZTFindListCell.h"
#import "HZTFindDetailsViewController.h"
@interface HZTFindListView ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (nonatomic, copy) void(^scrollCallback)(UIScrollView *scrollView);
/**  */
@property (nonatomic,strong) NSMutableArray <HZTFindListLayout *>* contentArr;
@end

@implementation HZTFindListView

+(instancetype)createView{
    HZTFindListView * view = [[NSBundle mainBundle] loadNibNamed:@"HZTFindListView" owner:nil options:nil].firstObject;
    return view;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self prepareListData];
    [self.mainTableView reloadData];
}

-(void)prepareListData{
    int oneLineCnt = 3;
    CGFloat leftPading = 15;
    CGFloat rightPading = 15;
    CGFloat marginH = 15;
    CGFloat fileW = ((kScreenW-(leftPading + rightPading))-(oneLineCnt-1)*marginH)/oneLineCnt;
    CGFloat fileH = fileW;
    CGFloat x = 0;
    CGFloat y = 0;
    for (int i =0; i<20; i++) {
        HZTFindListLayout * layout = [HZTFindListLayout new];
        layout.leftPading = leftPading;
        layout.rightPading = rightPading;
        layout.marginV = 15;
        layout.marginH = marginH;
        HZTFindListModel * listModel = [HZTFindListModel new];
        listModel.text = @"3130-1391-093102\nweqweqeqweeq\n哈哈哈哈哈哈哈<(*￣▽￣*)/";
        if (i%2==0) {
            NSMutableArray <HZTMediaFileModel *>* tempArr = [NSMutableArray new];
            for (int j =0; j<arc4random()%50; j++) {
                x = (j % oneLineCnt)*fileW + (j % oneLineCnt) * layout.marginH;
                y = (j / oneLineCnt)*fileH + (j / oneLineCnt) * layout.marginV;
                HZTMediaFileModel * fileModel = [HZTMediaFileModel new];
                fileModel.width = fileW;
                fileModel.height = fileH;
                fileModel.rectValue = [NSValue valueWithCGRect:CGRectMake(x, y,fileW, fileH)];
                [tempArr addObject:fileModel];
            }
            listModel.files = tempArr;
        }
        layout.listModel = listModel;
        [layout prepareLayout];
        [self.contentArr addObject:layout];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.contentArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HZTFindListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"HZTFindListCell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"HZTFindListCell" owner:nil options:nil].firstObject;
    }
    cell.isHiddenLine = self.contentArr.count-1==indexPath.row;
    cell.layout = self.contentArr[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HZTFindListLayout * layout = self.contentArr[indexPath.row];
    HZTFindDetailsViewController * vc = [HZTFindDetailsViewController new];
    vc.layout = layout;
    [AppDelegate pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.contentArr[indexPath.row].cellH;
}

#pragma mark --- JXPagerViewListViewDelegate
- (UIView *)listView {
    return self;
}

- (UIScrollView *)listScrollView {
    return self.mainTableView;
}

- (void)listViewDidScrollCallback:(void (^)(UIScrollView *))callback {
    self.scrollCallback = callback;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    !self.scrollCallback ?: self.scrollCallback(scrollView);
}

-(NSMutableArray *)contentArr{
    if (!_contentArr) {
        _contentArr = [NSMutableArray new];
    }
    return _contentArr;
}

@end
