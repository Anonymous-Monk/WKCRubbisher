//
//  main.m
//  WKCRubbisher
//
//  Created by WeiKunChao on 2019/4/2.
//  Copyright © 2019 SecretLisa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WKCRubbisherManager.h"
#import "WKCRubbisherSteper.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        WKCRubbisherManager * rubbisher = [WKCRubbisherManager new];
        rubbisher.projectType = WKCProjectTypeSwift;
        [rubbisher startRubbish];
        
        WKCRubbisherSteper * steper = [[WKCRubbisherSteper alloc] init];
        steper.projectType = WKCProjectTypeSwift;
        steper.projectFullPath = @"此处写入你的项目全路径(直接文件夹拖到这即可)";
        [steper startRubbish];
    }
    return 0;
}
