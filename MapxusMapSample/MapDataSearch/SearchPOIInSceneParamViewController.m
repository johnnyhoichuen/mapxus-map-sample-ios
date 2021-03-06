//
//  SearchPOIInSceneParamViewController.m
//  MapxusMapSample
//
//  Created by chenghao guo on 2020/7/22.
//  Copyright © 2020 MAPHIVE TECHNOLOGY LIMITED. All rights reserved.
//

#import <IQKeyboardManager/IQKeyboardManager.h>
#import "SearchPOIInSceneParamViewController.h"
#import "Macro.h"

@interface SearchPOIInSceneParamViewController () <UITextFieldDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *boxView;
@property (nonatomic, strong) UILabel *keywordsTip;
@property (nonatomic, strong) UILabel *buildingIDTip;
@property (nonatomic, strong) UILabel *floorTip;
@property (nonatomic, strong) UILabel *categoryTip;
@property (nonatomic, strong) UILabel *offsetTip;
@property (nonatomic, strong) UILabel *pageTip;
@property (nonatomic, strong) UITextField *keywordsTextField;
@property (nonatomic, strong) UITextField *buildingIDTextField;
@property (nonatomic, strong) UITextField *floorTextField;
@property (nonatomic, strong) UITextField *categoryTextField;
@property (nonatomic, strong) UITextField *offsetTextField;
@property (nonatomic, strong) UITextField *pageTextField;
@property (nonatomic, strong) UIButton *createButton;

@end

@implementation SearchPOIInSceneParamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self layoutUI];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}

- (void)createButtonAction {
    __weak typeof(self) weakSelf = self;
    [self dismissViewControllerAnimated:YES completion:^{
        if (self.delegate && [self.delegate respondsToSelector:@selector(completeParamConfiguration:)]) {
            NSMutableDictionary *params = [NSMutableDictionary dictionary];
            params[@"keywords"] = weakSelf.keywordsTextField.text;
            params[@"buildingId"] = weakSelf.buildingIDTextField.text;
            params[@"floor"] = weakSelf.floorTextField.text;
            params[@"category"] = weakSelf.categoryTextField.text;
            params[@"offset"] = weakSelf.offsetTextField.text;
            params[@"page"] = weakSelf.pageTextField.text;
            [self.delegate completeParamConfiguration:params];
        }
    }];
}

