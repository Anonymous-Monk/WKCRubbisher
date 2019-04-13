//
//  WKCRubbisherManager.h
//  WKCRubbisher
//
//  Created by WeiKunChao on 2019/4/13.
//  Copyright © 2019 SecretLisa. All rights reserved.
//
//  本类作用: 生成n个无用的文件
//  (1)projectType -> 项目类型,OC还是swift
//  (2)filesCount -> 文件总个数.
//  (3)filePrefix -> 自定义所有文件的前缀名称
//  (4)调用方法startRubbish 开始.
//
//
//  注: 文件中会有一个WKCRubbisher类,其内有类方法fire,调用时会主动将所有无用类内的方法全部都调用一遍
///////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////


#import <Foundation/Foundation.h>
#import "WKCRubbisherFiler.h"

@interface WKCRubbisherManager : NSObject

/** 要创建项目类型 */
@property (nonatomic, assign) WKCProjectType projectType;
/** 文件总个数 默认50*/
@property (nonatomic, assign) NSInteger filesCount;
/** 要生成文件的文件前缀 -> 不设置默认以wkc开头*/
@property (nonatomic, copy) NSString * filePrefix;

// 开始
- (void)startRubbish;

@end

