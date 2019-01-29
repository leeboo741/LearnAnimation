//
//  CASpringAnimationViewController.m
//  LearnAnimation
//
//  Created by mac on 2019/1/26.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CASpringAnimationViewController.h"

@interface CASpringAnimationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *exampleView;
@property (weak, nonatomic) IBOutlet UITableView *listView;
@property (weak, nonatomic) IBOutlet UISlider *massSlider;
@property (weak, nonatomic) IBOutlet UISlider *stiffnessSlider;
@property (weak, nonatomic) IBOutlet UISlider *dampingSlider;

@property (nonatomic, strong) NSIndexPath * selectedIndexPath;

@property (nonatomic, strong, readonly) NSString * animationKeyPath;

@end

static NSString * nibName = @"CASpringAnimationViewController";
static NSString * cellIdentifier = @"cellIdentifier";

@implementation CASpringAnimationViewController

#pragma mark -
#pragma mark Super

- (void)viewDidLoad {
    [super viewDidLoad];
    self.listView.delegate = self;
    self.listView.dataSource = self;
    // Do any additional setup after loading the view from its nib.
}

+(instancetype)initWithNib{
    return [[CASpringAnimationViewController alloc]initWithNibName:nibName bundle:nil];
}
-(void)initNavi{
    [super initNavi];
    self.navigationItem.title = @"CASpringAnimation";
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
    self.selectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
}

#pragma mark -
#pragma mark Action

-(void)rightBarButtonAction:(UIButton *)sender{
    // 开始动画
    NSLog(@"开始动画");
    CASpringAnimation * animation;
    switch (self.selectedIndexPath.row) {
        case BasicAnimation_Type_CARotation:
        case BasicAnimation_Type_CARotationX:
        case BasicAnimation_Type_CARotationY:
        case BasicAnimation_Type_CARotationZ:
            animation = [self getBasicAnimationWithFromValue:@(0)
                                                     toValue:@(M_PI)
                                                     byValue:nil
                                              timingFunction:nil];
            break;
        case BasicAnimation_Type_CAScale:
        case BasicAnimation_Type_CAScaleX:
        case BasicAnimation_Type_CAScaleY:
        case BasicAnimation_Type_CAScaleZ:
            animation = [self getBasicAnimationWithFromValue:@(1)
                                                     toValue:@(0.5)
                                                     byValue:nil
                                              timingFunction:nil];
            break;
        case BasicAnimation_Type_CATranslation:
        case BasicAnimation_Type_CATranslationX:
        case BasicAnimation_Type_CATranslationY:
        case BasicAnimation_Type_CATranslationZ:
            animation = [self getBasicAnimationWithFromValue:@(0)
                                                     toValue:@(100)
                                                     byValue:nil
                                              timingFunction:nil];
            break;
        case BasicAnimation_Type_CAPosition:
        case BasicAnimation_Type_CAPositionX:
        case BasicAnimation_Type_CAPositionY:
            animation = [self getBasicAnimationWithFromValue:[NSValue valueWithCGPoint:self.exampleView.center]
                                                     toValue:[NSValue valueWithCGPoint:CGPointMake(self.exampleView.center.x + 100, self.exampleView.center.y + 100)]
                                                     byValue:nil
                                              timingFunction:nil];
            break;
        case BasicAnimation_Type_CABoundsSize:
        case BasicAnimation_Type_CABoundsSizeW:
        case BasicAnimation_Type_CABoundsSizeH:
            animation = [self getBasicAnimationWithFromValue:[NSValue valueWithCGSize:self.exampleView.bounds.size]
                                                     toValue:[NSValue valueWithCGSize:CGSizeMake(self.exampleView.bounds.size.width + 50, self.exampleView.bounds.size.height + 100)]
                                                     byValue:nil
                                              timingFunction:nil];
            break;
        case BasicAnimation_Type_CABoundsOriginX:
            animation = [self getBasicAnimationWithFromValue:@(self.exampleView.bounds.origin.x)
                                                     toValue:@(self.exampleView.bounds.origin.x+100)
                                                     byValue:nil
                                              timingFunction:nil];
            break;
        case BasicAnimation_Type_CABoundsOriginY:
            animation = [self getBasicAnimationWithFromValue:@(self.exampleView.bounds.origin.y)
                                                     toValue:@(self.exampleView.bounds.origin.y+100)
                                                     byValue:nil
                                              timingFunction:nil];
            break;
        case BasicAnimation_Type_CAOpacity:
            animation = [self getBasicAnimationWithFromValue:@(1)
                                                     toValue:@(0)
                                                     byValue:nil
                                              timingFunction:nil];
            break;
        case BasicAnimation_Type_CABackgroundColor:
            animation = [self getBasicAnimationWithFromValue:(id)self.exampleView.backgroundColor.CGColor
                                                     toValue:(id)([UIColor redColor].CGColor)
                                                     byValue:nil
                                              timingFunction:nil];
            break;
        case BasicAnimation_Type_CACornerRadius:
            animation = [self getBasicAnimationWithFromValue:@(4)
                                                     toValue:@(self.exampleView.frame.size.height)
                                                     byValue:nil
                                              timingFunction:nil];
            break;
        case BasicAnimation_Type_CABorderWidth:
            animation = [self getBasicAnimationWithFromValue:@(0)
                                                     toValue:@(5)
                                                     byValue:nil
                                              timingFunction:nil];
            break;
        case BasicAnimation_Type_CAShadowColor:
            animation = [self getBasicAnimationWithFromValue:(id)self.exampleView.layer.shadowColor
                                                     toValue:(id)([UIColor blueColor].CGColor)
                                                     byValue:nil
                                              timingFunction:nil];
            break;
        case BasicAnimation_Type_CAShadowOffset:
            animation = [self getBasicAnimationWithFromValue:[NSValue valueWithCGSize:self.exampleView.layer.shadowOffset]
                                                     toValue:[NSValue valueWithCGSize:CGSizeMake(8, 8)]
                                                     byValue:nil
                                              timingFunction:nil];
            break;
        case BasicAnimation_Type_CAShadowOpacity:
            animation = [self getBasicAnimationWithFromValue:@(self.exampleView.layer.shadowOpacity)
                                                     toValue:@(0)
                                                     byValue:nil
                                              timingFunction:nil];
            break;
        case BasicAnimation_Type_CAShadowRadius:
            animation = [self getBasicAnimationWithFromValue:@(self.exampleView.layer.shadowRadius)
                                                     toValue:@(10)
                                                     byValue:nil
                                              timingFunction:nil];
            break;
        default:
            break;
    }
    
    [self.exampleView.layer addAnimation:animation forKey:@"animationKey"];
    
}

