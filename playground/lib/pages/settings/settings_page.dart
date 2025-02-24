import 'package:flutter/material.dart';
import 'package:playground/config/index.dart';
import 'package:playground/utils/extensions/l10n_extension.dart';
import 'package:playground/widgets/stx_cell.dart';
import 'package:playground/widgets/stx_cell_group.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.settingsTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StxCellGroup(
              title: context.l10n.settingsDisplay,
              children: [
                StxCell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(RouteNames.settingsLanguage);
                  },
                  label: context.l10n.settingsLanguage,
                  value: '跟随系统',
                  showArrow: true,
                ),
                StxCell(
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteNames.settingsTheme);
                  },
                  label: context.l10n.settingsTheme,
                  value: '跟随系统',
                  showArrow: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
