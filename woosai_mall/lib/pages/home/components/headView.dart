
import 'package:flutter/material.dart';
import 'package:woosai_mall/common/application.dart';


class HeadView extends StatefulWidget {

  @override
  _HeadViewState createState() => new _HeadViewState();
}

class _HeadViewState extends State<HeadView> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Theme.of(context).primaryColor,
      height: 45.0,
      padding: new EdgeInsets.only(left: 5.0, top: 0, bottom: 0,right: 5.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Image.asset(
            Application.config.style.srcLogo,
            width: 36.0,
            height: 36.0,
            fit: BoxFit.fill,
            color: Colors.white,
          ),
          new Container(
            margin: const EdgeInsets.only(left: 5.0),
            child: new Text(
              '哇噻商城',
              style: new TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          )
//          new Expanded(
//            flex: 1,
//            child: new Card(
//              elevation: 0,
//              shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
//              child: new Padding(
//                padding: new EdgeInsets.only(top: 5.0, bottom: 5.0),
//                child: new Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    new Padding(
//                      padding: new EdgeInsets.only(right: 5.0, top: 0, left: 5.0),
//                      child: new Icon(WOWIcons.search, color: Colors.grey, size: 20.0,),
//                    ),
//                    new Expanded(
//                      child: new Text(
//                        '亲~点击窝可以更快找到心仪商品哦...',
//                        style: new TextStyle(fontSize: 12.0, color: Colors.black26),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          )
        ],
      ),
    );
  }
}

