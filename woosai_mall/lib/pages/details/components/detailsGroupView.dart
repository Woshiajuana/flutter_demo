
import 'package:flutter/material.dart';

class DetailsGroupView extends StatefulWidget {

  const DetailsGroupView({
    Key key,
    this.data,
  }) : super(key: key);

  final List data;

  @override
  _DetailsGroupViewState createState() => new _DetailsGroupViewState();
}

class _DetailsGroupViewState extends State<DetailsGroupView> {

  // 声明一个list 存放image
  List<String> imageList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formatData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: new Column(
        children: _imageGroupSection(),
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

  void _formatData () {
    if (!mounted) return;
    widget.data?.forEach((item) {
      if (item['type'] == 'details') {
        imageList = item['filePath'].split(',');
      }
    });
    this.setState((){});
  }

  List<Widget> _imageGroupSection () {
    List<Widget> list = [
      _titleSection(),
    ];
    imageList.forEach((item) {
      list.add(new Container(
        child: Image.network(
          item,
          fit: BoxFit.fill,
        ),
      ));
    });
    return list;
  }
}