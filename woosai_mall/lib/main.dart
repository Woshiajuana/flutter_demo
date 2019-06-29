import 'package:flutter/material.dart';
import 'package:woosai_mall/pages/appPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WoosaiMall',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new AppPage(),
    );
  }
}
