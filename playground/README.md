# playground

演练场

## 插件工具

### IconfontIcon.dart 文件自动生成

```js
javascript:function download(filename, text) {  var element = document.createElement('a');  element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));  element.setAttribute('download', filename);  element.style.display = 'none';  document.body.appendChild(element);  element.click();  document.body.removeChild(element);}function toHump(name) {name = name.replace(/\s+/g,"-");    return name.replace(/\-(\w)/g, function(all, letter){        return letter.toUpperCase();    });}function getFlutterClass(){var str = "import 'package:flutter/widgets.dart';\r\n\r\n";str += "class IconfontIcons {\r\n";var arr = document.querySelectorAll(".icon-item");for (var i = arr.length - 1; i >= 0; i--) {var item = arr[i];var item_name = toHump(item.querySelectorAll(".icon-code")[1].textContent);var item_code = item.querySelectorAll(".icon-code")[0].textContent.replace(/\&\#/g,%220%22);item_code%20=%20item_code.replace(/\;/g,%22%22);str%20+=%20%22%20%20%20%20static%20const%20IconData%20%22+item_name+%22%20=%20IconData(%22+item_code+%22,fontFamily:'Iconfont');%22;str%20+=%20%22\r\n%22;}str%20+=%20%22}%22;return%20str;}%20%20download(%22icon_font_icons.dart%22,getFlutterClass());
```

## 常用依赖

### 国际化

采用 flutter 官方推荐的 `flutter_localizations`

[参考文章](https://docs.flutter.cn/ui/accessibility-and-internationalization/internationalization)

运行 `flutter run` 命令，您将在 `${FLUTTER_PROJECT}/.dart_tool/flutter_gen/gen_l10n` 中看到生成的文件。同样的，你可以在应用没有运行的时候运行 `flutter gen-l10n` 来生成本地化文件。

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

### 跳转到手机浏览器

url_launcher

[官方文档](https://pub.dev/packages/url_launcher)

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
