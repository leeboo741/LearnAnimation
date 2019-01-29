//
//  CABasicAnimationViewController.h
//  LearnAnimation
//
//  Created by mac on 2019/1/26.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "BaseViewController.h"

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

@interface CABasicAnimationViewController : BaseViewController

@end
