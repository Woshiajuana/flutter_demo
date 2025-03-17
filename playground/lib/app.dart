import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:playground/config/index.dart';
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
        ChangeNotifierProvider(create: (_) => LanguageState()),
      ],
      child: Consumer2<ThemeState, LanguageState>(
        builder: (_, themeState, languageState, __) {
          return MaterialApp(
            // 关闭 debug
            debugShowCheckedModeBanner: false,

            // 标题
            onGenerateTitle: (context) {
              return AppLocalizations.of(context).appTitle;
            },

            // 主题
            themeMode: themeState.themeMode,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,

            // 国际化
            locale: languageState.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            localeResolutionCallback: (locale, supportedLocales) {
              if (supportedLocales.contains(locale)) {
                return locale;
              }
              return const Locale('zh');
            },

            // 路由
            initialRoute: RouteNames.root,
            onGenerateRoute: RouteManager.onGenerateRoute,

            builder: EasyLoading.init(),
          );
        },
      ),
    );
  }
}
