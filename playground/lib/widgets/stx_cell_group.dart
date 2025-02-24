import 'package:flutter/material.dart';

class StxCellGroup extends StatelessWidget {
  const StxCellGroup({
    super.key,
    this.title,
    this.children = const <Widget>[],
  });

  /// 标题
  final String? title;

  /// 子widget
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    List<Widget> content = [];
    for (var i = 0; i < children.length; i++) {
      content.add(children[i]);
      if (i != children.length - 1) {
        content.add(
          const Divider(
            height: 0,
            thickness: 0.3,
            indent: 16,
            // endIndent: 16,
          ),
        );
      }
    }

    Widget result = Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.3),
          bottom: BorderSide(color: Colors.grey, width: 0.3),
        ),
      ),
      child: Column(
        children: content,
      ),
    );

    if (title?.isNotEmpty ?? false) {
      result = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 8,
            ),
            child: Text(title!),
          ),
          result,
        ],
      );
    }

    return result;
  }
}
