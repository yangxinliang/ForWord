//
//  OBGManager.m
//  ForWord
//
//  Created by PingAnXL on 2017/8/14.
//  Copyright © 2017年 PingAnXL. All rights reserved.
//

#import "OBGManager.h"
#import <objc/message.h>

@implementation OBGManager
/**
*  创建网络请求函数的列表,  CallBack:   必须保持这种格式，保持一致，后面对这个有判断
*
*  @return 函数列表的数组
*/
+ (NSArray *)createFunctionListArray{
    NSArray *array = @[@"getTest:CallBack:",      // 有参数有返回值
                       @"getTest1CallBack:",       // 无参数有返回值
                       @"getTest2:",               // 有参数无返回值
                       @"getTest3",                 // 无参数无返回值
                       ];
    return array;
}



/**
 *    遇到几种函数(下面主要是通过block块来回调)
 *   1 无参数，无返回值
 *   2  有参赛，无返回值
 *   3  无参数， 有返回值
 *   4  有参数  有返回值
 *
 */
+ (void)requestAPIName:(APIName)name paraters:(NSDictionary*)parater callBack:(void(^)(id response,id data))callback {
    
    NSArray *functionList = [self createFunctionListArray];
    NSString *selectorStr =functionList[name];
    
    SEL selector = NSSelectorFromString(selectorStr);
    
    if ([self respondsToSelector:selector]) {
        NSArray * tempArray = [selectorStr componentsSeparatedByString:@":"];
        
        if (tempArray.count - 1 == 2) { // 有参数返回值
            ((void(*)(id, SEL, id ,void(^)(id response,id data)))objc_msgSend)(self,selector,parater,callback);
            
        }else if (tempArray.count - 1 == 1){
            
            NSString * tempStr = @"CallBack:"; // 无参数返回值
            if ([self string:selectorStr containsOtherString:tempStr]) {
                
                ((void(*)(id,SEL,void(^)(id response,id data)))objc_msgSend)(self,selector,callback);
                
            }else {  // 有参数没有返回值
                ((void(*)(id,SEL,id))objc_msgSend)(self,selector,parater);
                
            }
            
        }else if (tempArray.count - 1 == 0){
            
            ((void(*)(id,SEL))objc_msgSend)(self,selector);  // 无参数无回调
            
        }
    }
    
    
}

// 有参数有返回值
+ (void)getTest:(NSDictionary *)parater CallBack:(void(^)(id reponse,id data))callback {
    
    
    callback(parater[@"name"],parater[@"age"]);
    
    
}

// 无参数 有返回值
+ (void)getTest1CallBack:(void(^)(id reponse, id data))callback {
    
    callback(@"第一个参数",@"第二个参数");
    
    
}

// 有参数 无返回值
+ (void)getTest2:(NSDictionary *)partemer {
    
    NSLog(@"%@",partemer);
    
}

// 无参数无返回值
+ (void)getTest3 {
    
    NSLog(@"无参数无返回值");
    
}




/**
 *  判断string中是否包含另一字符串
 *
 *  @param string string
 *  @param other  另一字符串
 *
 *  @return 是否包含另一字符串（YES/NO）
 */
+ (BOOL)string:(NSString *)string containsOtherString:(NSString*)other {
    if (![string isKindOfClass:[NSString class]]) {
        return NO;
    }
    NSRange range = [string rangeOfString:other];
    return range.location != NSNotFound;
}



@end
