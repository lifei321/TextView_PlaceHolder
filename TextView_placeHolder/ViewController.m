//
//  ViewController.m
//  TextView_placeHolder
//
//  Created by shancheli on 16/1/27.
//  Copyright © 2016年 shancheli. All rights reserved.
//

//意见反馈
#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate,UITextViewDelegate>

@property(nonatomic,strong)UITextView *adviceTextView;

@property(nonatomic,strong)UITextField *contactTextField;

@property(nonatomic,strong)UILabel *placeHolderLab;


@end

@implementation ViewController



-(void)viewDidLoad{

    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UITextView* textview = [self makeTextViewWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 300) placeHolder:@"这是个测试用的占位符"];
    [self.view addSubview:textview];

}


//建议输入框
-(UITextView*)makeTextViewWithFrame:(CGRect)frame placeHolder:(NSString*)title
{
    UITextView* textView = [[UITextView alloc]initWithFrame:frame];
    textView.font = [UIFont systemFontOfSize:14];
    textView.backgroundColor = [UIColor whiteColor];
    textView.delegate = self;
    
    _placeHolderLab = [[UILabel alloc]init];
    _placeHolderLab.numberOfLines = 0;
    _placeHolderLab.backgroundColor = [UIColor clearColor];
    _placeHolderLab.font = textView.font;
    _placeHolderLab.textColor = [UIColor blueColor]; //[UIColor grayColor];
    _placeHolderLab.textAlignment = NSTextAlignmentLeft;
    _placeHolderLab.text = title;
    
    
    _placeHolderLab.frame = CGRectMake(5, 10, self.view.frame.size.width - 10, 14);
    [textView addSubview:_placeHolderLab];
    
    
    UIView *Topline = [[UIView alloc] init];
    Topline.frame = CGRectMake(0, 0, self.view.frame.size.width, 1/[[UIScreen mainScreen] scale]);
    Topline.backgroundColor = [UIColor lightGrayColor];
    [textView addSubview:Topline];
    
    UIView *BottomLine = [[UIView alloc] init];
    BottomLine.frame = CGRectMake(0, frame.size.height - 1, self.view.frame.size.width, 1);
    BottomLine.backgroundColor = [UIColor lightGrayColor];
    [textView addSubview:BottomLine];
    
    return textView;
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    [_placeHolderLab removeFromSuperview];
    
    return YES;
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    [self.view resignFirstResponder];
    if (textView.text.length == 0) {
        
        [textView addSubview:_placeHolderLab];
    }
}

@end