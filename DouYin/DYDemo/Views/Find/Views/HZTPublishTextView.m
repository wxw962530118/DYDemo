//
//  HZTPublishTextView.m
//  DYDemo
//
//  Created by wangxw on 2020/12/17.
//  Copyright © 2020 wangxw. All rights reserved.
//

#import "HZTPublishTextView.h"

@interface HZTPublishTextView ()
@property (weak, nonatomic) IBOutlet UITextView *mianTextView;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *remindLabel;
@property (nonatomic,copy) NSString * realText;
@end
@implementation HZTPublishTextView

+(instancetype)create{
    HZTPublishTextView * view = [[NSBundle mainBundle] loadNibNamed:@"HZTPublishTextView" owner:nil options:nil].firstObject;
    return view;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    self.remindLabel.text = [NSString stringWithFormat:@"%d/%d字",0,self.maxLen>0?self.maxLen:100];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledEditChanged:) name:@"UITextViewTextDidChangeNotification" object:self.mianTextView];
}

-(void)textFiledEditChanged:(NSNotification *)obj{
    UITextField * textField = (UITextField *)obj.object;
    [self handleTextChangedWithTextField:textField isTextView:[obj.object isKindOfClass:[UITextView class]]];
}

-(HZTBaseViewController *)currentVc{
    return [AppDelegate currentViewController];
}

-(void)handleTextChangedWithTextField:(UITextField *)textField isTextView:(BOOL)isTextView{
    if (isTextView) {
        self.tempLabel.hidden = textField.text.length;
    }
    NSString * toBeString = textField.text;
    int kMaxLen = self.maxLen>0?self.maxLen:100;
    NSString * lang = [[UIApplication sharedApplication]textInputMode].primaryLanguage;
    if ([lang isEqualToString:@"zh-Hans"]) {
        UITextRange * selectedRange = [textField markedTextRange];
        UITextPosition * position = [textField positionFromPosition:selectedRange.start offset:0];
        if (!position) {
            if (toBeString.length > kMaxLen) {
                [self.currentVc showToast:@"文字超过最大限制!"];
                textField.text = [toBeString substringToIndex:kMaxLen];
            }
        }
    }else{
        if (toBeString.length > kMaxLen) {
            [self.currentVc showToast:@"文字超过最大限制!"];
            textField.text = [toBeString substringToIndex:kMaxLen];
        }
    }
    self.remindLabel.text = [NSString stringWithFormat:@"%lu/%d字",(unsigned long)textField.text.length,kMaxLen];
    self.realText = textField.text;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
