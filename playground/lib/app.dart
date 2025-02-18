import 'package:flutter/material.dart';
import 'package:playground/route/index.dart';

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
      initialRoute: RoutePath.root,
      onGenerateRoute: RouteManager.onGenerateRoute,
    );
  }
}
