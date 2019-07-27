
import 'package:flutter/material.dart';
import 'package:woosai_mall/pages/address/components/addressItem.dart';
import 'package:woosai_mall/application.dart';
import 'package:woosai_mall/models/addressItem.model.dart';
import 'package:woosai_mall/common/utils/routerUtil.dart';
import 'package:woosai_mall/components/confirmDialog.dart';

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
              onPressed: () => _handleJump(),
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
            children: _widgetAddressGroup(),
          ),
        ),
      ),
    );
  }

  List<Widget> _widgetAddressGroup () {
    List<Widget> data = [];
    if (_arrData != null) {
      _arrData.forEach((item) {
        data.add(new AddressItem(
          data: item,
          onSelect: () => _handleSelect(item),
          onDelete: () => _handleDelete(item),
          onDefault: () => _handleDefault(item),
          onEdit: () => _handleJump(item: item),
        ));
      });
    }
    return data;
  }

  Future _handleJump ({AddressItemModal item}) async {
    var result = await RouterUtil.pushAddressInfo(context, addressId: item?.id?.toString());
    if (result == true) {
      _handleRefresh();
    }
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

  Future _handleDelete (AddressItemModal addressItemModal) async {
    var result = await showDialog(
      context: context,
      builder: (BuildContext buildContext) {
        return new ConfirmDialog(
          content: '您确定要删除该地址吗？',
        );
      },
    );
    if (result != true) return;
    try {
      await Application.service.address.doAddressDelete(
        addressId: addressItemModal?.id?.toString(),
      );
      Application.util.modal.toast('删除成功');
    } catch (err) {
      Application.util.modal.toast(err);
    } finally {
      _handleRefresh();
    }
  }

  Future _handleSelect (AddressItemModal addressItemModal) async {
    Application.router.pop(context, params: addressItemModal);
  }

  Future _handleDefault (AddressItemModal addressItemModal) async {
    if (addressItemModal.isDefault == 'normal') {
      Application.util.modal.toast('该地址已是默认地址');
      return;
    }
    try {
      await Application.service.address.doAddressSetDefault(
        addressId: addressItemModal?.id?.toString(),
      );
      Application.util.modal.toast('设置成功');
    } catch (err) {
      Application.util.modal.toast(err);
    } finally {
      _handleRefresh();
    }
  }
}
