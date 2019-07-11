
import 'package:flutter/material.dart';
import 'package:woosai_mall/pages/details/components/carouselView.dart';
import 'package:woosai_mall/pages/details/components/operationView.dart';
import 'package:woosai_mall/pages/details/components/baseInfoView.dart';
import 'package:woosai_mall/pages/details/components/specsGroupView.dart';

class DetailsPage extends StatefulWidget {

  @override
  _DetailsPageState createState() => new _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('商品详情'),
      ),
      body: new Container(
        color: Color(0xfff2f2f2),
        child: new Column(
          children: <Widget>[
            new Expanded(
              child: new ListView(
                children: <Widget>[
                  new CarouselView(),
                  new BaseInfoView(),
                  new SpecsGroupView(),
                ],
              ),
            ),
            new OperationView(),
          ],
        ),
      ),
    );
  }
}