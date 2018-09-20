//
//  SLCMixManager.h
//  mixProject
//
//  Created by 魏昆超 on 2018/7/9.
//  Copyright © 2018年 WeiKunChao. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef GCD_Async_Serial
#define GCD_Async_Serial(block)\
dispatch_async(dispatch_queue_create("com.slc.queue", DISPATCH_QUEUE_SERIAL),block);
#endif

#ifndef GCD_Semaphore
#define GCD_Semaphore(num)\
dispatch_semaphore_create(num);
#endif

#ifndef GCD_Lock
#define GCD_Lock(lock)\
dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
#endif

#ifndef GCD_Unlock
#define GCD_Unlock(lock)\
dispatch_semaphore_signal(lock);
#endif

typedef NS_ENUM(NSInteger,SLCMixProjectType) {
    /**OC*/
    SLCMixProjectTypeObjectC = 0,
    /**Swift*/
    SLCMixProjectTypeSwift
};

@interface SLCMixManager : NSObject

/**
 要生成的文件语言 - OC、Swift - 默认OC
 */
@property (nonatomic, assign) SLCMixProjectType projectType;

#pragma mark ---<只对fireOnBorn有效>---  生成垃圾文件和属性及方法
/**
 文件前缀 - 默认SLC
 */
@property (nonatomic, copy) NSString * fileHeader;

/**
 生成的文件夹名称 - 默认mixedProject
 */
@property (nonatomic, copy) NSString * fileName;

/**
 文件生成的目的路径 - 默认桌面
 */
@property (nonatomic, copy) NSString * fullPath;

/**
 文件个数 - 默认120(OC h,m 算一个文件)
 */
@property (nonatomic, assign) NSInteger fileNum;



#pragma mark ---<只对fireOnChild有效>--- 在已有文件生成垃圾方法
/**
 * 默认不处理包含@".xcassets"、@".xcworkspace"、@".xcodeproj"、@".framework"、@".lproj"、@"main"、@"AppDelegate"、@".plist"、@".json"、@".zip"、@".storyboard"、@"Podfile"、@"Pods"、@".zip"、@"README"、@".git"、 @".gitignore"、@".DS_Store"、@".png"、@".jpg"、@".data"、@".bin"、@".mko"、@".txt"、@".mp4"、@".pch"、@".mov" 如有其它可更改和添加.
 */


/**
 工程全路径
 */
@property (nonatomic, copy) NSString * childFullPath;

/**
 要生成的随机方法的个数 - 默认 1-6个u随机
 */
@property (nonatomic, assign) NSUInteger childMethodNum;

/**
 指定方法生成时,末端位置
 */
@property (nonatomic, assign) NSUInteger childTailPosition;

/**
 指定处理特定文件名的文件 - 不设全处理
 */
@property (nonatomic, strong) NSArray <NSString *>* contaisArray;


/**
 生成垃圾文件、属性和方法
 */
- (void)fireOnBorn;

/**
 再已经文件生成垃圾方法
 */
- (void)fireOnChild;

@end
