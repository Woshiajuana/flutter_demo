
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:woosai_mall/common/config/httpConfig.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:woosai_mall/common/redux/appState.dart';

class WebViewPage extends StatefulWidget {

  @override
  _WebViewPageState createState() => new _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  FlutterWebviewPlugin _flutterWebviewPlugin;

  bool _isIndex = true;

  String _stringTitle = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _flutterWebviewPlugin = new FlutterWebviewPlugin();
    _flutterWebviewPlugin.onUrlChanged.listen((String url) {
      _isIndex = url.indexOf(HttpConfig.MALL_H5) > -1;
      _getWebTitle();
    });
  }

  @override
  void dispose() {
    _isIndex = true;
    // TODO: implement dispose
    _flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new StoreBuilder<AppState>(builder: (context, store) {
      return new WebviewScaffold(
        url: HttpConfig.MALL_H5 + store.state.userInfoModal.userToken,
        appBar: new AppBar(
          leading: _isIndex ? new Container() : new FlatButton(
            onPressed: () => _flutterWebviewPlugin.goBack(),
            child: new Icon(Icons.arrow_back, color: Colors.white),
          ),
          title: new Text(
            _stringTitle,
            style: new TextStyle(
              fontSize: 16.0,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            new GestureDetector(
              onTap: () => _flutterWebviewPlugin.reload(),
              child: new Container(
                padding: const EdgeInsets.only(right: 10.0),
                child: new Center(
                  child: new Text(
                    '刷新',
                    style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  //获取h5页面标题
  void _getWebTitle() async {
    _stringTitle = await _flutterWebviewPlugin.evalJavascript('window.document.title');
    _stringTitle = _isIndex ? HttpConfig.APP_NAME : _stringTitle.replaceAll('"', '');
    setState(() {});
  }

}