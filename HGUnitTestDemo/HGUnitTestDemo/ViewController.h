//
//  ViewController.h
//  HGUnitTestDemo
//
//  Created by ZhuHong on 2018/4/8.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

/**
 一个简单的例子
 */
- (NSInteger)unitTest;


/**
 一个简单的异步执行的例子

 @param block 回调
 */
- (void)testAsync:(void(^)(void))block;

@end

