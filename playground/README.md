# playground

演练场

## 常用依赖

### 平台的图标生成和替换

flutter_launcher_icons

[官方文档](https://pub.dev/packages/flutter_launcher_icons)

```bash
# 安装
flutter pub add dev:flutter_launcher_icons

# 生成配置文件
dart run flutter_launcher_icons:generate

# 运行
dart run flutter_launcher_icons
```

### json 序列化、反序列化

json_serializable

[官方文档](https://pub.dev/packages/json_serializable)

- 安装依赖

```bash
flutter pub add json_annotation dev:build_runner dev:json_serializable
```

- 执行命令

```bash
flutter pub run build_runner build --delete-conflicting-outputs
# 后面的--delete-conflicting-outputs是可选的，作用是：
# 自动删除任何现存的，与即将生成的输出文件冲突的文件，然后继续构建过程。
# 这样可以清理由于老版本或不同构建配置造成的遗留文件

flutter packages pub run build_runner watch
# 监听生成
```

### EventBus

event_bus

[官方文档](https://pub.dev/packages/event_bus)

### 数据本地持久化

shared_preferences

[官方文档](https://pub.dev/packages/shared_preferences)

使用场景：轻量级数据，简单键值对，不频繁读写的存储场景

### 图片缓存

cached_network_image

[官方文档](https://pub.dev/packages/cached_network_image)

## 命令行

### 创建项目

```bash
flutter create --project-name stx_app --org com.shuatixiong --platforms=android,ios --android-language java --ios-language objc stx_app
```

- project-name → 项目名称，只能由 小写字母、下划线 和 数字 组成，不然会报错：xxx is not a valid Dart package name
- org → 项目包名
- platforms → 限定支持的平台，这里限定只支持 android 和 ios
- android-language → 设定安卓端项目语言，可选值：java, kotlin(默认)
- ios-language → 设置 iOS 端项目语言，可选值：objc, swift(默认)

可以添加想支持的平台

```bash
flutter config --enable-macos-desktop
flutter config --enable-linux-desktop
flutter config --enable-windows-desktop
```

### 启动 app

```bash
# 获取手机名称
adb devices
# 或
flutter devices

# 启动
flutter run -d 设备名
```
