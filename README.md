# WKCRubbisher

iOS Code obfuscation(Whether it is OC or swift).

The function is as follows:
1. create junk files and internal properties and functions.
2. add garbage functions to existing files.
3. change resource name and memory size.
4. create garbage resources.

## Junk Files.

You can change some prarms you want in the class.
@param projectType -> OC or Swift.
@param filesCount -> file total counts
@param filePrefix -> filePrefix
@param method startRubbish to start.
mark: There will be a WKCRubbisher class, which has a class method fire, which will automatically call all the methods in the useless class.
```swift
WKCRubbisherManager * rubbisher = [WKCRubbisherManager new];
rubbisher.projectType = WKCProjectTypeSwift;
[rubbisher startRubbish];
```
After all the files created, there is a class named WKCRubbisher, when you run [WKCRubbisher fire], all the garbage file's method are taking to run.

![Alt text](https://github.com/WeiKunChao/WKCRubbisher/raw/master/screenShort/rubbisher.png).

## Add Garbage Functions.

it is achieved by adding classification (the classification declaration and implementation are hidden, and the outside is inaccessible)
Use as above.
```swift
WKCRubbisherSteper * steper = [[WKCRubbisherSteper alloc] init];
steper.projectType = WKCProjectTypeSwift;
steper.projectFullPath = @"your project fullPath";
[steper startRubbish];
```

![Alt text](https://github.com/WeiKunChao/WKCRubbisher/raw/master/screenShort/resouceRename.png).

## Resource Rename

For example` [UIImage imageNamed: @"testImage"];`,  The actual name becomes testImage_wkcMapper after the change, but the actual reference name is still testImage, which is still` [UIImage imageNamed: @"testImage"];` use. Does not change the original change. And in the process of changing the hair will simply compress the 0.98 scale and change the size of the source image.

```swift
WKCResourceMapper * mapper = [[WKCResourceMapper alloc] init];
mapper.projectFullPath = @"your project fullPath";
[mapper startMapper];
```
![Alt text](https://github.com/WeiKunChao/WKCRubbisher/raw/master/screenShort/resourceMapper.png).


## Garbage Resources

Create obfuscated resources (desktop).
mark : @param thisScriptFullPath is needed.

```swift
WKCResouceBorner * resourceBorner = [[WKCResouceBorner alloc] init];
resourceBorner.thisScriptFullPath = @"this script fullPath";
[resourceBorner startBorn];
```

![Alt text](https://github.com/WeiKunChao/WKCRubbisher/raw/master/screenShort/resources.png).








iOS 代码混淆: ( 作用自己体会......)
功能如下: 
1. 生成垃圾文件和内部属性及函数.
2. 在已有文件内增加垃圾函数
3. 改变资源名.
4. 生成垃圾资源文件.

## 垃圾文件.

1.  设置变量
参数 projectType -> 项目类型,OC还是swift.
参数 filesCount -> 文件总个数.
参数 filePrefix -> 自定义所有文件的前缀名称.
参数 调用方法startRubbish 开始.

在执行文件`main.m`内修改变量.
```swift
WKCRubbisherManager * rubbisher = [WKCRubbisherManager new];
rubbisher.projectType = WKCProjectTypeSwift;
[rubbisher startRubbish];
```
2. 调用
代码拉进项目(或设置路径直接在工程生成)后,有一个默认调用类.
`#import "WKCRubbisher.h"`
所有的类会生成一个对象,并且简单操作其内的属性和方法,执行完成后会立即被释放.
```
[WKCRubbisher fire];
```

## 增加垃圾函数

通过添加分类的方式实现(分类声明和实现均隐藏,外部无法访问)
1. 调用 
在`main.m`内调用
```swift
WKCRubbisherSteper * steper = [[WKCRubbisherSteper alloc] init];
steper.projectType = WKCProjectTypeSwift;
steper.projectFullPath = @"此处写入你的项目全路径(直接文件夹拖到这即可)";
[steper startRubbish];
```

## 资源重命名.
资源处理
1. 资源重命名.
没有改变资源外部使用名称,改变了资源本地名和引用名.
2. 简单压缩.  - 更改图片的字节数.
```swift
WKCResourceMapper * mapper = [[WKCResourceMapper alloc] init];
mapper.projectFullPath = @"这里填入你的工程地址";
[mapper startMapper];
```

## 混淆资源
生成混淆资源文件(以bundle形式,默认在桌面).
注: 参数thisScriptFullPath必须设置(脚本放置位置).
```swift
WKCResouceBorner * resourceBorner = [[WKCResouceBorner alloc] init];
resourceBorner.thisScriptFullPath = @"this script fullPath";
[resourceBorner startBorn];
```

## 版本记录
### 版本 1.1 添加了swift的混淆代码和函数.
### 版本 1.3 添加SLCResourceMapper.
### 版本 1.4 添加SLCBornMixResource.

## 版本2.0 更名WKCRubbisher
整体优化大改版,  代码可读性更强. 生成的属性或方法更多,排版更强.
1. WKCRubbisher 取代了原来的 SLCMixManager.
2. WKCResourceMapper  替换SLCResourceMapper.
3. WKCResouceBorner 替换SLCBornMixResource.

