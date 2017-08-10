//
//  ViewController.m
//  Demo
//
//  Created by ___liangdahong on 2017/8/1.
//  Copyright © 2017年 ___liangdahong. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+BMWeak.h"

@interface ViewController ()

@property (strong, nonatomic) BMWeakObj *weakObj11; ///< weakObj

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.weakObj11 = [BMWeakObj new];
    
    NSLog(@"%@", self.weakObj);
    self.weakObj = self.weakObj11;
    NSLog(@"%@", self.weakObj);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    });
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"%@", self.weakObj);
    
    self.weakObj11 = nil;
    
    NSLog(@"%@", self.weakObj);
    
}

@end
