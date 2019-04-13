//
//  main.m
//  WKCResourceMapper
//
//  Created by WeiKunChao on 2019/4/13.
//  Copyright © 2019 SecretLisa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WKCResourceMapper.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        WKCResourceMapper * mapper = [[WKCResourceMapper alloc] init];
        mapper.projectFullPath = @"你的项目地址";
        [mapper startMapper];
    }
    return 0;
}
