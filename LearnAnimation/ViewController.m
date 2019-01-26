//
//  ViewController.m
//  LearnAnimation
//
//  Created by mac on 2019/1/25.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "ViewController.h"
#import "CAAnimation/CATransition/CATrainsitionViewController.h"
#import "CAAnimation/CAAnimationGroup/CAAnimationGroupViewController.h"
#import "CAAnimation/CAPropertyAnimation/CABasicAnimation/CABasicAnimationViewController.h"
#import "CAAnimation/CAPropertyAnimation/CABasicAnimation/CASpringAnimation/CASpringAnimationViewController.h"
#import "CAAnimation/CAPropertyAnimation/CAKeyFrameAnimation/CAKeyFrameAnimationViewController.h"

typedef NS_ENUM(NSInteger,VC_INDEX){
    VC_INDEX_CABasicAnimation = 0,
    VC_INDEX_CASpringAnimation = 1,
    VC_INDEX_CAKeyFrameAnimation = 2,
    VC_INDEX_CAAnimationGroup = 3,
    VC_INDEX_CATransition = 4,
};

typedef NS_ENUM(NSInteger,ANIMATION_TYPE){
    ANIMATION_TYPE_CoreAnimation = 0,
    ANIMATION_TYPE_UIViewAnimation = 1
};

@interface ViewController ()
<UITableViewDelegate,
UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *listView;

@end

static NSString * cellIdentifier = @"cellIdentifier";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"iOS 动画";
    _listView.delegate = self;
    _listView.dataSource = self;
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark -
#pragma mark Data
-(NSArray *)coreAnimationTitle{
    return @[
             @"CABaseAnimation",
             @"CASpringAnimation",
             @"CAKeyFrameAnimation",
             @"CAAnimationGroup",
             @"CATransition"
             ];
}
-(NSArray *)uiviewAnimationTitle{
    return @[@"UIViewAnimation"];
}

#pragma mark -
#pragma mark TableView
-(void)configCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == ANIMATION_TYPE_CoreAnimation) {
        cell.textLabel.text = [[self coreAnimationTitle] objectAtIndex:indexPath.row];
    } else if (indexPath.section == ANIMATION_TYPE_UIViewAnimation) {
        cell.textLabel.text = [[self uiviewAnimationTitle] objectAtIndex:indexPath.row];
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [self configCell:cell indexPath:indexPath];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == ANIMATION_TYPE_CoreAnimation) {
        return [self coreAnimationTitle].count;
    } else if (section == ANIMATION_TYPE_UIViewAnimation) {
        return [self uiviewAnimationTitle].count;
    }
    return 0;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == ANIMATION_TYPE_CoreAnimation) {
        if (indexPath.row == VC_INDEX_CABasicAnimation) {
            CABasicAnimationViewController * viewController = [CABasicAnimationViewController initWithNib];
            [self.navigationController pushViewController:viewController animated:YES];
        } else if (indexPath.row == VC_INDEX_CASpringAnimation) {
            CASpringAnimationViewController * viewController = [CASpringAnimationViewController initWithNib];
            [self.navigationController pushViewController:viewController animated:YES];
        } else if (indexPath.row == VC_INDEX_CAKeyFrameAnimation) {
            CAKeyFrameAnimationViewController * viewController = [CAKeyFrameAnimationViewController initWithNib];
            [self.navigationController pushViewController:viewController animated:YES];
        } else if (indexPath.row == VC_INDEX_CAAnimationGroup) {
            CAAnimationGroupViewController * viewController = [CAAnimationGroupViewController initWithNib];
            [self.navigationController pushViewController:viewController animated:YES];
        } else if (indexPath.row == VC_INDEX_CATransition) {
            CATrainsitionViewController * viewController = [CATrainsitionViewController initWithNib];
            [self.navigationController pushViewController:viewController animated:YES];
        }
    } else if (indexPath.section == ANIMATION_TYPE_UIViewAnimation) {
        
    }
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == ANIMATION_TYPE_CoreAnimation) {
        return @"Core Animation";
    } else if (section == ANIMATION_TYPE_UIViewAnimation) {
        return @"UIViewAnimation";
    }
    return @"未知";
}


@end
