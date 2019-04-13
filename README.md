# WKCRubbisher


iOS 代码混淆: ( 作用自己体会......)

1.生成垃圾文件和内部属性及函数.
2.在已有文件内增加垃圾函数

## 生成垃圾文件和内部属性及函数.
1.  设置变量

在执行文件`main.m`内修改变量.
```
WKCRubbisherManager * rubbisher = [WKCRubbisherManager new];
rubbisher.projectType = WKCProjectTypeSwift;
[rubbisher startRubbish];
```

2. 执行
 command + r 运行,文件夹(不设置的情况下，默认在桌面)生成.

3. 调用
代码拉进项目(或设置路径直接在工程生成)后,有一个默认调用类.
`#import "WKCRubbisher.h"`

所有的类会生成一个对象,并且简单操作其内的属性和方法,执行完成后会立即被释放.
```
[WKCRubbisher fire];
```

##  在已有文件内增加垃圾函数
1. 调用 
在`main.m`内调用
```
WKCRubbisherSteper * steper = [[WKCRubbisherSteper alloc] init];
steper.projectType = WKCProjectTypeSwift;
steper.projectFullPath = @"此处写入你的项目全路径(直接文件夹拖到这即可)";
[steper startRubbish];
```

##  文件前缀重命名
#### 原理

1. 去除不操作的文件类型.

2. 遍历文件,更改本地文件名.
`require 'find'`
(1)利用Find类去遍历所有文件.
(2)利用File类去更改文件内容(属性名会方法名前缀).
(3)再去更改文件名.

3. 仅仅更改本地文件是无用的,需要更改xcode对文件的引用.如下图:

![Alt text](https://github.com/WeiKunChao/SLCRenameTool/raw/master/screenShort/1.png).

但这只针对.m文件,对于.h文件则需要更改其关联路径.如下图:

![Alt text](https://github.com/WeiKunChao/SLCRenameTool/raw/master/screenShort/2.png).

使用Cocoa的轮子` require 'xcodeproj'`(Cocoa处理Pod文件的轮子),去更改文件的引用.

[xcodeproj官方文档](https://www.rubydoc.info/gems/xcodeproj)

```
$project = Xcodeproj::Project.open($project_path) # 打开工程
$target = $project.targets.first # 目标target
...
```

#### 使用
1. 参数
```
参数: $file_full_path 工程主路径
参数: $group_main 需要操作的主文件夹
参数: $file_header_old 需要替换的前缀
参数: $file_header_new 替换后的前缀
参数: $is_rename_inside 是否替换属性或方法前缀
```
2. 运行
`$ cd  脚本所在目录`
`$ ruby RenameClass.rb` 


### Assets.xcassets内的资源文件重命名.
资源处理
1. 资源重命名.
没有改变资源外部使用名称,改变了资源本地名和引用名.
2. 简单压缩.  - 更改图片的字节数.
```
SLCResourceMapper *mapper = [SLCResourceMapper new];
mapper.projectFullPath = @"/Users/weikunchao/Desktop/ffff";
mapper.versionNumber = 1;
[mapper fireOn];
```

### 生成混淆资源文件
生成混淆资源文件(以bundle形式,默认在桌面).
注:如果不指定projectLocation,需要把工程文件放置在桌面.
```
SLCMixResource * mixR = [[SLCMixResource alloc] init];
//        mixR.maxCount = 100; //图片个数
[mixR beginMix];

```

## 版本记录
### 版本 1.1 添加了swift的混淆代码和函数.
### 版本 1.2 添加SLCRename - 文件前缀重命名(OC或swift均可以).
### 版本 1.3 添加SLCResourceMapper.
### 版本 1.4 添加SLCBornMixResource.

## 版本2.0 更名WKCRubbisher
整体优化大改版,  代码可读性更强. 生成的属性或方法更多,排版更强.

WKCRubbisher 取代了原来的 SLCMixManager.
