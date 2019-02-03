//
//  SLCMixResource.h
//  SLCMixResource
//
//  Created by 魏昆超 on 2019/1/25.
//  Copyright © 2019 SecretLisa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLCMixResource : NSObject

@property (nonatomic, copy) NSString * projectLocation; //这个工程所在的位置 -> 默认处理桌面
@property (nonatomic, assign) NSUInteger maxCount; //图片个数 - 默认100

- (void)beginMix; //开始

@end

