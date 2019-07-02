import 'dart:math';
import 'package:flutter/material.dart';
import 'package:woosai_mall/common/style/WowStyle.dart';


class HeadView extends StatefulWidget {

  @override
  _HeadViewState createState() => new _HeadViewState();
}

class _HeadViewState extends State<HeadView> {

  @override
  Widget build(BuildContext context) {
    return Container(
//      height: 50.0,
//      color: Colors.red,
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 20.0,
        right: 20.0,
//        bottom: 20.0,
      ),
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Padding(
          padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 5.0, top: 0, left: 5.0),
                child: Icon(WOWIcons.search, color: Colors.grey, size: 20.0,),
              ),
              Expanded(
                child: Text(
                  '亲~点击窝可以更快找到心仪商品哦~~~',
                  style: TextStyle(fontSize: 12.0, color: Colors.black26),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}