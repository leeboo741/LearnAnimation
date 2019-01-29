//
//  CAKeyFrameAnimationViewController.m
//  LearnAnimation
//
//  Created by mac on 2019/1/26.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CAKeyFrameAnimationViewController.h"

@interface CAKeyFrameAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *exampleView;

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
    UIButton * rightButton = [[UIButton alloc]init];
    [rightButton setTitle:@"开始动画" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightBarButton = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightBarButton;
}
-(void)initView{
    [super initView];
    self.exampleView.layer.shadowOpacity = 0.6;
    self.exampleView.layer.shadowOffset = CGSizeMake(0, 0);
    self.exampleView.layer.shadowRadius = 4;
    self.exampleView.layer.shadowColor = [UIColor redColor].CGColor;
    self.exampleView.layer.cornerRadius = 4;
}
-(void)initData{
    [super initData];
}
#pragma mark -
#pragma mark Action

-(void)rightBarButtonAction:(UIButton *)sender{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    // 方式1 path
    // 创建一个CGPathRef对象，就是动画的路线
    CGMutablePathRef path = CGPathCreateMutable();
    // 自动沿着弧度移动
    CGPathAddEllipseInRect(path, NULL, CGRectMake(150, 200, 200, 100));
    // 设置开始位置
    CGPathMoveToPoint(path,NULL,100,100);
    // 沿着直线移动
    CGPathAddLineToPoint(path,NULL, 200, 100);
    CGPathAddLineToPoint(path,NULL, 200, 200);
    CGPathAddLineToPoint(path,NULL, 100, 200);
    CGPathAddLineToPoint(path,NULL, 100, 300);
    CGPathAddLineToPoint(path,NULL, 200, 400);
    // 沿着曲线移动
    CGPathAddCurveToPoint(path,NULL,50.0,275.0,150.0,275.0,70.0,120.0);
    CGPathAddCurveToPoint(path,NULL,150.0,275.0,250.0,275.0,90.0,120.0);
    CGPathAddCurveToPoint(path,NULL,250.0,275.0,350.0,275.0,110.0,120.0);
    CGPathAddCurveToPoint(path,NULL,350.0,275.0,450.0,275.0,130.0,120.0);
    animation.path=path;
    CGPathRelease(path);
    animation.keyTimes= @[[NSNumber numberWithFloat:0.0],
                          [NSNumber numberWithFloat:0.1],
                          [NSNumber numberWithFloat:0.2],
                          [NSNumber numberWithFloat:0.3],
                          [NSNumber numberWithFloat:0.4],
                          [NSNumber numberWithFloat:0.5],
                          [NSNumber numberWithFloat:0.6],
                          [NSNumber numberWithFloat:0.7],
                          [NSNumber numberWithFloat:1]]; // 可选  默认平分
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
//    // 方式2 values
//    // 设置value
//    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
//    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(200, 100)];
//    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
//    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(100, 200)];
//    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(100, 300)];
//    NSValue *value6 = [NSValue valueWithCGPoint:CGPointMake(200, 400)];
//    animation.values= @[value1,value2,value3,value4,value5,value6];
//    animation.keyTimes= @[[NSNumber numberWithFloat:0.0],
//                          [NSNumber numberWithFloat:0.1],
//                          [NSNumber numberWithFloat:0.4],
//                          [NSNumber numberWithFloat:0.5],
//                          [NSNumber numberWithFloat:0.7],
//                          [NSNumber numberWithFloat:1]];   // 对应的帧所在的时间节点 从 0 开始 - 到 1 结束
//    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
//                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
//                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
//                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
//                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault],
//                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
//    animation.autoreverses = YES;
    animation.repeatCount=1;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.duration = 10.0f;
    [self.exampleView.layer addAnimation:animation forKey:nil];
}
@end
