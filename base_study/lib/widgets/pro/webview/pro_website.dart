final class ProWebsite {
  /// 网站标题
  String? title;

  /// 网站地址对应的主机地址（通常是域名，也可能是 IP 地址）
  String? host;

  /// 网站源地址
  String? url;

  /// 通过构造解析传入的 URL 地址
  ProWebsite({this.title, this.url}) {
    if (url != null && url!.isNotEmpty) {
      host = url!.contains("://") ? Uri.parse(url!).host : host;
    }
  }

  /// 快速拷贝函数（传入参数无变更则沿用之前的变量值）
  ProWebsite copyWith({String? title, String? url}) {
    return ProWebsite(title: title ?? this.title, url: url ?? this.url);
  }

  /// 内容是否为空的辅助判断函数
  bool isEmpty() {
    return (title?.isEmpty ?? true) && (url?.isEmpty ?? true);
  }
}
