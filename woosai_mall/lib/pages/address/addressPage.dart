
import 'package:flutter/material.dart';
import 'package:woosai_mall/pages/address/components/addressItem.dart';
import 'package:woosai_mall/application.dart';
import 'package:woosai_mall/models/addressItem.model.dart';
import 'package:woosai_mall/common/utils/routerUtil.dart';

class AddressPage extends StatefulWidget {

  @override
  _AddressPageState createState() => new _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {

  List<AddressItemModal> _arrData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _handleRefresh();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '收货地址',
        ),
        actions: <Widget>[
          new Container(
            width: 50.0,
            margin: const EdgeInsets.only(right: 10.0),
            child: new FlatButton(
              padding: const EdgeInsets.all(0),
              onPressed: () => RouterUtil.pushAddressInfo(context),
              child: new Icon(Icons.add, color: Colors.white,),
            ),
          ),
        ],
      ),
      body: new Container(
        color: Color(0xfff2f2f2),
        child: new RefreshIndicator(
          onRefresh: () => _handleRefresh(),
          child: new ListView(
            children: <Widget>[
              new AddressItem(),
              new AddressItem(),
              new AddressItem(),
            ],
          ),
        ),
      ),
    );
  }

  Future _handleRefresh () async {
    try {
      _arrData = await Application.service.address.reqAddressList();
    } catch (err) {
      Application.util.modal.toast(err);
    } finally {
      this.setState(() {});
    }
  }
}
