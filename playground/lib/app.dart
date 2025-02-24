import 'package:flutter/material.dart';
import 'package:playground/config/routes/index.dart';
import 'package:playground/state/index.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // 主题
        ChangeNotifierProvider(create: (_) => ThemeState()),
        // 国际化
        ChangeNotifierProvider(create: (_) => LocaleState()),
      ],
      child: Consumer2<ThemeState, LocaleState>(
        builder: (_, themeState, localeState, __) {
          return MaterialApp(
            // 关闭 debug
            debugShowCheckedModeBanner: false,

            // 标题
            onGenerateTitle: (context) {
              return AppLocalizations.of(context).appTitle;
            },

            // 主题
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),

            // 国际化
            localizationsDelegates: const [
              ...AppLocalizations.localizationsDelegates,
            ],
            supportedLocales: AppLocalizations.supportedLocales,

            // 路由
            initialRoute: RoutePath.root,
            onGenerateRoute: RouteManager.onGenerateRoute,
          );
        },
      ),
    );
  }
}
