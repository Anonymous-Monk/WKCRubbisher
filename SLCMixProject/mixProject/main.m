//
//  main.m
//  mixProject
//
//  Created by 魏昆超 on 2018/7/9.
//  Copyright © 2018年 WeiKunChao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLCMixManager.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
//        SLCMixManager *mix = [SLCMixManager new];
////        mix.fileHeader = @"SQZ"; //header
////        mix.fileName = @"QuizProject"; //文件夹名称
////        mix.fileNum = 150; //文件个数
//        mix.projectType = SLCMixProjectTypeSwift;
//        [mix fireOnBorn];
        
        
        SLCMixManager *mix = [SLCMixManager new];
        mix.childFullPath = @"/Users/weikunchao/Desktop/ssss";
//        mix.contaisArray = @[@"SLCmixLayout"];
        mix.childMethodNum = 10;
        mix.projectType = SLCMixProjectTypeObjectC;
        [mix fireOnChild];

    }
    return 0;
}
