//
//  NSObject+BMBindingWeak.m
//  Demo
//
//  Created by ___liangdahong on 2017/8/1.
//  Copyright © 2017年 ___liangdahong. All rights reserved.
//

#import "NSObject+BMBindingWeak.h"
#import <objc/runtime.h>

@interface BMBindingWeakObject : NSObject

@property (copy, nonatomic) dispatch_block_t deallocBlock; ///< deallocBlock

@end

@implementation BMBindingWeakObject

- (instancetype)initWithBlock:(dispatch_block_t)aBlock {
    if (self = [super init]) {
        _deallocBlock = [aBlock copy];
    }
    return self;
}

- (void)dealloc {
    if (_deallocBlock) {
        _deallocBlock();
    }
}

@end

const void *runAtDeallocBlockKey = &runAtDeallocBlockKey;

@implementation NSObject (BMBindingWeak)

- (void)bm_setWeekAssociatedObjectWithKey:(const void *)key value:(id)value {
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
    if (!value) {
        return;
    }
    __weak typeof(self) weakSelf = self;
    [value bm_runAtDealloc:^{
        __strong typeof(weakSelf) self = weakSelf;
        if (self) {
            objc_setAssociatedObject(self, key, nil, OBJC_ASSOCIATION_ASSIGN);
            [self bm_setWeekAssociatedObjectWithKey:key value:nil];
        }
    }];
    
    NSPointerArray;
    
    
}

- (id)bm_getWeakAssociatedObjectWithKey:(const void *)key {
    return objc_getAssociatedObject(self, key);
}

- (void)bm_runAtDealloc:(dispatch_block_t)block {
    if (block) {
        BMBindingWeakObject *executor = [[BMBindingWeakObject alloc] initWithBlock:block];
        objc_setAssociatedObject(self, runAtDeallocBlockKey, executor, OBJC_ASSOCIATION_RETAIN);
    }
}

@end
