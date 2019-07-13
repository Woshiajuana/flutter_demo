
import 'package:flutter/material.dart';

class PreviewGroupView extends StatefulWidget {

  @override
  _PreviewGroupViewState createState() => new _PreviewGroupViewState();
}

class _PreviewGroupViewState extends State<PreviewGroupView> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Column(
        children: <Widget>[
          _numberSection(),
        ],
      ),
    );
  }

  Widget _numberSection () {
    return new Container(
      height: 44.0,
      child: new Row(
        children: <Widget>[
          new Text(
            '数量',
            style: new TextStyle(
              color: Color(0xff333333),
              fontSize: 12.0,
            ),
          ),
          new Expanded(
            flex: 1,
            child: new Row(
              children: <Widget>[
                new Container(
                  child: new Text(
                    '-',
                    style: new TextStyle(
                      color: Color(0xff333333),
                      fontSize: 12.0,
                    ),
                  ),
                ),
                new Container(
                  child: new Text(
                    '1',
                    style: new TextStyle(
                      color: Color(0xff333333),
                      fontSize: 12.0,
                    ),
                  ),
                ),
                new Container(
                  child: new Text(
                    '-',
                    style: new TextStyle(
                      color: Color(0xff333333),
                      fontSize: 12.0,
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