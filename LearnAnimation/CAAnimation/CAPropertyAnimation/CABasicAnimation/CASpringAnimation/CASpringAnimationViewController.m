//
//  CASpringAnimationViewController.m
//  LearnAnimation
//
//  Created by mac on 2019/1/26.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CASpringAnimationViewController.h"

@interface CASpringAnimationViewController ()

@end

static NSString * nibName = @"CASpringAnimationViewController";

@implementation CASpringAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

+(instancetype)initWithNib{
    return [[CASpringAnimationViewController alloc]initWithNibName:nibName bundle:nil];
}
-(void)initNavi{
    [super initNavi];
    self.navigationItem.title = @"CASpringAnimation";
}
-(void)initView{
    [super initView];
}
-(void)initData{
    [super initData];
}
@end
