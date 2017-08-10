//
//  UIViewController+BMWeak.h
//  Demo
//
//  Created by ___liangdahong on 2017/8/1.
//  Copyright © 2017年 ___liangdahong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMWeakObj.h"

@interface UIViewController (BMWeak)

@property (weak, nonatomic) BMWeakObj *weakObj; ///< weakObj
@property (nonatomic, assign) <#type#> <#name#>;
@property (strong, nonatomic) <#type#> *<#name#>;

@end
