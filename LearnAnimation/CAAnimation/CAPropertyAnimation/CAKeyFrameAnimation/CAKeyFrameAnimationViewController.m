//
//  CAKeyFrameAnimationViewController.m
//  LearnAnimation
//
//  Created by mac on 2019/1/26.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CAKeyFrameAnimationViewController.h"

@interface CAKeyFrameAnimationViewController ()

@end

static NSString * nibName = @"CAKeyFrameAnimationViewController";

@implementation CAKeyFrameAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

+(instancetype)initWithNib{
    return [[CAKeyFrameAnimationViewController alloc]initWithNibName:nibName bundle:nil];
}
-(void)initNavi{
    [super initNavi];
    self.navigationItem.title = @"CAKeyFrameAnimation";
}
-(void)initView{
    [super initView];
}
-(void)initData{
    [super initData];
}
@end
