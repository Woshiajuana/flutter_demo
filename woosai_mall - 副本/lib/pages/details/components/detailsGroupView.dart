
import 'package:flutter/material.dart';

class DetailsGroupView extends StatefulWidget {

  @override
  _DetailsGroupViewState createState() => new _DetailsGroupViewState();
}

class _DetailsGroupViewState extends State<DetailsGroupView> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: new Column(
        children: <Widget>[
          _titleSection(),
          _imageGroupSection(),
        ],
      ),
    );
  }

  Widget _titleSection () {
    return new Container(
      height: 40.0,
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border(
          top: new BorderSide(
            color: Color(0xffdddddd),
            width: 0.5,
          ),
          bottom: new BorderSide(
            color: Color(0xffdddddd),
            width: 0.5,
          ),
        ),
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            '- 商品详情 -',
            style: new TextStyle(
              color: Color(0xff666666),
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageGroupSection () {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            height: 375.0,
            child: Image.network(
              'http://mall-h5.dev.ptjxd.com/assets/images/index-banner.jpg',
              fit: BoxFit.fill,
            ),
          ),
          new Container(
            height: 375.0,
            child: Image.network(
              'http://mall-h5.dev.ptjxd.com/assets/images/index-banner.jpg',
              fit: BoxFit.fill,
            ),
          ),
          new Container(
            height: 375.0,
            child: Image.network(
              'http://mall-h5.dev.ptjxd.com/assets/images/index-banner.jpg',
              fit: BoxFit.fill,
            ),
          ),
          new Container(
            height: 375.0,
            child: Image.network(
              'http://mall-h5.dev.ptjxd.com/assets/images/index-banner.jpg',
              fit: BoxFit.fill,
            ),
          ),
          new Container(
            height: 375.0,
            child: Image.network(
              'http://mall-h5.dev.ptjxd.com/assets/images/index-banner.jpg',
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}