
import 'package:flutter/material.dart';
import 'package:woosai_mall/models/addressItem.model.dart';

class AddressItem extends StatefulWidget {

  const AddressItem({
    this.data,
    this.onDefault,
    this.onSelect,
    this.onDelete,
    this.onEdit,
  });

  final AddressItemModal data;
  final dynamic onDefault;
  final dynamic onSelect;
  final dynamic onDelete;
  final dynamic onEdit;

  @override
  _AddressItemState createState() => new _AddressItemState();
}

class _AddressItemState extends State<AddressItem> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: const EdgeInsets.all(16.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border(
          bottom: new BorderSide(
            color: Color(0xffdddddd),
            width: 0.5,
          ),
        ),
      ),
      child: new Column(
        children: <Widget>[
          new FlatButton(
            onPressed: () => widget?.onSelect(),
            padding: const EdgeInsets.all(0),
            child: new Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Container(
                      child: new Text(
                        widget?.data?.contactName ?? '',
                        style: new TextStyle(
                          color: Color(0xff333333),
                          fontSize: 16.0,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      child: new Text(
                        widget?.data?.contactPhone ?? '',
                        style: new TextStyle(
                          color: Color(0xff333333),
                          fontSize: 16.0,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                new Text(
                  _formatAddress(),
                  style: new TextStyle(
                    color: Color(0xff999999),
                    fontSize: 13.0,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  flex: 1,
                  child: new Container(
                    decoration: new BoxDecoration(
                      border: new Border(
                        right: new BorderSide(
                          color: Color(0xffdddddd),
                          width: 0.5,
                        )
                      )
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new InkWell(
                          onTap: () => widget?.onDefault(),
                          child: new Text(
                            (widget?.data?.isDefault ?? '') == 'normal' ? '已是默认' : '设为默认',
                            style: new TextStyle(
                              color: (widget?.data?.isDefault ?? '') == 'normal' ? Color(0xff999999) : Color(0xff333333),
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                new Expanded(
                  flex: 1,
                  child: new InkWell(
                    onTap: () => widget?.onEdit(),
                    child: new Container(
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                color: Color(0xffdddddd),
                                width: 0.5,
                              )
                          )
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            '编辑地址',
                            style: new TextStyle(
                              color: Color(0xff333333),
                              fontSize: 14.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                new Expanded(
                  flex: 1,
                  child: new InkWell(
                    onTap: () => widget?.onDelete(),
                    child: new Container(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text(
                            '删除地址',
                            style: new TextStyle(
                              color: Color(0xffef2c2c),
                              fontSize: 14.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatAddress () {
    if (widget.data == null) return '';
    return '${widget.data.province}-${widget.data.city}-${widget.data.county}-${widget.data.contactAddress}';
  }

}
