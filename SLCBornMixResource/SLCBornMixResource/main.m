//
//  main.m
//  SLCBornMixResource
//
//  Created by 魏昆超 on 2019/1/25.
//  Copyright © 2019 SecretLisa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLCMixResource.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        SLCMixResource * mixR = [[SLCMixResource alloc] init];
//        mixR.maxCount = 100; //图片个数
        [mixR beginMix];
    }
    return 0;
}
