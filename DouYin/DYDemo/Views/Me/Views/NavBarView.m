//
//  NavBarView.m
//  DYDemo
//
//  Created by wangxw on 2020/7/14.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "NavBarView.h"

@interface NavBarView ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *setBtn;
@end

@implementation NavBarView
+(instancetype)createView{
    NavBarView * view = [[NSBundle mainBundle] loadNibNamed:@"NavBarView" owner:nil options:nil].firstObject;
    return view;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    self.setBtn.layer.cornerRadius = 20;
    self.titleLabel.alpha = 0;
    self.contentView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
    self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
}

- (void)scrollViewDidScroll:(CGFloat)contentOffsetY {
    CGFloat percent = contentOffsetY/self.height;
    percent = MAX(0, MIN(1, percent));
    self.titleLabel.alpha = percent;
}

@end
