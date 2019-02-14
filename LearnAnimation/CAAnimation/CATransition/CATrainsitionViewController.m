//
//  CATrainsitionViewController.m
//  LearnAnimation
//
//  Created by mac on 2019/1/26.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CATrainsitionViewController.h"

@interface CATrainsitionViewController ()<CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *exampleImageView;
@property (nonatomic, assign) NSInteger tapImageIndex;
@property (weak, nonatomic) IBOutlet UISegmentedControl *subTypeSegment;
@property (nonatomic, copy) NSString * selectedSubType;
@property (nonatomic, copy) NSString * selectedType;
@property (nonatomic, strong) UIImage * willShowImage;
@property (weak, nonatomic) IBOutlet UIView *showTypeView;
@property (weak, nonatomic) IBOutlet UILabel *showTypeLabel;
@end

static NSString * nibName = @"CATrainsitionViewController";

@implementation CATrainsitionViewController

#pragma mark -
#pragma mark Super
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
    self.exampleImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapIamgeView)];
    [self.exampleImageView addGestureRecognizer:tap];
    self.showTypeView.layer.cornerRadius = 8.0f;
}
-(void)initData{
    [super initData];
    self.tapImageIndex = 0;
    self.selectedSubType = [[self getTransitionSubTypes] objectAtIndex:self.subTypeSegment.selectedSegmentIndex];
}
#pragma mark -
#pragma mark Action

-(void)rightBarButtonAction:(UIButton *)sender{
    
}

-(void)tapIamgeView{
    [self showAnimationWithType:self.selectedType subType:self.selectedSubType];
    self.exampleImageView.image = self.willShowImage;
    [self nextIndex];
}

- (IBAction)selectSubType:(id)sender {
    self.selectedSubType = [[self getTransitionSubTypes] objectAtIndex:self.subTypeSegment.selectedSegmentIndex];
}

-(void)nextIndex{
    self.tapImageIndex++;
    if (self.tapImageIndex == [self getImageNames].count
        || self.tapImageIndex == [self getTransitionTypes].count) {
        self.tapImageIndex = 0;
    }
}

#pragma mark -
#pragma mark Animation
-(void)showAnimationWithType:(NSString *)type subType:(NSString *)subType{
    CATransition *animation = [CATransition animation];
    animation.duration = 1;
    animation.fillMode = kCAFillModeForwards;
    animation.type = type;
    animation.subtype = subType;
    animation.delegate = self;
    [self.exampleImageView.layer addAnimation:animation forKey:type];
}
-(void)animationDidStart:(CAAnimation *)anim{
    
    NSInteger index = self.tapImageIndex == 0 ? [self getTransitionTypes].count -1 : self.tapImageIndex - 1;
    self.showTypeLabel.text = [[self getTransitionTypes] objectAtIndex:index];
    [UIView animateWithDuration:0.3 animations:^{
        self.showTypeView.hidden = NO;
    }];
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    self.showTypeView.hidden = YES;
}

#pragma mark -
#pragma mark SET/GET
-(NSString *)selectedType{
    return [[self getTransitionTypes] objectAtIndex:self.tapImageIndex];
}
-(NSString *)selectedSubType{
    return [[self getTransitionSubTypes]objectAtIndex:self.subTypeSegment.selectedSegmentIndex];
}
-(UIImage *)willShowImage{
    UIImage * image = [UIImage imageNamed:[[self getImageNames] objectAtIndex:self.tapImageIndex]];
    return image;
}

#pragma mark -
#pragma mark Data
-(NSArray *)getTransitionTypes{
    return @[
             kCATransitionFade,
             kCATransitionMoveIn,
             kCATransitionPush,
             kCATransitionReveal,
             @"cube",
             
             @"reveal",
             @"moveIn",
             @"fade", // default
             @"pageCurl",
             @"pageUnCurl",
             @"suckEffect",
             @"rippleEffect",
             @"oglFlip",
             kCATransitionFade
             ];
}
-(NSArray *)getImageNames{
    return @[
             @"1",
             @"2",
             @"3",
             @"4",
             @"5",
             @"7",
             @"8",
             @"10",
             @"11",
             @"12",
             @"14",
             @"15",
             @"16",
             @"file"
             ];
}
-(NSArray *)getTransitionSubTypes{
    return @[
             kCATransitionFromRight,
             kCATransitionFromLeft,
             kCATransitionFromTop,
             kCATransitionFromBottom
             ];
}

@end
