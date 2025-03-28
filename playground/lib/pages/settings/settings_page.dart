import 'package:flutter/material.dart';
import 'package:playground/config/index.dart';
import 'package:playground/state/index.dart';
import 'package:playground/utils/extensions/l10n_extension.dart';
import 'package:playground/widgets/stx_cell.dart';
import 'package:playground/widgets/stx_cell_group.dart';
import 'package:playground/widgets/stx_scroll_view.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.settingsTitle),
      ),
      body: StxScrollView(
        children: [
          StxCellGroup(
            title: context.l10n.settingsDisplay,
            children: [
              Consumer<LanguageState>(
                builder: (context, languageState, _) {
                  var languageCodeName =
                      languageState.getLanguageCodeName(context);
                  return StxCell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(RouteNames.settingsLanguage);
                    },
                    label: context.l10n.settingsLanguage,
                    value: languageCodeName,
                    showArrow: true,
                  );
                },
              ),
              Consumer<ThemeState>(
                builder: (context, themeState, _) {
                  var themeModeName = themeState.getThemeModeName(context);
                  return StxCell(
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteNames.settingsTheme);
                    },
                    label: context.l10n.settingsTheme,
                    value: themeModeName,
                    showArrow: true,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
