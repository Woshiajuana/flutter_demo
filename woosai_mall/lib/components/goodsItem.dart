
import 'package:flutter/material.dart';

class GoodsItem extends StatefulWidget {

  @override
  _GoodsItemState createState() => new _GoodsItemState();
}

class _GoodsItemState extends State<GoodsItem> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Color(0xfff7f7f7),
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.only(top: 12.5, bottom: 12.5, right: 10.0, left: 10.0),
      child: new Row(
        children: <Widget>[
          new Container(
            width: 100.0,
            height: 100.0,
            child: new ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: new Image.network(
                'http://mall-h5.dev.ptjxd.com/assets/images/index-banner.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          new Expanded(
            flex: 1,
            child: new Container(
              height: 100.0,
              padding: const EdgeInsets.only(left: 10.0, right: 10.0) ,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    '买蝉花虫草送摩登mini口红伞买蝉花虫草送摩登mini口红伞',
                    style: TextStyle(color: Color(0xff4A4A4A), fontSize: 16.0),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: new Text(
                      '摩登水晶伞Crystal umbrella经典四色摩登经典四色摩登水晶水晶伞Crystal umbrella经典四色',
                      style: TextStyle(color: Color(0xff9B9B9B), fontSize: 13.0),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  new Expanded(
                    flex: 1,
                    child: new Container(
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(right: 4.0),
                            child: new Text(
                              '￥358.00',
                              style: TextStyle(
                                color: Color(0xffEF2C2C),
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          new Container(
                            padding: const EdgeInsets.only(bottom: 2.0),
                            child: new Text(
                              '积分换购 立减179元',
                              style: TextStyle(
                                color: Color(0xff9B9B9B),
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}