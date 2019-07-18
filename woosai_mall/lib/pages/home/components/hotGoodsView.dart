
import 'package:flutter/material.dart';
import 'package:woosai_mall/common/utils/routerUtil.dart';
import 'package:woosai_mall/common/model/hotRecommendModal.dart';

class HotGoodsView extends StatefulWidget {

  const HotGoodsView({
    this.data,
    this.title,
  });

  final List<GoodsItemModal> data;
  final String title;

  @override
  _HotGoodsViewState createState() => new _HotGoodsViewState();
}

class _HotGoodsViewState extends State<HotGoodsView> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border.all(color: Color(0xffdddddd), width: 0.5)
      ),
      child: new Column(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.only(top: 16.0, bottom: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(
                  width: 5,
                  height: 20,
                  color: Color(0xff1296db),
                  margin: const EdgeInsets.only(right: 5.0),
                ),
                new Text(widget.title, style: TextStyle(fontSize: 16.0),),
              ],
            ),
          ),
          new Wrap(
            children: _goodsList(),
          )
        ],
      ),
    );
  }

  List<Widget> _goodsList () {
    List<Widget> list = [];
    if (widget.data != null) {
      widget.data.forEach((item) {
        list.add(_goodsItem(item));
      });
    }
    return list;
  }

  Widget _goodsItem (GoodsItemModal goodsItemModal) {
    return new Container(
      width: 165.0,
      child: new InkWell(
        onTap: () => RouterUtil.pushDetails(context),
        child: new Card(
          elevation: 0,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: new Container(
            height: 120.0,
            child: new ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: new Image.network(
                _goodsImage(goodsItemModal),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _goodsImage (GoodsItemModal goodsItemModal) {
    String thumbnailPath = goodsItemModal.thumbnailPath;
    return thumbnailPath.split(',')[0];
  }
}