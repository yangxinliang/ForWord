//
//  ViewController.m
//  ForWord
//
//  Created by PingAnXL on 2017/8/14.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>

#import "OBGManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


// oc 中的创建对象和初始化对象两种写法
- (void)creatNSObjectTest {

    // 下面的可以代表  [[NSObject alloc] init];
    /* objc_msgSend 前半部分表示传的参数类型  id (*)  表示返回值的类型  objc_msgSend 后半部分和前半部分是一一对应的
     *
     */
    // 1.创建对象
    NSObject * p1 =  ((NSObject * (*)(id,SEL))objc_msgSend)((id)[NSObject class],@selector(alloc));
    // 2.初始化对象
    p1 =  ((NSObject *(*)(id, SEL))objc_msgSend)((id)p1,@selector(init));

}


// 使用 objc_msgSend 发送 无参数和无返回值消息
- (void)testObjc {

    ((void (*)(id,SEL))objc_msgSend)(self,@selector(test1));

}
// 方法的实现
- (void)test1 {

    NSLog(@"无参数无返回值");

}

// 有参数 无返回值
- (void)testObjcMessage:(id)arg{

    
    ((void (*)(id,SEL,id))objc_msgSend)(self,@selector(test1:),arg);

}
// 方法的实现
- (void)test1:(id)arg {

    NSLog(@"%@",arg);

}

// 无参数有返回值
- (id)testObjcMessage {

    return  ((id (*)(id, SEL))objc_msgSend)(self,@selector(test3));

}
// 方法的实现
- (id)test3 {

 return @"有返回值";

}

// 有返回值 有参数
- (id)testMessageObjcSend:(id)arg {

    return ((id (*) (id,SEL,id))objc_msgSend)(self,@selector(test4:),arg);

}
//方法的实现
- (id)test4:(id)arg {

    return arg;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {


//        NSDictionary * dic = @{@"name":@"qweqwe",@"age":@"10"};
//    
//        [OBGManager requestAPIName:APINameTypeTest2 paraters:dic callBack:^(id response, id data) {
//    
//            NSLog(@"%@ %@",response,data);
//    
//        }];
    
    //无参数无返回值
//    [self testObjc];
    
    // 有参数 无返回值的
//    [self testObjcMessage:@"test"];
    
    // 无参数 有返回值
    
//    id t = [self testObjcMessage];
//    NSLog(@"%@",t);
//
    // 有返回值 有参数
    id t2 = [self testMessageObjcSend:@"有返回值，有参数的"];
    
    NSLog(@"%@",t2);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
