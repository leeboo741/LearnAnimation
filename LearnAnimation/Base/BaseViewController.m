//
//  BaseViewController.m
//  LearnAnimation
//
//  Created by mac on 2019/1/25.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

static NSString * nibName = @"BaseViewController";

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavi];
    [self initView];
    [self initData];
    // Do any additional setup after loading the view from its nib.
}

+(instancetype)initWithNib{
    return nil;
}
-(void)initData{
    
}
-(void)initNavi{
    
}
-(void)initView{
    
}
@end
