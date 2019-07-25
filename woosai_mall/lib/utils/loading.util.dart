
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading {

  static final Loading _loading = Loading._internal();

  factory Loading () {
    return _loading;
  }

  Loading._internal();

  static BuildContext _context;

  void show (BuildContext context, { Function callback }) {
    if (_context != null) return;
    _context = context;
    showDialog(
      context: _context,
      builder: (context) {
        return SpinKitFadingCircle(color: Colors.white);
      },
    ).then((value) {
      if (callback != null) {
        callback(value);
      }
    });
  }

  void hide () {
    Navigator.pop(_context);
    _context = null;
  }


}