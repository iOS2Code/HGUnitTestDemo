//
//  HGUnitTestDemoTests.m
//  HGUnitTestDemoTests
//
//  Created by ZhuHong on 2018/4/8.
//  Copyright © 2018年 CoderHG. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

/* 这里总结得比较全的 https://www.jianshu.com/p/009844a0b9ed
XCTFail(format…) 生成一个失败的测试；
XCTAssertNil(a1, format...)为空判断，a1为空时通过，反之不通过；
XCTAssertNotNil(a1, format…)不为空判断，a1不为空时通过，反之不通过；
XCTAssert(expression, format...)当expression求值为TRUE时通过；
XCTAssertTrue(expression, format...)当expression求值为TRUE时通过；
XCTAssertFalse(expression, format...)当expression求值为False时通过；
XCTAssertEqualObjects(a1, a2, format...)判断相等，[a1 isEqual:a2]值为TRUE时通过，其中一个不为空时，不通过；
XCTAssertNotEqualObjects(a1, a2, format...)判断不等，[a1 isEqual:a2]值为False时通过；
XCTAssertEqual(a1, a2, format...)判断相等（当a1和a2是 C语言标量、结构体或联合体时使用, 判断的是变量的地址，如果地址相同则返回TRUE，否则返回NO）；
XCTAssertNotEqual(a1, a2, format...)判断不等（当a1和a2是 C语言标量、结构体或联合体时使用）；
XCTAssertEqualWithAccuracy(a1, a2, accuracy, format...)判断相等，（double或float类型）提供一个误差范围，当在误差范围（+/-accuracy）以内相等时通过测试；
XCTAssertNotEqualWithAccuracy(a1, a2, accuracy, format...) 判断不等，（double或float类型）提供一个误差范围，当在误差范围以内不等时通过测试；
XCTAssertThrows(expression, format...)异常测试，当expression发生异常时通过；反之不通过；（很变态） XCTAssertThrowsSpecific(expression, specificException, format...) 异常测试，当expression发生specificException异常时通过；反之发生其他异常或不发生异常均不通过；
XCTAssertThrowsSpecificNamed(expression, specificException, exception_name, format...)异常测试，当expression发生具体异常、具体异常名称的异常时通过测试，反之不通过；
XCTAssertNoThrow(expression, format…)异常测试，当expression没有发生异常时通过测试；
XCTAssertNoThrowSpecific(expression, specificException, format...)异常测试，当expression没有发生具体异常、具体异常名称的异常时通过测试，反之不通过；
XCTAssertNoThrowSpecificNamed(expression, specificException, exception_name, format...)异常测试，当expression没有发生具体异常、具体异常名称的异常时通过测试，反之不通过

作者：登低自高
链接：https://www.jianshu.com/p/009844a0b9ed
來源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

@interface HGUnitTestDemoTests : XCTestCase

@property (nonatomic, strong) ViewController* vc;

@end

@implementation HGUnitTestDemoTests

// 这个方法 类似 +initialize
+ (void)setUp {
    [super setUp];
    
}

// 这个方法 类似 ## 方法  (还是自己点击进去看苹果的注释吧)
+ (void)tearDown {
    [super tearDown];
    
}

// 每次运行之前都都会被系统自动调用
- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // 初始化即将使用到的对象
    self.vc = [[ViewController alloc] init];
}

// 每次运行结束时 会被系统自动调用
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    
    // 方法只用结束, 销毁对象
    self.vc = nil;
    
    // 让我想起了 -dealloc 方法
    [super tearDown];
}


// 真实的测试方法
- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSInteger rstult = [self.vc unitTest];
    
    XCTAssertEqual(rstult, 51, @"结果不是你想要的");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
//        for (NSInteger i=0; i<1000; i++) {
//            NSLog(@"%zd", i);
//        }
    }];
}

// 异步测试
- (void)testAsync {
    // 获取异常对象
    XCTestExpectation* xctExt = [self expectationWithDescription:@"超1时1了"];
    // 异步执行 类似一个网络请求
    [self.vc testAsync:^{
        // 在没有超时的情况下, 解除异常设置 (注释仅仅是我个人理解翻译)
        [xctExt fulfill];
    }];
    
    // 设置最大能承受的超时时间 超过则直接异常提醒
    [self waitForExpectations:@[xctExt] timeout:4];
//    [self waitForExpectationsWithTimeout:4 handler:NULL];
}

// 这种写法, 除了纯属装 X, 应该没有什么作用吧 ??!!!
#define WAIT do {\
[self expectationForNotification:@"XCTWaitForExpectation" object:nil handler:nil];\
[self waitForExpectationsWithTimeout:3 handler:nil];\
} while (0);

#define NOTIFY \
[[NSNotificationCenter defaultCenter]postNotificationName:@"XCTWaitForExpectation" object:nil];

// 另一种高级的异步测试方法
- (void)testSeniorAsync {
    [self.vc testAsync:^{
        NOTIFY
    }];
    WAIT
}

@end
