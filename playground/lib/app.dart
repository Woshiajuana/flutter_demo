import 'package:flutter/material.dart';
import 'package:playground/utils/route_util.dart';

import 'pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '演练场',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
      initialRoute: RouteUtil.initialRoute,
      onGenerateRoute: RouteUtil.onGenerateRoute,
    );
  }
}
