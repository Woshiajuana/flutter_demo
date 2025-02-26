import 'package:flutter/material.dart';

class StxScrollView extends StatelessWidget {
  const StxScrollView({
    super.key,
    this.children = const <Widget>[],
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: children,
        ),
      ),
    );
  }
}
