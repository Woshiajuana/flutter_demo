
import 'package:flutter/material.dart';
import 'package:woosai_mall/common/utils/routerUtil.dart';
import 'package:woosai_mall/models/goodsItem.modal.dart';
import 'package:woosai_mall/application.dart';

class GoodsItem extends StatefulWidget {
  const GoodsItem({
    this.data,
  });

  final GoodsItemModal data;

  @override
  _GoodsItemState createState() => new _GoodsItemState();
}

class _GoodsItemState extends State<GoodsItem> {

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () => RouterUtil.pushDetails(context, goodsId: widget.data?.id),
      child: new Container(
        color: Color(0xfff7f7f7),
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.only(top: 12.5, bottom: 12.5, right: 10.0, left: 10.0),
        child: new Row(
          children: <Widget>[
            new Container(
              width: 100.0,
              height: 100.0,
              decoration: new BoxDecoration(
                border: new Border.all(
                  color: Color(0xffdddddd),
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: new ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: new FadeInImage.assetNetwork(
                  width: 100.0,
                  height: 100.0,
                  placeholder: Application.config.style.srcGoodsNull,
                  image: _goodsImage(widget.data),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            new Expanded(
              flex: 1,
              child: new Container(
                height: 100.0,
                padding: const EdgeInsets.only(left: 10.0, right: 10.0) ,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      widget.data?.goodsName ?? '',
                      style: TextStyle(color: Color(0xff4A4A4A), fontSize: 16.0),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: new Text(
                        widget.data?.goodsDetails ?? '',
                        style: TextStyle(color: Color(0xff9B9B9B), fontSize: 13.0),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    new Expanded(
                      flex: 1,
                      child: new Container(),
                    ),
                    new Container(
                      child: new Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(right: 4.0),
                            child: new Text(
                              _formatAmount(widget.data?.goodsDiscountPrice ?? 0),
                              style: TextStyle(
                                color: Color(0xffEF2C2C),
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          widget.data?.discountPoints != 0 ?
                          new Container(
                            child: new Text(
                              '积分换购 立减' + _formatAmount(widget.data?.discountPoints ?? 0) + '元',
                              style: TextStyle(
                                color: Color(0xff9B9B9B),
                                fontSize: 13.0,
                              ),
                            ),
                          ) : new Container(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _goodsImage (GoodsItemModal goodsItemModal) {
    String thumbnailPath = goodsItemModal.thumbnailPath;
    return thumbnailPath.split(',')[0];
  }

  String _formatAmount (int data) {
    double amount = data / 100;
    return '￥' + amount?.toString() ?? '--';
  }
}