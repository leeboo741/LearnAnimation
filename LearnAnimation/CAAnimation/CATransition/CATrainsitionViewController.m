//
//  CATrainsitionViewController.m
//  LearnAnimation
//
//  Created by mac on 2019/1/26.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CATrainsitionViewController.h"

@interface CATrainsitionViewController ()

@end

static NSString * nibName = @"CATrainsitionViewController";

@implementation CATrainsitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

+(instancetype)initWithNib{
    return [[CATrainsitionViewController alloc]initWithNibName:nibName bundle:nil];
}
-(void)initNavi{
    [super initNavi];
    self.navigationItem.title = @"CATransition";
}
-(void)initView{
    [super initView];
}
-(void)initData{
    [super initData];
}
@end
