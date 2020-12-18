//
//  HZTBaseTableListView.m
//  DYDemo
//
//  Created by wangxw on 2020/12/17.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTBaseTableListView.h"

@interface HZTBaseTableListView ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (nonatomic, copy) void(^scrollCallback)(UIScrollView *scrollView);
/**  */
@property (nonatomic,assign) Class theClass;
/**  */
@property (nonatomic,strong) NSArray <HZTBaseTableListLayout *>* datas;
/**  */
@property (nonatomic,assign) BOOL isFromNib;
/**  */
@property(nonatomic,copy) void (^callBack)(NSInteger index);
@end

@implementation HZTBaseTableListView

+(instancetype)create{
    HZTBaseTableListView * view = [[NSBundle mainBundle] loadNibNamed:@"HZTBaseTableListView" owner:nil options:nil].firstObject;
    return view;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self.mainTableView setTableFooterView:[UIView new]];
}

-(void)configDatas:(NSArray <HZTBaseTableListLayout *>*)datas registerClass:(Class)cellClass isFromNib:(BOOL)isFromNib callBack:(void (^)(NSInteger index))callBack{
    self.callBack = callBack;
    self.theClass = cellClass;
    self.datas = datas;
    self.isFromNib = isFromNib;
    [self.mainTableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HZTBaseTableListCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.theClass)];
    if (!cell) {
        if (self.isFromNib) {
            cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.theClass) owner:nil options:nil].firstObject;
        }else{
            cell = [[self.theClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(self.theClass)];
        }
    }
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.datas[indexPath.row].cellH;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(self.callBack) self.callBack(indexPath.row);
}

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

@end
