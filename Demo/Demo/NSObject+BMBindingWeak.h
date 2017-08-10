//
//  NSObject+BMBindingWeak.h
//  Demo
//
//  Created by ___liangdahong on 2017/8/1.
//  Copyright © 2017年 ___liangdahong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (BMBindingWeak)

- (void)bm_setWeekAssociatedObjectWithKey:(const void *)key value:(id)value OBJC_AVAILABLE(10.6, 3.1, 9.0, 1.0);

- (id)bm_getWeakAssociatedObjectWithKey:(const void *)key OBJC_AVAILABLE(10.6, 3.1, 9.0, 1.0);

@end
