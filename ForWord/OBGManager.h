//
//  OBGManager.h
//  ForWord
//
//  Created by PingAnXL on 2017/8/14.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,APIName){
    
    APINameTypeTest = 0,  // 有参数有返回值
    APINameTypeTest1 ,    // 无参数有返回值
    APINameTypeTest2 ,    // 有参数无返回值
    APINameTypeTest3      // 无参数无返回值
    
};


@interface OBGManager : NSObject

/**
 给外部提供的方法
 
 @param name    在枚举中写上需要条用的额方法名
 @param parater 需要传的参数
 @param callback block 回调
 */
+ (void)requestAPIName:(APIName)name paraters:(NSDictionary*)parater callBack:(void(^)(id response,id data))callback;


@end
