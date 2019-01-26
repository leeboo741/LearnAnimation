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

@end

static NSString * nibName = @"CABasicAnimationViewController";
static NSString * cellIdentifier = @"cellIdentifier";

@implementation CABasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.listView.delegate = self;
    self.listView.dataSource = self;
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
    [rightButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightBarButton = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightBarButton;
}
-(void)initView{
    [super initView];
}
-(void)initData{
    [super initData];
    self.selectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
}
-(void)rightBarButtonAction:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        // 开始动画
        NSLog(@"开始动画");
        [self.exampleView.layer addAnimation:self.basicAnimation forKey:nil];
    }
}

#pragma mark -
#pragma mark SET/GET
-(void)setSelectedIndexPath:(NSIndexPath *)selectedIndexPath{
    _selectedIndexPath = selectedIndexPath;
    switch (selectedIndexPath.row) {
        case BasicAnimation_Type_CARotation:
            
            break;
        case BasicAnimation_Type_CARotationX:
            
            break;
        case BasicAnimation_Type_CARotationY:
            
            break;
        case BasicAnimation_Type_CARotationZ:
            
            break;
        case BasicAnimation_Type_CAScale:
            
            break;
        case BasicAnimation_Type_CAScaleX:
            
            break;
        case BasicAnimation_Type_CAScaleY:
            
            break;
        case BasicAnimation_Type_CAScaleZ:
            
            break;
        case BasicAnimation_Type_CATranslation:
            
            break;
        case BasicAnimation_Type_CATranslationX:
            
            break;
        case BasicAnimation_Type_CATranslationY:
            
            break;
        case BasicAnimation_Type_CATranslationZ:
            
            break;
        case BasicAnimation_Type_CAPosition:
            
            break;
        case BasicAnimation_Type_CAPositionX:
            
            break;
        case BasicAnimation_Type_CAPositionY:
            
            break;
        case BasicAnimation_Type_CABoundsSize:
            
            break;
        case BasicAnimation_Type_CABoundsSizeW:
            
            break;
        case BasicAnimation_Type_CABoundsSizeH:
            
            break;
        case BasicAnimation_Type_CABoundsOriginX:
            
            break;
        case BasicAnimation_Type_CABoundsOriginY:
            
            break;
        case BasicAnimation_Type_CAOpacity:
            
            break;
        case BasicAnimation_Type_CABackgroundColor:
            
            break;
        case BasicAnimation_Type_CACornerRadius:
            
            break;
        case BasicAnimation_Type_CABorderWidth:
            
            break;
        case BasicAnimation_Type_CAShadowColor:
            
            break;
        case BasicAnimation_Type_CAShadowOffset:
            
            break;
        case BasicAnimation_Type_CAShadowOpacity:
            
            break;
        case BasicAnimation_Type_CAShadowRadius:
            
            break;
        default:
            break;
    }
}

#pragma mark -
#pragma mark Animation

- (CABasicAnimation *)getAnimationKeyPath:(NSString *)keyPath
                                fromValue:(id)fromValue
                                  toValue:(id)toValue
                                  byValue:(id)byValue
                           timingFunction:(CAMediaTimingFunction *)timingFunction
                                 duration:(CGFloat)duration
                              repeatCount:(NSInteger)repeatCount{
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
