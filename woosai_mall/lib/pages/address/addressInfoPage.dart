
import 'package:flutter/material.dart';
import 'package:woosai_mall/application.dart';
import 'package:city_pickers/city_pickers.dart';


class AddressInfoPage extends StatefulWidget {

  @override
  _AddressInfoPageState createState() => new _AddressInfoPageState();
}

class _AddressInfoPageState extends State<AddressInfoPage> {

  TextEditingController _contactNameContainer;
  TextEditingController _contactPhoneContainer;
  TextEditingController _contactAddressContainer;

  String _contactName;
  String _contactPhone;
  String _contactAddress;
  String _area = '请选择收货地址';
  String _province;
  String _city;
  String _county;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _contactNameContainer = new TextEditingController();
    _contactPhoneContainer = new TextEditingController();
    _contactAddressContainer = new TextEditingController();
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
    print(result);

  }

  void _handleSubmit () async {
    print('_contactName => $_contactName');
    print('_contactPhone => $_contactPhone');
    print('_contactAddress => $_contactAddress');
  }
}
