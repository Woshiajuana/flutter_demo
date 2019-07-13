
import 'package:flutter/material.dart';

class InputGroup extends StatefulWidget {

  @override
  _InputGroupState createState() => new _InputGroupState();
}

class _InputGroupState extends State<InputGroup> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: new Column(
        children: <Widget>[
          _inputItem(),
          _inputItem(),
          _switchItem(),
        ],
      ),
    );
  }

  Widget _inputItem () {
    return new Container(
      margin: const EdgeInsets.only(top: 16.0),
      child: new TextField(),
    );
  }

  Widget _switchItem () {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Switch(
            value: false,
            onChanged: null
          ),
          new Container(
            child: new Text(
              '记住账号',
              style: new TextStyle(
                color: Color(0xff666666),
                fontSize: 14.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}