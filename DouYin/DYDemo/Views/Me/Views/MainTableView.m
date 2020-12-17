//
//  MainTableView.m
//  DYDemo
//
//  Created by wangxw on 2020/7/14.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "MainTableView.h"

@interface MainTableView ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (nonatomic, copy) void(^scrollCallback)(UIScrollView *scrollView);
@end

@implementation MainTableView

+(instancetype)createView{
    MainTableView * view = [[NSBundle mainBundle] loadNibNamed:@"MainTableView" owner:nil options:nil].firstObject;
    return view;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self.mainTableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UITableViewCell new];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
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
