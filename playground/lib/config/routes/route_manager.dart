import 'package:flutter/cupertino.dart';
import 'package:playground/pages/404/not_found_page.dart';
import 'package:playground/pages/demos/cell_page.dart';
import 'package:playground/pages/demos/cross_flow_page.dart';
import 'package:playground/pages/demos/dialog_page.dart';
import 'package:playground/pages/demos/signature_page.dart';
import 'package:playground/pages/home/home_page.dart';
import 'package:playground/pages/main_page.dart';
import 'package:playground/pages/mine/mine_page.dart';
import 'package:playground/config/routes/route_names.dart';
import 'package:playground/pages/settings/language_settings_page.dart';
import 'package:playground/pages/settings/settings_page.dart';
import 'package:playground/pages/settings/theme_settings_page.dart';

class RouteManager {
  static var routes = {
    RouteNames.main: (BuildContext context, {arguments}) => const MainPage(),
    RouteNames.home: (BuildContext context, {arguments}) => const HomePage(),
    RouteNames.mine: (BuildContext context, {arguments}) => const MinePage(),
    RouteNames.settings: (BuildContext context, {arguments}) =>
        const SettingsPage(),
    RouteNames.settingsLanguage: (BuildContext context, {arguments}) =>
        const LanguageSettingsPage(),
    RouteNames.settingsTheme: (BuildContext context, {arguments}) =>
        const ThemeSettingsPage(),
    RouteNames.notFound: (BuildContext context, {arguments}) =>
        const NotFoundPage(),
    RouteNames.cell: (BuildContext context, {arguments}) => const CellPage(),
    RouteNames.signature: (BuildContext context, {arguments}) =>
        const SignaturePage(),
    RouteNames.crossFlow: (BuildContext context, {arguments}) =>
        const CrossFlowPage(),
    RouteNames.dialog: (BuildContext context, {arguments}) =>
        const DialogPage(),
  };

  /// 路由生成器
  static RouteFactory onGenerateRoute = (settings) {
    var name = settings.name;
    var arguments = settings.arguments ?? {};
    var builder = routes[name] ?? routes[RouteNames.notFound];

    return CupertinoPageRoute(
      settings: RouteSettings(name: name),
      builder: (context) {
        return builder!(context, arguments: arguments);
      },
    );
  };
}
