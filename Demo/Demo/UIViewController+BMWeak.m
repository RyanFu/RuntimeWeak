//
//  UIViewController+BMWeak.m
//  Demo
//
//  Created by ___liangdahong on 2017/8/1.
//  Copyright © 2017年 ___liangdahong. All rights reserved.
//

#import "UIViewController+BMWeak.h"
#import "NSObject+BMBindingWeak.h"

@implementation UIViewController (BMWeak)

- (BMWeakObj *)weakObj {
    return [self bm_getWeakAssociatedObjectWithKey:_cmd];
}

- (void)setWeakObj:(BMWeakObj *)weakObj {
    [self bm_setWeekAssociatedObjectWithKey:@selector(weakObj) value:weakObj];
}

@end
