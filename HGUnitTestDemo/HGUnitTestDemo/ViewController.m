//
//  ViewController.m
//  HGUnitTestDemo
//
//  Created by ZhuHong on 2018/4/8.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.layer.contents = @"123";
}

/** 一个简单的例子 */
- (NSInteger)unitTest {
    NSLog(@"unitTest__");
    
    return 50;
}

/** 一个简单的异步执行的例子 */
- (void)testAsync:(void(^)(void))block {
    NSLog(@"testAsync_start");
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:5];
        NSLog(@"testAsync_end");
        
        if (block) {
            block();
        }
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
