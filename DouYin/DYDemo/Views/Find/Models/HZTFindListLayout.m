//
//  HZTFindListLayout.m
//  DYDemo
//
//  Created by wangxw on 2020/12/9.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTFindListLayout.h"

@implementation HZTFindListLayout

-(void)prepareLayout{
    self.cellH = 80;
    if (self.listModel.text.length>0) {
        self.cellH += 10;
        self.cellH += [HZTUtils getHeightWithString:self.listModel.text width:kScreenW-2*self.leftPading font:[UIFont systemFontOfSize:15]];
    }
    if (self.listModel.files.count>0) {
        self.cellH += 10;
        CGRect lastFileRect = [self.listModel.files.lastObject.rectValue CGRectValue];
        self.cellH += CGRectGetMaxY(lastFileRect);
    }
    self.cellH += 10;
    self.cellH += 40;
    self.cellH += 10;
    self.cellH += 10;
}

@end
