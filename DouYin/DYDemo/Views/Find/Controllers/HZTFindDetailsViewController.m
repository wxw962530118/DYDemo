//
//  HZTFindDetailsViewController.m
//  DYDemo
//
//  Created by wangxw on 2020/12/17.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTFindDetailsViewController.h"
#import "HZTBaseTableListView.h"
#import "HZTFindDetailsSectionView.h"
#import "HZTFindListCell.h"
#import "HZTCommentListCell.h"
#import "HZTGiftListCell.h"
#import <IQKeyboardManager.h>
@interface HZTFindDetailsViewController ()
/**  */
@property (nonatomic,strong) HZTFindDetailsSectionView * sectionView;
/**  */
@property (nonatomic,strong) HZTBaseTableListView * commentTableView;
/**  */
@property (nonatomic,strong) NSMutableArray <HZTBaseTableListLayout *>* commentDatas;
/**  */
@property (nonatomic,strong) NSMutableArray <HZTBaseTableListLayout *>* giftDatas;
/**  */
@property (nonatomic,strong) HZTBaseTableListView * giftTableView;
/***/
@property (nonatomic, strong) UIView * headerView;
/**  */
@property (nonatomic,strong) HZTFindListCell * topCell;
/***/
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
/***/
@property (weak, nonatomic) IBOutlet UIView *sendView;
/***/
@property (weak, nonatomic) IBOutlet UITextField *textField;
/***/
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;
@end

@implementation HZTFindDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addObservers];
    [self configInfo];
    [super loadSubView];
    self.sectionView.listContainer = self.listContainer;
    self.topCell.layout = self.layout;
    [self.view bringSubviewToFront:self.sendView];
}

-(void)hideKeyBoard{
    [self.view endEditing:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    [IQKeyboardManager sharedManager].enable = NO;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = NO;
}

-(void)addObservers{
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(KeyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(KeyboardHide:) name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark --- 键盘弹出/收起
-(void)KeyboardShow:(NSNotification *)noti{
    CGRect keyboardRect = [[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.bottomConstraint.constant = CGRectGetHeight(keyboardRect)-SafeAreaBottom();
    [self.view layoutIfNeeded];
}

-(void)KeyboardHide:(NSNotification *)noti{
    self.bottomConstraint.constant = 0;
    [self.view layoutIfNeeded];
}

-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, self.layout.cellH)];
        _topCell = [[NSBundle mainBundle] loadNibNamed:@"HZTFindListCell" owner:nil options:nil].firstObject;
        _topCell.frame = _headerView.bounds;
        [_headerView addSubview:_topCell];
    }
    return _headerView;
}

-(HZTFindDetailsSectionView *)sectionView{
    if (!_sectionView) {
        _sectionView = [HZTFindDetailsSectionView create];
        _sectionView.titles = @[@"评论",@"礼物"];
        _sectionView.frame = CGRectMake(0, 0, kScreenW, 50);
    }
    return _sectionView;
}

-(void)configInfo{
    self.navigationItem.title = @"动态详情";
    self.isHiddenNav = YES;
    self.bottomMargin = 60+SafeAreaBottom();
    [self prepareDatas];
    self.pagerSectionView = self.sectionView;
    self.pagerSectionViewH = self.sectionView.height;
    self.pagerHeaderView = self.headerView;
    self.pagerHeaderViewH = ceil(self.layout.cellH);
    self.categoryTitles = self.sectionView.titles;
    self.pagerViews = @[self.commentTableView,self.giftTableView];
}

#pragma mark --- 这里目前是测试数据 需替换为服务器真实数据
-(void)prepareDatas{
    for (int i =0; i<5; i++) {
        HZTBaseTableListLayout * layout = [HZTBaseTableListLayout new];
        layout.cellH = 100;
        [self.commentDatas addObject:layout];
    }
    
    for (int i =0; i<10; i++) {
        HZTBaseTableListLayout * layout = [HZTBaseTableListLayout new];
        layout.cellH = 50;
        [self.giftDatas addObject:layout];
    }
}

-(HZTBaseTableListView *)commentTableView{
    if (!_commentTableView) {
        _commentTableView = [HZTBaseTableListView create];
        [_commentTableView configDatas:self.commentDatas registerClass:[HZTCommentListCell class] isFromNib:YES callBack:^(NSInteger index) {
            NSLog(@"current index is :%ld",index);
        }];
    }
    return _commentTableView;
}

-(HZTBaseTableListView *)giftTableView{
    if (!_giftTableView) {
        _giftTableView = [HZTBaseTableListView create];
        [_giftTableView configDatas:self.giftDatas registerClass:[HZTGiftListCell class] isFromNib:YES callBack:^(NSInteger index) {
            NSLog(@"current index is :%ld",index);
        }];
    }
    return _giftTableView;
}

-(NSMutableArray *)commentDatas{
    if (!_commentDatas) {
        _commentDatas = [NSMutableArray new];
    }
    return _commentDatas;
}

-(NSMutableArray *)giftDatas{
    if (!_giftDatas) {
        _giftDatas = [NSMutableArray new];
    }
    return _giftDatas;
}

- (IBAction)clickSendBtn:(id)sender {
    [self hideKeyBoard];
    NSLog(@"current send text is:%@",self.textField.text);
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
