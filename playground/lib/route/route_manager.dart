import 'package:flutter/cupertino.dart';
import 'package:playground/pages/404/not_found_page.dart';
import 'package:playground/pages/demos/cell_page.dart';
import 'package:playground/pages/demos/cross_flow_page.dart';
import 'package:playground/pages/demos/signature_page.dart';
import 'package:playground/pages/home/home_page.dart';
import 'package:playground/pages/main_page.dart';
import 'package:playground/pages/mine/mine_page.dart';
import 'package:playground/route/route_path.dart';

class RouteManager {
  static var routes = {
    RoutePath.main: (BuildContext context, {arguments}) => const MainPage(),
    RoutePath.home: (BuildContext context, {arguments}) => const HomePage(),
    RoutePath.mine: (BuildContext context, {arguments}) => const MinePage(),
    RoutePath.notFound: (BuildContext context, {arguments}) =>
        const NotFoundPage(),
    RoutePath.cell: (BuildContext context, {arguments}) => const CellPage(),
    RoutePath.signature: (BuildContext context, {arguments}) =>
        const SignaturePage(),
    RoutePath.crossFlow: (BuildContext context, {arguments}) =>
        const CrossFlowPage(),
  };

  /// 路由生成器
  static RouteFactory onGenerateRoute = (settings) {
    var name = settings.name;
    var arguments = settings.arguments ?? {};
    var builder = routes[name] ?? routes[RoutePath.notFound];

    return CupertinoPageRoute(
      settings: RouteSettings(name: name),
      builder: (context) {
        return builder!(context, arguments: arguments);
      },
    );
  };
}
