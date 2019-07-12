
import 'package:flutter/material.dart';
import 'package:woosai_mall/common/style/WowStyle.dart';

class AddressView extends StatefulWidget {

  @override
  _AddressViewState createState() => new _AddressViewState();
}

class _AddressViewState extends State<AddressView> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0, bottom: 12.0),
      child: new Row(
        children: <Widget>[
          new Image.asset(
            WOWIcons.address,
            width: 18.0,
            height: 22.0,
            color: Color(0xffef2c2c),
          ),
          new Expanded(
            flex: 1,
            child: new Container(
              padding: const EdgeInsets.only(left: 16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    '陈先生 13127590699',
                    style: new TextStyle(
                      color: Color(0xff333333),
                      fontSize: 16.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  new Text(
                    '上海市 上海市 浦东新区 峨峨眉路余杭路荣德大夏眉路余杭路荣德大夏',
                    style: new TextStyle(
                      color: Color(0xff999999),
                      fontSize: 14.0,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          new Container(
            child: new Icon(
              Icons.arrow_forward_ios,
              color: Color(0xff999999),
            ),
          ),
        ],
      ),
    );
  }
}