- (void)layoutUI {
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.boxView];
    [self.boxView addSubview:self.keywordsTip];
    [self.boxView addSubview:self.keywordsTextField];
    [self.boxView addSubview:self.buildingIDTip];
    [self.boxView addSubview:self.buildingIDTextField];
    [self.boxView addSubview:self.floorTip];
    [self.boxView addSubview:self.floorTextField];
    [self.boxView addSubview:self.categoryTip];
    [self.boxView addSubview:self.categoryTextField];
    [self.boxView addSubview:self.offsetTip];
    [self.boxView addSubview:self.offsetTextField];
    [self.boxView addSubview:self.pageTip];
    [self.boxView addSubview:self.pageTextField];
    [self.boxView addSubview:self.createButton];
    
    if (@available(iOS 11.0, *)) {
        [self.scrollView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
        [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = YES;
        [self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor].active = YES;
        [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor].active = YES;
    } else {
        [self.scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
        [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
        [self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
        [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    }
    
    [self.boxView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
    [self.boxView.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
    [self.boxView.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor].active = YES;
    [self.boxView.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = YES;
    [self.boxView.widthAnchor constraintEqualToAnchor:self.scrollView.widthAnchor].active = YES;
    
    [self.keywordsTip.topAnchor constraintEqualToAnchor:self.boxView.topAnchor constant:moduleSpace].active = YES;
    [self.keywordsTip.leadingAnchor constraintEqualToAnchor:self.boxView.leadingAnchor constant:leadingSpace].active = YES;
    [self.keywordsTip.trailingAnchor constraintEqualToAnchor:self.boxView.trailingAnchor constant:-trailingSpace].active = YES;
    
    [self.keywordsTextField.topAnchor constraintEqualToAnchor:self.keywordsTip.bottomAnchor constant:innerSpace].active = YES;
    [self.keywordsTextField.leadingAnchor constraintEqualToAnchor:self.boxView.leadingAnchor constant:leadingSpace].active = YES;
    [self.keywordsTextField.trailingAnchor constraintEqualToAnchor:self.boxView.trailingAnchor constant:-trailingSpace].active = YES;
    [self.keywordsTextField.heightAnchor constraintEqualToConstant:44].active = YES;
    
    [self.categoryTip.topAnchor constraintEqualToAnchor:self.keywordsTextField.bottomAnchor constant:moduleSpace].active = YES;
    [self.categoryTip.leadingAnchor constraintEqualToAnchor:self.boxView.leadingAnchor constant:leadingSpace].active = YES;
    [self.categoryTip.trailingAnchor constraintEqualToAnchor:self.boxView.trailingAnchor constant:-trailingSpace].active = YES;
    
    [self.categoryTextField.topAnchor constraintEqualToAnchor:self.categoryTip.bottomAnchor constant:innerSpace].active = YES;
    [self.categoryTextField.leadingAnchor constraintEqualToAnchor:self.boxView.leadingAnchor constant:leadingSpace].active = YES;
    [self.categoryTextField.trailingAnchor constraintEqualToAnchor:self.boxView.trailingAnchor constant:-trailingSpace].active = YES;
    [self.categoryTextField.heightAnchor constraintEqualToConstant:44].active = YES;
    
    [self.buildingIDTip.topAnchor constraintEqualToAnchor:self.categoryTextField.bottomAnchor constant:moduleSpace].active = YES;
    [self.buildingIDTip.leadingAnchor constraintEqualToAnchor:self.boxView.leadingAnchor constant:leadingSpace].active = YES;
    [self.buildingIDTip.trailingAnchor constraintEqualToAnchor:self.boxView.trailingAnchor constant:-trailingSpace].active = YES;
    
    [self.buildingIDTextField.topAnchor constraintEqualToAnchor:self.buildingIDTip.bottomAnchor constant:innerSpace].active = YES;
    [self.buildingIDTextField.leadingAnchor constraintEqualToAnchor:self.boxView.leadingAnchor constant:leadingSpace].active = YES;
    [self.buildingIDTextField.trailingAnchor constraintEqualToAnchor:self.boxView.trailingAnchor constant:-trailingSpace].active = YES;
    [self.buildingIDTextField.heightAnchor constraintEqualToConstant:44].active = YES;
    
    [self.floorTip.topAnchor constraintEqualToAnchor:self.buildingIDTextField.bottomAnchor constant:moduleSpace].active = YES;
    [self.floorTip.leadingAnchor constraintEqualToAnchor:self.boxView.leadingAnchor constant:leadingSpace].active = YES;
    [self.floorTip.trailingAnchor constraintEqualToAnchor:self.boxView.trailingAnchor constant:-trailingSpace].active = YES;
    
    [self.floorTextField.topAnchor constraintEqualToAnchor:self.floorTip.bottomAnchor constant:innerSpace].active = YES;
    [self.floorTextField.leadingAnchor constraintEqualToAnchor:self.boxView.leadingAnchor constant:leadingSpace].active = YES;
    [self.floorTextField.trailingAnchor constraintEqualToAnchor:self.boxView.trailingAnchor constant:-trailingSpace].active = YES;
    [self.floorTextField.heightAnchor constraintEqualToConstant:44].active = YES;
    
    [self.offsetTip.topAnchor constraintEqualToAnchor:self.floorTextField.bottomAnchor constant:moduleSpace].active = YES;
    [self.offsetTip.leadingAnchor constraintEqualToAnchor:self.boxView.leadingAnchor constant:leadingSpace].active = YES;
    [self.offsetTip.trailingAnchor constraintEqualToAnchor:self.boxView.trailingAnchor constant:-trailingSpace].active = YES;
    
    [self.offsetTextField.topAnchor constraintEqualToAnchor:self.offsetTip.bottomAnchor constant:innerSpace].active = YES;
    [self.offsetTextField.leadingAnchor constraintEqualToAnchor:self.boxView.leadingAnchor constant:leadingSpace].active = YES;
    [self.offsetTextField.trailingAnchor constraintEqualToAnchor:self.boxView.trailingAnchor constant:-trailingSpace].active = YES;
    [self.offsetTextField.heightAnchor constraintEqualToConstant:44].active = YES;
    
    [self.pageTip.topAnchor constraintEqualToAnchor:self.offsetTextField.bottomAnchor constant:moduleSpace].active = YES;
    [self.pageTip.leadingAnchor constraintEqualToAnchor:self.boxView.leadingAnchor constant:leadingSpace].active = YES;
    [self.pageTip.trailingAnchor constraintEqualToAnchor:self.boxView.trailingAnchor constant:-trailingSpace].active = YES;
    
    [self.pageTextField.topAnchor constraintEqualToAnchor:self.pageTip.bottomAnchor constant:innerSpace].active = YES;
    [self.pageTextField.leadingAnchor constraintEqualToAnchor:self.boxView.leadingAnchor constant:leadingSpace].active = YES;
    [self.pageTextField.trailingAnchor constraintEqualToAnchor:self.boxView.trailingAnchor constant:-trailingSpace].active = YES;
    [self.pageTextField.heightAnchor constraintEqualToConstant:44].active = YES;
    
    [self.createButton.widthAnchor constraintEqualToConstant:150].active = YES;
    [self.createButton.heightAnchor constraintEqualToConstant:44].active = YES;
    [self.createButton.centerXAnchor constraintEqualToAnchor:self.boxView.centerXAnchor].active = YES;
    [self.createButton.topAnchor constraintEqualToAnchor:self.pageTextField.bottomAnchor constant:40].active = YES;
    [self.createButton.bottomAnchor constraintEqualToAnchor:self.boxView.bottomAnchor constant:-40].active = YES;

}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [[IQKeyboardManager sharedManager] goNext];
    return YES;
}

#pragma mark - Lazy loading
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _scrollView;
}

- (UIView *)boxView {
    if (!_boxView) {
        _boxView = [[UIView alloc] init];
        _boxView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _boxView;
}

- (UILabel *)keywordsTip {
    if (!_keywordsTip) {
        _keywordsTip = [[UILabel alloc] init];
        _keywordsTip.translatesAutoresizingMaskIntoConstraints = NO;
        _keywordsTip.text = @"keywords";
    }
    return _keywordsTip;
}

- (UILabel *)buildingIDTip {
    if (!_buildingIDTip) {
        _buildingIDTip = [[UILabel alloc] init];
        _buildingIDTip.translatesAutoresizingMaskIntoConstraints = NO;
        _buildingIDTip.text = @"buildingId";
    }
    return _buildingIDTip;
}

- (UILabel *)floorTip {
    if (!_floorTip) {
        _floorTip = [[UILabel alloc] init];
        _floorTip.translatesAutoresizingMaskIntoConstraints = NO;
        _floorTip.text = @"floor";
    }
    return _floorTip;
}

- (UILabel *)categoryTip {
    if (!_categoryTip) {
        _categoryTip = [[UILabel alloc] init];
        _categoryTip.translatesAutoresizingMaskIntoConstraints = NO;
        _categoryTip.text = @"category";
    }
    return _categoryTip;
}

- (UILabel *)offsetTip {
    if (!_offsetTip) {
        _offsetTip = [[UILabel alloc] init];
        _offsetTip.translatesAutoresizingMaskIntoConstraints = NO;
        _offsetTip.text = @"offset";
    }
    return _offsetTip;
}

- (UILabel *)pageTip {
    if (!_pageTip) {
        _pageTip = [[UILabel alloc] init];
        _pageTip.translatesAutoresizingMaskIntoConstraints = NO;
        _pageTip.text = @"page";
    }
    return _pageTip;
}

- (UITextField *)keywordsTextField {
    if (!_keywordsTextField) {
        _keywordsTextField = [[UITextField alloc] init];
        _keywordsTextField.translatesAutoresizingMaskIntoConstraints = NO;
        _keywordsTextField.delegate = self;
        _keywordsTextField.keyboardType = UIKeyboardTypeDefault;
        _keywordsTextField.borderStyle = UITextBorderStyleRoundedRect;

    }
    return _keywordsTextField;
}

- (UITextField *)buildingIDTextField {
    if (!_buildingIDTextField) {
        _buildingIDTextField = [[UITextField alloc] init];
        _buildingIDTextField.translatesAutoresizingMaskIntoConstraints = NO;
        _buildingIDTextField.delegate = self;
        _buildingIDTextField.keyboardType = UIKeyboardTypeDefault;
        _buildingIDTextField.borderStyle = UITextBorderStyleRoundedRect;
        _buildingIDTextField.text = @"tsuenwanplaza_hk_369d01";
    }
    return _buildingIDTextField;
}

- (UITextField *)floorTextField {
    if (!_floorTextField) {
        _floorTextField = [[UITextField alloc] init];
        _floorTextField.translatesAutoresizingMaskIntoConstraints = NO;
        _floorTextField.delegate = self;
        _floorTextField.keyboardType = UIKeyboardTypeDefault;
        _floorTextField.borderStyle = UITextBorderStyleRoundedRect;
        _floorTextField.text = @"L3";
    }
    return _floorTextField;
}

- (UITextField *)categoryTextField {
    if (!_categoryTextField) {
        _categoryTextField = [[UITextField alloc] init];
        _categoryTextField.translatesAutoresizingMaskIntoConstraints = NO;
        _categoryTextField.delegate = self;
        _categoryTextField.keyboardType = UIKeyboardTypeDefault;
        _categoryTextField.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _categoryTextField;
}

- (UITextField *)offsetTextField {
    if (!_offsetTextField) {
        _offsetTextField = [[UITextField alloc] init];
        _offsetTextField.translatesAutoresizingMaskIntoConstraints = NO;
        _offsetTextField.delegate = self;
        _offsetTextField.text = @"10";
        _offsetTextField.placeholder = @"please enter number";
        _offsetTextField.keyboardType = UIKeyboardTypeNumberPad;
        _offsetTextField.borderStyle = UITextBorderStyleRoundedRect;

    }
    return _offsetTextField;
}

- (UITextField *)pageTextField {
    if (!_pageTextField) {
        _pageTextField = [[UITextField alloc] init];
        _pageTextField.translatesAutoresizingMaskIntoConstraints = NO;
        _pageTextField.delegate = self;
        _pageTextField.text = @"1";
        _pageTextField.placeholder = @"please enter number";
        _pageTextField.keyboardType = UIKeyboardTypeNumberPad;
        _pageTextField.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _pageTextField;
}

- (UIButton *)createButton {
    if (!_createButton) {
        _createButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _createButton.translatesAutoresizingMaskIntoConstraints = NO;
        [_createButton setTitle:@"Create" forState:UIControlStateNormal];
        [_createButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _createButton.backgroundColor = [UIColor colorWithRed:80/255.0 green:175/255.0 blue:243/255.0 alpha:1.0];
        [_createButton addTarget:self action:@selector(createButtonAction) forControlEvents:UIControlEventTouchUpInside];
        _createButton.layer.cornerRadius = 5;
    }
    return _createButton;
}

@end
