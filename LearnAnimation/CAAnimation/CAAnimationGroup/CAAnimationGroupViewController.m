//
//  CAAnimationGroupViewController.m
//  LearnAnimation
//
//  Created by mac on 2019/1/26.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CAAnimationGroupViewController.h"

@interface CAAnimationGroupViewController ()<CAAnimationDelegate>

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *exampleView;

@end

static NSString * nibName = @"CAAnimationGroupViewController";

@implementation CAAnimationGroupViewController

#pragma mark -
#pragma mark Super

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
    UIButton * rightButton = [[UIButton alloc]init];
    [rightButton setTitle:@"开始动画" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor colorWithRed:45/255.0
                                               green:126/255.0
                                                blue:250/255.0
                                               alpha:1]
                      forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightBarButton = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightBarButton;
}
-(void)initView{
    [super initView];
    self.exampleView.frame = CGRectMake(0, 0, 150, 150);
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.center = CGPointMake(300, 300);
    view.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:view];
    [self.contentView sendSubviewToBack:view];
    
}
-(void)initData{
    [super initData];
}

#pragma mark -
#pragma mark Set/Get

#pragma mark -
#pragma mark Action

-(void)rightBarButtonAction:(UIButton *)sender{
    CABasicAnimation * positionAni = [CABasicAnimation animationWithKeyPath:@"position"];
    positionAni.fromValue = [NSValue valueWithCGPoint:self.exampleView.center];
    positionAni.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
    
    CASpringAnimation * scaleAni = [CASpringAnimation animationWithKeyPath:@"transform.scale"];
    scaleAni.fromValue = @(1);
    scaleAni.toValue = @(0.4);
    
    CABasicAnimation * cornerRadiusAni = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    cornerRadiusAni.fromValue = @(self.exampleView.layer.cornerRadius);
    cornerRadiusAni.toValue = @(self.exampleView.frame.size.height/2);
    
    CAAnimationGroup * groupAnis = [CAAnimationGroup animation];
    groupAnis.animations = @[positionAni,scaleAni,cornerRadiusAni];
    groupAnis.duration = 3;
    groupAnis.fillMode = kCAFillModeForwards;
    groupAnis.removedOnCompletion = NO;
    groupAnis.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    groupAnis.delegate = self;
    
    CABasicAnimation * rotationAni = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAni.fromValue = @(0);
    rotationAni.toValue = @(M_PI);
    rotationAni.repeatCount = MAXFLOAT;
    rotationAni.duration = 0.5f;
    rotationAni.repeatDuration = 3.0f;
    
    [self.exampleView.layer addAnimation:rotationAni forKey:@"rotationAni"];
    [self.exampleView.layer addAnimation:groupAnis forKey:@"groupAni"];
}

#pragma mark -
#pragma mark Animation

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    CASpringAnimation * scaleAni = [CASpringAnimation animationWithKeyPath:@"transform.scale"];
    scaleAni.fromValue = @(0.4);
    scaleAni.toValue = @(1);
    scaleAni.duration = 1;
    scaleAni.fillMode = kCAFillModeForwards;
    scaleAni.removedOnCompletion = NO;
    
    [self.exampleView.layer addAnimation:scaleAni forKey:@"scaleAni"];
}

#pragma mark -
#pragma mark Data

@end