#pragma mark -
#pragma mark SET/GET
-(NSString *)animationKeyPath{
    return [[self tableViewDataSource] objectAtIndex:self.selectedIndexPath.row];
}

-(void)setSelectedIndexPath:(NSIndexPath *)selectedIndexPath{
    _selectedIndexPath = selectedIndexPath;
}

#pragma mark -
#pragma mark Animation

-(CASpringAnimation *)getBasicAnimationWithFromValue:(nonnull NSValue *)fromValue
                                            toValue:(nonnull NSValue *)toValue
                                            byValue:(nullable NSValue *)byValue
                                     timingFunction:(nullable CAMediaTimingFunction *)timingFunction{
    CASpringAnimation * animation = [CASpringAnimation animationWithKeyPath:self.animationKeyPath];
    if (timingFunction) {
        animation.timingFunction = timingFunction;
    }
    if (byValue) {
        animation.byValue = byValue;
    }
    animation.fromValue = fromValue;
    animation.toValue = toValue;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.autoreverses = NO;
    animation.repeatCount = 0;
//    animation.duration = 1.5f;
//    animation.repeatDuration = 1.5f;
    animation.speed = 1.0f;
    animation.beginTime = CACurrentMediaTime() + 0;
    
    animation.mass = self.massSlider.value; // 0 - 1 //质量（影响弹簧的惯性，质量越大，弹簧惯性越大，运动的幅度越大）
    animation.stiffness = self.stiffnessSlider.value; // 0 - 100 //弹性系数（弹性系数越大，弹簧的运动越快）
    animation.damping = self.dampingSlider.value; // 0 - 10 //阻尼系数（阻尼系数越大，弹簧的停止越快）
    animation.initialVelocity = -10; // 开始方向  //初始速率（弹簧动画的初始速度大小，弹簧运动的初始方向与初始速率的正负一致，若初始速率为0，表示忽略该属性）
    animation.duration = animation.settlingDuration; //结算时间（根据动画参数估算弹簧开始运动到停止的时间，动画设置的时间最好根据此时间来设置）
    
    return animation;
}

#pragma mark -
#pragma mark Data

-(NSArray *)tableViewDataSource{
    return @[
             kCARotation,
             kCARotationX,
             kCARotationY,
             kCARotationZ,
             
             kCAScale,
             kCAScaleX,
             kCAScaleY,
             kCAScaleZ,
             
             kCATranslation,
             kCATranslationX,
             kCATranslationY,
             kCATranslationZ,
             
             kCAPosition,
             kCAPositionX,
             kCAPositionY,
             
             kCABoundsSize,
             kCABoundsSizeW,
             kCABoundsSizeH,
             kCABoundsOriginX,
             kCABoundsOriginY,
             
             kCAOpacity,
             
             kCABackgroundColor,
             
             kCACornerRadius,
             
             kCABorderWidth,
             
             kCAShadowColor,
             kCAShadowOffset,
             kCAShadowOpacity,
             kCAShadowRadius
             ];
}

#pragma mark -
#pragma mark TableView

-(void)configCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == self.selectedIndexPath.section && indexPath.row == self.selectedIndexPath.row) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    cell.textLabel.text = [[self tableViewDataSource] objectAtIndex:indexPath.row];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [self configCell:cell indexPath:indexPath];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self tableViewDataSource].count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedIndexPath = indexPath;
    [self.listView reloadData];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"选择动画类型";
}

@end
