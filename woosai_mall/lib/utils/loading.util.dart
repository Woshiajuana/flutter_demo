
import 'package:flutter/material.dart';

class Loading {

  static final Loading _loading = Loading._internal();

  factory Loading () {
    return _loading;
  }

  Loading._internal();

  static BuildContext _context;

  void show (BuildContext context, { Function callback, bool barrierDismissible = true }) {
    if (_context != null) return;
    _context = context;
    showDialog(
      barrierDismissible: false,
      context: _context,
      builder: (context) {
        return _widgetLoading();
      },
    ).then((value) {
      print('xsaxasxasxaxaxaxaxaxaxasxx');
//      _hide();
//      if (callback != null) {
//        callback(value);
//      }
    });
  }

  void hide () {
    print('执行hide=hidehidehidehidehidehidehidehidehidehide');
    if (_context != null) {
      Navigator.pop(_context);
      _context = null;
    }
  }

  static _hide () {
    print('执行_hide=====================');
    if (_context != null) {
      Navigator.pop(_context);
      _context = null;
    }
  }

  static Widget _widgetLoading () {
    return new WillPopScope(
      onWillPop: () => _hide(),
      child: new Center(
        child: new Container(
          width: 80.0,
          height: 80.0,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: new Center(
            child: new CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

}