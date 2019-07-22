
import 'package:flutter/material.dart';
import 'package:woosai_mall/common/utils/routerUtil.dart';

class AddressItem extends StatefulWidget {

  @override
  _AddressItemState createState() => new _AddressItemState();
}

class _AddressItemState extends State<AddressItem> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: const EdgeInsets.all(16.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border(
          bottom: new BorderSide(
            color: Color(0xffdddddd),
            width: 0.5,
          ),
        ),
      ),
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Container(
                child: new Text(
                  '陈先生',
                  style: new TextStyle(
                    color: Color(0xff333333),
                    fontSize: 16.0,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              new Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: new Text(
                  '13127590698',
                  style: new TextStyle(
                    color: Color(0xff333333),
                    fontSize: 16.0,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          new Text(
            '欧佩克都撒扩大撒泼的拍摄看到是扩大到怕点卡商品的卡点卡商品的卡上的盘口打破时空的阿瑟东上的盘口打破时空的阿瑟东',
            style: new TextStyle(
              color: Color(0xff999999),
              fontSize: 13.0,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          new Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  flex: 1,
                  child: new Container(
                    decoration: new BoxDecoration(
                      border: new Border(
                        right: new BorderSide(
                          color: Color(0xffdddddd),
                          width: 0.5,
                        )
                      )
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          '设为默认',
                          style: new TextStyle(
                            color: Color(0xff333333),
                            fontSize: 14.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                new Expanded(
                  flex: 1,
                  child: new InkWell(
                    onTap: () => RouterUtil.pushAddressInfo(context),
                    child: new Container(
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                color: Color(0xffdddddd),
                                width: 0.5,
                              )
                          )
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            '编辑地址',
                            style: new TextStyle(
                              color: Color(0xff333333),
                              fontSize: 14.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                new Expanded(
                  flex: 1,
                  child: new Container(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          '删除地址',
                          style: new TextStyle(
                            color: Color(0xffef2c2c),
                            fontSize: 14.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
