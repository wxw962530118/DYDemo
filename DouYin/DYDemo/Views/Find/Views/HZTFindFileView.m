//
//  HZTFindFileView.m
//  DYDemo
//
//  Created by wangxw on 2020/12/17.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTFindFileView.h"

@interface HZTFindFileView ()
/**  */
@property (nonatomic,strong) UIImageView * imageView;

@end

@implementation HZTFindFileView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        self.imageView.userInteractionEnabled = YES;
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView.clipsToBounds = YES;
        [self.imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickView)]];
        [self addSubview:self.imageView];
    }
    return self;
}

-(void)setModel:(HZTFilesModel *)model{
    _model = model;
    if (model.isAdd) {
        self.imageView.backgroundColor = [UIColor redColor];
        self.imageView.image = nil;
    }else{
        self.imageView.backgroundColor = [UIColor yellowColor];
        self.imageView.image = model.thumnailImage;
    }
}

-(void)clickView{
    if(self.clickTheView) self.clickTheView(self.model);
}

@end
