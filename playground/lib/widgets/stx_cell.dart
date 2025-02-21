import 'package:flutter/material.dart';

class StxCell extends StatelessWidget {
  const StxCell({
    super.key,
    this.label,
    this.value,
    this.description,
    this.icon,
    this.leading,
    this.trailing,
    this.showArrow = false,
    this.onTap,
  });

  /// 标题
  final String? label;

  /// 值
  final String? value;

  /// 描述
  final String? description;

  /// icon
  final Widget? icon;

  /// 后缀
  final Widget? leading;

  /// 前缀
  final Widget? trailing;

  /// 是否显示箭头
  final bool showArrow;

  /// 点击事件
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = <Widget>[];

    if (leading != null) {
      children.add(
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: leading!,
        ),
      );
    }

    if (icon != null) {
      children.add(
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: icon!,
        ),
      );
    }

    Widget? caption;
    if (label?.isNotEmpty ?? false) {
      caption = Text(
        label!,
        style: const TextStyle(fontSize: 17),
      );
    }
    if (description?.isNotEmpty ?? false) {
      caption = Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          caption!,
          Text(
            description!,
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
        ],
      );
    }
    if (caption != null) {
      children.add(Expanded(child: caption));
    }

    if (value?.isNotEmpty ?? false) {
      children.add(
        Text(
          value!,
          style: const TextStyle(fontSize: 17),
        ),
      );
    }

    if (trailing != null) {
      children.add(trailing!);
    }

    if (showArrow) {
      children.add(
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
        ),
      );
    }

    Widget result = Container(
      color: onTap != null ? Colors.transparent : Colors.white,
      constraints: const BoxConstraints(
        minHeight: 55,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      child: Row(
        children: children,
      ),
    );

    if (onTap != null) {
      result = Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: result,
        ),
      );
    }

    return result;
  }
}
