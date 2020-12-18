//
//  HZTBaseTableListCell.m
//  DYDemo
//
//  Created by wangxw on 2020/12/18.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTBaseTableListCell.h"

@implementation HZTBaseTableListCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(void)setLayout:(HZTBaseTableListLayout *)layout{
    _layout = layout;
}

@end
