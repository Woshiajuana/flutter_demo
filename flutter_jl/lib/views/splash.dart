
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
        child: Image(image: AssetImage('assets/images/splash.png')),
      );
    });
  }
}
