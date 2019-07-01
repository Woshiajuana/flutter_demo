
import 'package:flutter/material.dart';

class HeadView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 0,
        right: 0,
        bottom: 0,
      ),
      child: Row(
        children: <Widget>[
          new Text('哈哈')
        ],
      ),
    );
  }
}