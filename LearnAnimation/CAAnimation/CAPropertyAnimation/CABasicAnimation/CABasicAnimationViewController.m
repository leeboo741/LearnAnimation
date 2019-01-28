//
//  CABasicAnimationViewController.m
//  LearnAnimation
//
//  Created by mac on 2019/1/26.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "CABasicAnimationViewController.h"

/* CATransform3D Key Paths */
/* 旋转x,y,z分别是绕x,y,z轴旋转 */
static NSString *kCARotation = @"transform.rotation";
static NSString *kCARotationX = @"transform.rotation.x";
static NSString *kCARotationY = @"transform.rotation.y";
static NSString *kCARotationZ = @"transform.rotation.z";

/* 缩放x,y,z分别是对x,y,z方向进行缩放 */
static NSString *kCAScale = @"transform.scale";
static NSString *kCAScaleX = @"transform.scale.x";
static NSString *kCAScaleY = @"transform.scale.y";
static NSString *kCAScaleZ = @"transform.scale.z";

/* 平移x,y,z同上 */
static NSString *kCATranslation = @"transform.translation";
static NSString *kCATranslationX = @"transform.translation.x";
static NSString *kCATranslationY = @"transform.translation.y";
static NSString *kCATranslationZ = @"transform.translation.z";

/* 平面 */
/* CGPoint中心点改变位置，针对平面 */
static NSString *kCAPosition = @"position";
static NSString *kCAPositionX = @"position.x";
static NSString *kCAPositionY = @"position.y";

/* CGRect */
static NSString *kCABoundsSize = @"bounds.size";
static NSString *kCABoundsSizeW = @"bounds.size.width";
static NSString *kCABoundsSizeH = @"bounds.size.height";
static NSString *kCABoundsOriginX = @"bounds.origin.x";
static NSString *kCABoundsOriginY = @"bounds.origin.y";

/* 透明度 */
static NSString *kCAOpacity = @"opacity";
/* 背景色 */
static NSString *kCABackgroundColor = @"backgroundColor";
/* 圆角 */
static NSString *kCACornerRadius = @"cornerRadius";
/* 边框 */
static NSString *kCABorderWidth = @"borderWidth";
/* 阴影颜色 */
static NSString *kCAShadowColor = @"shadowColor";
/* 偏移量CGSize */
static NSString *kCAShadowOffset = @"shadowOffset";
/* 阴影透明度 */
static NSString *kCAShadowOpacity = @"shadowOpacity";
/* 阴影圆角 */
static NSString *kCAShadowRadius = @"shadowRadius";

typedef NS_ENUM(NSInteger,BasicAnimation_Type){
    BasicAnimation_Type_CARotation = 0,
    BasicAnimation_Type_CARotationX = 1,
    BasicAnimation_Type_CARotationY = 2,
    BasicAnimation_Type_CARotationZ = 3,
    
    BasicAnimation_Type_CAScale = 4,
    BasicAnimation_Type_CAScaleX = 5,
    BasicAnimation_Type_CAScaleY = 6,
    BasicAnimation_Type_CAScaleZ = 7,
    
    BasicAnimation_Type_CATranslation = 8,
    BasicAnimation_Type_CATranslationX = 9,
    BasicAnimation_Type_CATranslationY = 10,
    BasicAnimation_Type_CATranslationZ = 11,
    
    BasicAnimation_Type_CAPosition = 12,
    BasicAnimation_Type_CAPositionX = 13,
    BasicAnimation_Type_CAPositionY = 14,
    
    BasicAnimation_Type_CABoundsSize = 15,
    BasicAnimation_Type_CABoundsSizeW = 16,
    BasicAnimation_Type_CABoundsSizeH = 17,
    BasicAnimation_Type_CABoundsOriginX = 18,
    BasicAnimation_Type_CABoundsOriginY = 19,
    
    BasicAnimation_Type_CAOpacity = 20,
    
    BasicAnimation_Type_CABackgroundColor = 21,
    
    BasicAnimation_Type_CACornerRadius = 22,
    
    BasicAnimation_Type_CABorderWidth = 23,
    
    BasicAnimation_Type_CAShadowColor = 24,
    BasicAnimation_Type_CAShadowOffset = 25,
    BasicAnimation_Type_CAShadowOpacity = 26,
    BasicAnimation_Type_CAShadowRadius = 27,
};

