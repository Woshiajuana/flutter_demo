
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
          new Container(
            margin: const EdgeInsets.only(bottom: 12.0),
            child: new Column(
              children: <Widget>[
                _cellSection(),
                _cellSection(),
                _cellSection(),
              ],
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(bottom: 12.0),
            child: new Column(
              children: <Widget>[
                _cellSection(),
                _cellSection(),
                _switchSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _numberSection () {
    return new Container(
      height: 44.0,
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      color: Colors.white,
      child: new Row(
        children: <Widget>[
          new Text(
            '数量',
            style: new TextStyle(
              color: Color(0xff333333),
              fontSize: 13.0,
            ),
          ),
          new Expanded(
            flex: 1,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Container(
                  width: 22.0,
                  height: 22.0,
                  decoration: new BoxDecoration(
                    border: new Border.all(
                      color: Color(0xff999999),
                    ),
                    borderRadius: new BorderRadius.circular(5.0)
                  ),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '-',
                        style: new TextStyle(
                          color: Color(0xff333333),
                          fontSize: 12.0,
                        ),
                      )
                    ],
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: new Text(
                    '1',
                    style: new TextStyle(
                      color: Color(0xff333333),
                      fontSize: 12.0,
                    ),
                  ),
                ),
                new Container(
                  width: 22.0,
                  height: 22.0,
                  decoration: new BoxDecoration(
                      border: new Border.all(
                        color: Color(0xff999999),
                      ),
                      borderRadius: new BorderRadius.circular(5.0)
                  ),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '+',
                        style: new TextStyle(
                          color: Color(0xff333333),
                          fontSize: 12.0,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cellSection () {
    return new Container(
      height: 44.0,
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      color: Colors.white,
      child: new Row(
        children: <Widget>[
          new Text(
            '数量',
            style: new TextStyle(
              color: Color(0xff333333),
              fontSize: 13.0,
            ),
          ),
          new Expanded(
            flex: 1,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text(
                  '数量',
                  style: new TextStyle(
                    color: Color(0xff333333),
                    fontSize: 13.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  var check = false;

  Widget _switchSection () {
    return new Container(
      height: 44.0,
      padding: const EdgeInsets.only(left: 16.0, right: 8.0),
      color: Colors.white,
      child: new Row(
        children: <Widget>[
          new Text(
            '数量',
            style: new TextStyle(
              color: Color(0xff333333),
              fontSize: 13.0,
            ),
          ),
          new Expanded(
            flex: 1,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Container(
                  width: 60.0,
                  child: new InkWell(
                    onTap: () => check = !check,
                    child: new Switch(
                      value: check,
                      onChanged: (bool val) {
                        check = val;
                      },
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