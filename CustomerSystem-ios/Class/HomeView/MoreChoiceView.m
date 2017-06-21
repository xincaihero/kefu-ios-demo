/************************************************************
 *  * EaseMob CONFIDENTIAL
 * __________________
 * Copyright (C) 2013-2014 EaseMob Technologies. All rights reserved.
 *
 * NOTICE: All information contained herein is, and remains
 * the property of EaseMob Technologies.
 * Dissemination of this information or reproduction of this material
 * is strictly forbidden unless prior written permission is obtained
 * from EaseMob Technologies.
 */

#import "MoreChoiceView.h"

#import "LocalDefine.h"

@interface MoreChoiceView()

@property (nonatomic, strong) UIButton *preSaleButton;
@property (nonatomic, strong) UIButton *afterSaleButton;
@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) UIView *buttonView;
@property (nonatomic, strong) UIView *cutView;

@end

@implementation MoreChoiceView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setupviews];
    }
    return self;
}

- (void)_setupviews
{
    _buttonView = [[UIView alloc] init];
    _buttonView.backgroundColor = [UIColor whiteColor];
    _buttonView.frame = CGRectMake(CGRectGetWidth(self.frame) - 150, 0, 140, 160);
    _buttonView.clipsToBounds = YES;
    _buttonView.layer.cornerRadius = 5;
    [self addSubview:_buttonView];

    _preSaleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_preSaleButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_preSaleButton setTitle:@"找投顾" forState:UIControlStateNormal];
    [_preSaleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_preSaleButton addTarget:self action:@selector(preSellAction) forControlEvents:UIControlEventTouchUpInside];
//    [_preSaleButton setBackgroundImage:[[UIImage imageNamed:@"button_demo_department"] stretchableImageWithLeftCapWidth:10 topCapHeight:5] forState:UIControlStateNormal];
//    [_preSaleButton setBackgroundImage:[[UIImage imageNamed:@"button_demo_department_select"] stretchableImageWithLeftCapWidth:10 topCapHeight:5] forState:UIControlStateHighlighted];
    _preSaleButton.frame = CGRectMake(10, 10, 120, 40);
    _preSaleButton.backgroundColor = RGBACOLOR(245, 93, 87, 1);
    _preSaleButton.clipsToBounds = YES;
    _preSaleButton.layer.cornerRadius = 5;
    [_buttonView addSubview:_preSaleButton];
    
    _afterSaleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_afterSaleButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_afterSaleButton setTitle:@"找客服" forState:UIControlStateNormal];
    [_afterSaleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_afterSaleButton addTarget:self action:@selector(afterSaleAction) forControlEvents:UIControlEventTouchUpInside];
//    [_afterSaleButton setBackgroundImage:[[UIImage imageNamed:@"button_demo_department"] stretchableImageWithLeftCapWidth:10 topCapHeight:5] forState:UIControlStateNormal];
//    [_afterSaleButton setBackgroundImage:[[UIImage imageNamed:@"button_demo_department_select"] stretchableImageWithLeftCapWidth:10 topCapHeight:5] forState:UIControlStateHighlighted];
    _afterSaleButton.frame = CGRectMake(10, CGRectGetMaxY(_preSaleButton.frame) + 10, 120, 40);
    _afterSaleButton.backgroundColor = RGBACOLOR(245, 93, 87, 1);
    _afterSaleButton.clipsToBounds = YES;
    _afterSaleButton.layer.cornerRadius = 5;
    [_buttonView addSubview:_afterSaleButton];
    
    _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_addButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_addButton setTitle:@"找客户经理" forState:UIControlStateNormal];
    [_addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_addButton addTarget:self action:@selector(addAction) forControlEvents:UIControlEventTouchUpInside];
    //    [_afterSaleButton setBackgroundImage:[[UIImage imageNamed:@"button_demo_department"] stretchableImageWithLeftCapWidth:10 topCapHeight:5] forState:UIControlStateNormal];
    //    [_afterSaleButton setBackgroundImage:[[UIImage imageNamed:@"button_demo_department_select"] stretchableImageWithLeftCapWidth:10 topCapHeight:5] forState:UIControlStateHighlighted];
    _addButton.frame = CGRectMake(10, CGRectGetMaxY(_afterSaleButton.frame) + 10, 120, 40);
    _addButton.backgroundColor = RGBACOLOR(245, 93, 87, 1);
    _addButton.clipsToBounds = YES;
    _addButton.layer.cornerRadius = 5;
    [_buttonView addSubview:_addButton];
    
//    _cutView = [[UIView alloc] init];
//    _cutView.backgroundColor = RGBACOLOR(184, 22, 22, 1);
//    _cutView.frame = CGRectMake(0, _buttonView.frame.size.height/2 - 0.5, _buttonView.frame.size.width, 1);
//    [_buttonView addSubview:_cutView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideAction)];
    [self addGestureRecognizer:tap];
}

#pragma mark - action
- (void)afterSaleAction
{
    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_CHAT object:@{@"counselor":@"counselor"}];
    self.hidden = YES;
}

- (void)preSellAction
{
    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_CHAT object:@{@"service":@"service"}];
    self.hidden = YES;
}

- (void)addAction
{
    [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_CHAT object:@{@"manager":
                                                                                               @"manager"}];
    self.hidden = YES;
}

- (void)hideAction
{
    self.hidden = YES;
}

@end
