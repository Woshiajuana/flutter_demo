
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
    return new Container(
      child: new Center(
        child: this.isLoading == false ? this.child : new CircularProgressIndicator(),
      ),
    );
  }
}