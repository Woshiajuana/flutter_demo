
import 'package:flutter/material.dart';
import 'package:woosai_mall/application.dart';
import 'package:city_pickers/city_pickers.dart';


class AddressInfoPage extends StatefulWidget {

  const AddressInfoPage ({Key key, this.addressId}) : super(key: key);

  final String addressId;

  @override
  _AddressInfoPageState createState() => new _AddressInfoPageState();
}

class _AddressInfoPageState extends State<AddressInfoPage> {

  TextEditingController _contactNameContainer;
  TextEditingController _contactPhoneContainer;
  TextEditingController _contactAddressContainer;

  String _contactName = '测试';
  String _contactPhone = '13127556666';
  String _contactAddress = '测测试测试测试测试测试测试测试试';
  String _area = '请选择收货地址';
  String _province = '上海市';
  String _city = '上海市';
  String _county = '浦东新区';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _contactNameContainer = new TextEditingController(text: _contactName);
    _contactPhoneContainer = new TextEditingController(text: _contactPhone);
    _contactAddressContainer = new TextEditingController(text: _contactAddress);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '收货地址详情',
        ),
      ),
      body: new Container(
        color: Color(0xfff2f2f2),
        child: new Column(
          children: <Widget>[
            _inputSection(),
            _buttonItem(),
          ],
        ),
      ),
    );
  }

  Widget _inputSection () {
    return new Expanded(
      flex: 1,
      child: new Column(
        children: <Widget>[
          _inputItem(
            labelText: '收货人姓名',
            container: _contactNameContainer,
            onChanged: (text) => _contactName = text,
          ),
          _inputItem(
            labelText: '收货人手机',
            container: _contactPhoneContainer,
            onChanged: (text) => _contactPhone = text,
          ),
          _inputItem(
            labelText: '收货地址',
            valueText: _area,
            onTap: () => _handleSelect(),
          ),
          _inputItem(
            labelText: '地址详情',
            container: _contactAddressContainer,
            onChanged: (text) => _contactAddress = text,
          ),
        ],
      ),
    );
  }

  Widget _inputItem ({
    String labelText,
    String valueText,
    TextEditingController container,
    dynamic onChanged,
    dynamic onTap,
  }) {
    return new Container(
      height: 50.0,
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border(
          bottom: new BorderSide(
            color: Color(0xfff2f2f2),
            width: 0.5,
          ),
        ),
      ),
      child: new Row(
        children: <Widget>[
          new Text(
            labelText,
            style: new TextStyle(
              color: Color(0xff333333),
              fontSize: 14.0,
            ),
          ),
          new Expanded(
            flex: 1,
            child: container == null ? new InkWell(
              onTap: onTap,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Text(
                    valueText,
                    style: new TextStyle(
                      color: Color(0xff333333),
                      fontSize: 14.0,
                    ),
                  )
                ],
              ),
            ) : new TextField(
              onChanged: onChanged,
              controller: container,
              textAlign: TextAlign.right,
              decoration: new InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonItem () {
    return new Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width,
      color: Color(0xffef2c2c),
      child: new FlatButton(
        onPressed: () => _handleSubmit(),
        child: new Text(
          '确认提交',
          style: new TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  void _handleSelect () async{
    Result result = await CityPickers.showCityPicker(
      context: context,
    );
    this.setState(() {
      _area = '${result.provinceName}-${result.cityName}-${result.areaName}';
      _province = result.provinceName;
      _city = result.cityName;
      _county = result.areaName;
    });
  }

  void _handleSubmit () async {
    print('_contactName => $_contactName');
    print('_contactPhone => $_contactPhone');
    print('_contactAddress => $_contactAddress');
    if (_contactName == '' || _contactAddress == '' || _city == ''
        || _county == '' || _province == '' || _contactPhone == '') {
      Application.util.modal.toast('请把收货地址填写完整');
      return;
    }
    try {
      if (widget.addressId == null) {
        await Application.service.address.doAddressAdd(
          contactName: _contactName,
          contactAddress: _contactAddress,
          city: _city,
          county: _county,
          province: _province,
          contactPhone: _contactPhone,
        );
      } else {
        await Application.service.address.doAddressUpdate(
          addressId: widget.addressId,
          contactName: _contactName,
          contactAddress: _contactAddress,
          city: _city,
          county: _county,
          province: _province,
          contactPhone: _contactPhone,
        );
      }
      Application.util.modal.toast('添加成功');
      Application.router.pop(context, params: true);
    } catch (err) {
      Application.util.modal.toast(err);
    }
  }
}
