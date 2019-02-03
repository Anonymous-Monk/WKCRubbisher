//
//  SLCMixResource.m
//  SLCMixResource
//
//  Created by 魏昆超 on 2019/1/25.
//  Copyright © 2019 SecretLisa. All rights reserved.
//

#import "SLCMixResource.h"
#import "SLCResources.h"
@import AppKit;


@interface SLCMixResource()

@property (nonatomic, copy) NSString * bundleName;
@property (nonatomic, strong) NSArray <NSImage *> * images;

@end

@implementation SLCMixResource

- (instancetype)init
{
    if (self = [super init]) {
        self.maxCount = 100;
    }
    return self;
}

- (void)beginMix
{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    BOOL isBundleExist = [fileManager fileExistsAtPath:[self defaultPath]];
    if (isBundleExist) {
        NSLog(@"***********有同名bundle存在!");
        return;
    } else {
        NSError * error = nil;
        [fileManager createDirectoryAtPath:[self defaultPath] withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
             NSLog(@"***********创建bundle失败!");
            return;
        }
        NSLog(@"***********bundle创建中!!!");
        NSLog(@"***********开始生成图片!");
        
        for (NSInteger index = 0; index < _maxCount; index ++) {
            NSInteger rIndex = [self randomIndex];
            NSString * name = [SLCResourceArray objectAtIndex:rIndex];
            [self writeImageWithName:name];
        }
        
        NSLog(@"***********生成混淆图片结束!");
    }
}

- (void)writeImageWithName:(NSString *)name
{
    NSString * userPath = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES).lastObject;
    userPath = [[_projectLocation ? : userPath stringByAppendingPathComponent:@"SLCBornMixResource"] stringByAppendingPathComponent:@"pictures"];
    
    NSString * picturePath = [userPath stringByAppendingPathComponent:name];
    
    NSImage * image = [[NSImage alloc] initWithContentsOfURL:[NSURL fileURLWithPath:picturePath]];
    
    NSData * imageData = [image TIFFRepresentation];
    NSString * imagePath = [[self defaultPath] stringByAppendingPathComponent:name];
    
    
    BOOL isWriteSuccess = [imageData writeToFile:imagePath atomically:YES];
    if (isWriteSuccess) {
        NSLog(@"****************%@图片写入成功!",name);
    } else {
        NSLog(@"****************%@图片导入失败!",name);
    }
}

- (NSInteger)randomIndex
{
    return arc4random() % SLCResourceArray.count;
}

/**
 默认桌面 -> 生成一个bundle

 @return 字符串
 */
- (NSString *)defaultPath
{
    return [NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.bundle",self.bundleName]];
}

- (NSString *)getRandomBundleName
{
    char data[6];
    for (int x=0;x < 6; data[x++] = (char)('A' + (arc4random_uniform(26))));
    NSString *randomStr = [[NSString alloc] initWithBytes:data length:6 encoding:NSUTF8StringEncoding];
    NSString *string = [NSString stringWithFormat:@"%@",randomStr];
    return string;
}

- (NSString *)bundleName
{
    if (!_bundleName) {
        _bundleName = [self getRandomBundleName];
    }
    return _bundleName;
}

- (NSArray<NSImage *> *)images
{
    if (!_images) {
        _images = @[
                    [NSImage imageNamed:@"alt_baoyou_1"]
                    ];
    }
    return _images;
}

@end
