
import 'package:flutter/material.dart';

class WowView extends StatelessWidget{

  const WowView({
    Key key,
    this.isLoading = false,
    this.child,
  }) : super (key: key);

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stack(
      children: <Widget>[
        this.child,
        new Container(
          color: Color.fromRGBO(0, 0, 0, 0.5),
          child: new Center(
            child: new CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}