@interface CABasicAnimationViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *listView;

@property (nonatomic, strong) NSIndexPath * selectedIndexPath;

@property (nonatomic, strong) CABasicAnimation * basicAnimation;

@property (nonatomic, strong) NSString * animationKeyPath;

@end

static NSString * nibName = @"CABasicAnimationViewController";
static NSString * cellIdentifier = @"cellIdentifier";

@implementation CABasicAnimationViewController

#pragma mark -
#pragma mark Super

- (void)viewDidLoad {
    [super viewDidLoad];
    self.listView.delegate = self;
    self.listView.dataSource = self;
}
+(instancetype)initWithNib{
    return [[CABasicAnimationViewController alloc]initWithNibName:nibName bundle:nil];
}
-(void)initNavi{
    [super initNavi];
    self.navigationItem.title = @"CABasicAnimation";
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
    CABasicAnimation * animation;
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
            animation = [self getBasicAnimationWithFromValue:@(0)
                                                     toValue:@(1)
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
            animation = [self getBasicAnimationWithFromValue:@(0)
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

-(CABasicAnimation *)getBasicAnimationWithFromValue:(nonnull NSValue *)fromValue
                                          toValue:(nonnull NSValue *)toValue
                                          byValue:(nullable NSValue *)byValue
                                   timingFunction:(nullable CAMediaTimingFunction *)timingFunction{
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:self.animationKeyPath];
    if (timingFunction) {
        animation.timingFunction = timingFunction;
    }
    if (byValue) {
        animation.byValue = byValue;
    }
    animation.fromValue = fromValue;
    animation.toValue = toValue;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    animation.autoreverses = NO;
    animation.repeatCount = 0;
    animation.duration = 1.5f;
    animation.repeatDuration = 1.5f;
    animation.speed = 1.0f;
    animation.beginTime = CACurrentMediaTime() + 0;
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

/*
 // kCAMediaTimingFunctionLinear 线性
 // kCAMediaTimingFunctionEaseIn 先快后慢
 // kCAMediaTimingFunctionEaseOut 先慢后快
 // kCAMediaTimingFunctionEaseInEaseOut 慢快慢
 // kCAMediaTimingFunctionDefault 默认 线性
 // CAMediaTimingFunction(c1x:Float,c1y:Float,c2x:Float,c2y:Float) 贝塞尔曲线 http://cubic-bezier.com 可进行测试
 // [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
 1. timingFunction
 
 // 指定动画开始的时间。从开始延迟几秒的话，设置为【CACurrentMediaTime() + 秒数】 的方式
 2. beginTime
 
 // 速度参数 如果速度为2，4秒动画2秒执行完成，如果同时设置了动画的speed和layer 的speed，则实际的speed为两者相乘。
 3. speed
 
 // 动画时间
 4. duration
 
 // 循环次数
 5. repeatCount
 
 // 循环时间，设置动画的时间。在该时间内动画一直执行，不计次数。
 6. repeatDuration
 
 // 是否在播放完成后移除
 7. removedOnCompletion
 
 // kCAFillModeForwards//保持结束时状态 // 设置为该值，动画即使之后layer的状态将保持在动画的最后一帧，而removedOnCompletion的默认属性值是 YES，所以为了使动画结束之后layer保持结束状态，应将removedOnCompletion设置为NO。
 // kCAFillModeBackwards//保持开始时状态 // 设置为该值，将会立即执行动画的第一帧，不论是否设置了 beginTime属性。观察发现，设置该值，刚开始视图不见，还不知道应用在哪里。
 // kCAFillModeBoth//保持两者，我没懂两者是什么概念，实际使用中与kCAFillModeBackwards相同 // 该值是 kCAFillModeForwards 和 kCAFillModeBackwards的组合状态
 // kCAFillModeRemoved//移除 // 设置为该值，动画将在设置的 beginTime 开始执行（如没有设置beginTime属性，则动画立即执行），动画执行完成后将会layer的改变恢复原状。
 // 这个属性使用的时候要设置removedOnCompletion = NO
 8. fillMode
 
 // 是否执行逆动画
 9. autoreverses
 */
