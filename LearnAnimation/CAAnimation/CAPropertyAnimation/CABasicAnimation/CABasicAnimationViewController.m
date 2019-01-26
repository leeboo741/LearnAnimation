//
//  CABasicAnimationViewController.m
//  LearnAnimation
//
//  Created by mac on 2019/1/26.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CABasicAnimationViewController.h"

@interface CABasicAnimationViewController ()

@end

static NSString * nibName = @"CABasicAnimationViewController";

@implementation CABasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
+(instancetype)initWithNib{
    return [[CABasicAnimationViewController alloc]initWithNibName:nibName bundle:nil];
}
-(void)initNavi{
    [super initNavi];
    self.navigationItem.title = @"CABasicAnimation";
    UIButton * rightButton = [[UIButton alloc]init];
    [rightButton setTitle:@"开始动画" forState:UIControlStateNormal];
    [rightButton setTitle:@"结束动画" forState:UIControlStateSelected];
    [rightButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    [rightButton addTarget:self action:@selector(rightBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightBarButton = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightBarButton;
}
-(void)initView{
    [super initView];
}
-(void)initData{
    [super initData];
}
-(void)rightBarButtonAction:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        // 开始动画
        NSLog(@"开始动画");
        
        
    } else {
        // 结束动画
        NSLog(@"结束动画");
    }
}
- (CABasicAnimation *)getAnimationKeyPath:(NSString *)keyPath fromValue:(id)fromValue toValue:(id)toValue byValue:(id)byValue timingFunction:(CAMediaTimingFunction *)timingFunction duration:(CGFloat)duration repeatCount:(NSInteger)repeatCount{
     CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:keyPath];
     basicAnimation.fromValue = fromValue;
     /*byvalue是在fromvalue的值的基础上增加量*/
     basicAnimation.byValue = byValue;
     basicAnimation.toValue = toValue;
     basicAnimation.timingFunction = timingFunction;
//    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];;
     basicAnimation.duration = duration;
     basicAnimation.repeatCount = repeatCount;
     /* animation remove from view after animation finish */
     basicAnimation.removedOnCompletion = YES;
     return basicAnimation;
 }
@end
