//
//  HZTBaseViewController.m
//  DYDemo
//
//  Created by wangxw on 2020/12/9.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTBaseViewController.h"
@interface HZTBaseViewController ()

@end

@implementation HZTBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[HZTThemes getImage:@"nav_back"] style:UIBarButtonItemStylePlain target:self action:@selector(clickBackItem)];
}

-(void)showToast:(NSString *)text{
    MBProgressHUD * mbHud = [MBProgressHUD HUDForView:self.view];
    if (!mbHud) {
        mbHud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        mbHud.mode = MBProgressHUDModeText;
    }
    mbHud.label.text = text;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [mbHud hideAnimated:YES];
    });
}

-(void)clickBackItem{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)addEndEditGesture{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyBoard)];
    tap.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap];
}

-(void)hideKeyBoard{
    [self.view endEditing:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"current vc is %@ ",NSStringFromClass([self class]));
}

-(void)dealloc{
    NSLog(@"current vc is %@ dealloc",NSStringFromClass([self class]));
}

@end
