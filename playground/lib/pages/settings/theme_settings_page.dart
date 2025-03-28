import 'package:flutter/material.dart';
import 'package:playground/state/index.dart';
import 'package:playground/utils/extensions/l10n_extension.dart';
import 'package:playground/utils/extensions/theme_extension.dart';
import 'package:playground/utils/index.dart';
import 'package:playground/widgets/stx_cell.dart';
import 'package:playground/widgets/stx_cell_group.dart';
import 'package:playground/widgets/stx_scroll_view.dart';
import 'package:provider/provider.dart';

class ThemeSettingsPage extends StatelessWidget {
  const ThemeSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var themeState = context.watch<ThemeState>();
    var themeMode = themeState.themeMode;

    List<Widget> children = [
      StxCellGroup(
        children: [
          StxCell(
            label: context.l10n.themeSettingsAutomatic,
            description: context.l10n.themeSettingsAutomaticDescription,
            trailing: Switch(
              value: themeState.isFollowSystem,
              onChanged: (v) {
                if (v) {
                  themeState.changeThemeMode(ThemeMode.system);
                } else {
                  themeState.changeThemeMode(
                    Helper.isDarkMode(context)
                        ? ThemeMode.dark
                        : ThemeMode.light,
                  );
                }
              },
            ),
          ),
        ],
      ),
    ];

    if (!themeState.isFollowSystem) {
      var checkIcon = Icon(
        Icons.check,
        color: context.theme.colorScheme.primary,
      );

      children.add(
        StxCellGroup(
          title: context.l10n.themeSettingsCustom,
          children: [
            StxCell(
              onTap: () => themeState.changeThemeMode(ThemeMode.light),
              label: context.l10n.themeSettingsLight,
              trailing: themeMode == ThemeMode.light ? checkIcon : null,
            ),
            StxCell(
              onTap: () => themeState.changeThemeMode(ThemeMode.dark),
              label: context.l10n.themeSettingsDark,
              trailing: themeMode == ThemeMode.dark ? checkIcon : null,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.themeSettingsTitle),
      ),
      body: StxScrollView(
        children: children,
      ),
    );
  }
}
