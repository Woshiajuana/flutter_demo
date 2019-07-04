
import 'package:flutter/material.dart';
import 'package:woosai_mall/pages/home/components/headView.dart';
import 'package:woosai_mall/pages/home/components/carouselView.dart';
import 'package:woosai_mall/pages/home/components/hotGoodsView.dart';
import 'package:woosai_mall/pages/home/components/listGoodsView.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new PreferredSize(
        child: new AppBar(
          brightness: Brightness.dark,
          elevation: 0,
        ),
        preferredSize: Size.fromHeight(0),
      ),
      body: new Container(
        color: Color(0xfff2f2f2),
        child: new Column(
          children: <Widget>[
            new HeadView(),
            new Expanded(
              child: new ListView(
                children: <Widget>[
                  new CarouselView(),
                  new HotGoodsView(),
                  new HotGoodsView(),
                  new ListGoodsView(),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}