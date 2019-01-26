//
//  BaseViewControllerProtocol.h
//  LearnAnimation
//
//  Created by mac on 2019/1/25.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol BaseViewControllerProtocol <NSObject>

/**
 可选方法
 */
@optional

/**
 必须方法
 */
@required
/**
 有 xib 文件的 可以重写该方法，通过该方法获取实例对象
 
 @return 实例对象
 */
+(instancetype)initWithNib;

/**
 初始化navi
 */
-(void)initNavi;

/**
 初始化数据
 */
-(void)initData;

/**
 初始化页面
 */
-(void)initView;

@end

