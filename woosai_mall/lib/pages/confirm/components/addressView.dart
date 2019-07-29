
import 'package:flutter/material.dart';
import 'package:woosai_mall/common/application.dart';
import 'package:woosai_mall/models/addressItem.model.dart';

class AddressView extends StatefulWidget {

  const AddressView({
    Key key,
    this.data,
    this.onTap,
  }) : super(key: key);


  final AddressItemModal data;
  final dynamic onTap;

  @override
  _AddressViewState createState() => new _AddressViewState();
}

class _AddressViewState extends State<AddressView> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0, bottom: 12.0),
      child: new InkWell(
        onTap: () => widget?.onTap(),
        child: new Row(
          children: <Widget>[
            new Image.asset(
              Application.config.style.srcAddress,
              width: 18.0,
              height: 22.0,
              color: Color(0xffef2c2c),
            ),
            new Expanded(
              flex: 1,
              child: widget?.data == null ? new Container(
                child: new Text(
                  '请先选择收货地址',
                  style: new TextStyle(
                    color: Color(0xff333333),
                    fontSize: 16.0,
                  ),
                ),
              ) : new Container(
                padding: const EdgeInsets.only(left: 16.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      '${widget.data.contactName} ${widget.data.contactPhone}',
                      style: new TextStyle(
                        color: Color(0xff333333),
                        fontSize: 16.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    new Text(
                      '${widget.data.province}-${widget.data.city}-${widget.data.county}-${widget.data.contactAddress}',
                      style: new TextStyle(
                        color: Color(0xff999999),
                        fontSize: 14.0,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            new Container(
              child: new Icon(
                Icons.arrow_forward_ios,
                color: Color(0xff999999),
              ),
            ),
          ],
        ),
      ),
    );
  }
}