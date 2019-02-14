//
//  UIAnimationViewController.m
//  LearnAnimation
//
//  Created by mac on 2019/2/14.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "UIAnimationViewController.h"

@interface UIAnimationViewController ()

@end

static NSString * nibName = @"UIAnimationViewController";

@implementation UIAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

+(instancetype)initWithNib{
    return [[UIAnimationViewController alloc]initWithNibName:nibName bundle:nil];
}

@end
