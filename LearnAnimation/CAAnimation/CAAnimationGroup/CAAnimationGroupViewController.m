//
//  CAAnimationGroupViewController.m
//  LearnAnimation
//
//  Created by mac on 2019/1/26.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CAAnimationGroupViewController.h"

@interface CAAnimationGroupViewController ()

@end

static NSString * nibName = @"CAAnimationGroupViewController";

@implementation CAAnimationGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
+(instancetype)initWithNib{
    return [[CAAnimationGroupViewController alloc]initWithNibName:nibName bundle:nil];
}
-(void)initNavi{
    [super initNavi];
    self.navigationItem.title = @"CAAnimationGroup";
}
-(void)initView{
    [super initView];
}
-(void)initData{
    [super initData];
}

@end
