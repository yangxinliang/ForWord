//
//  ViewController.m
//  ForWord
//
//  Created by PingAnXL on 2017/8/14.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

#import "ViewController.h"

#import "OBGManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {


        NSDictionary * dic = @{@"name":@"qweqwe",@"age":@"10"};
    
        [OBGManager requestAPIName:APINameTypeTest2 paraters:dic callBack:^(id response, id data) {
    
            NSLog(@"%@ %@",response,data);
    
    
            
        }];


}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
