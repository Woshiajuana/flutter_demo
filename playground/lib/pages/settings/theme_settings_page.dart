import 'package:flutter/material.dart';
import 'package:playground/state/index.dart';
import 'package:playground/utils/extensions/l10n_extension.dart';
import 'package:playground/widgets/stx_cell.dart';
import 'package:playground/widgets/stx_cell_group.dart';
import 'package:provider/provider.dart';

class ThemeSettingsPage extends StatelessWidget {
  const ThemeSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var themeState = context.watch<ThemeState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.themeSettingsTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StxCellGroup(
              children: [
                StxCell(
                  label: '跟随系统',
                  description: '开启后，将跟随系统打开或关闭深色模式',
                  trailing: Switch(
                    value: themeState.isFollowSystem,
                    onChanged: (v) {
                      //
                    },
                  ),
                ),
              ],
            ),
            Visibility(
              visible: !themeState.isFollowSystem,
              child: StxCellGroup(
                title: '手动选择',
                children: [
                  StxCell(
                    onTap: () {
                      themeState.changeThemeMode('light');
                    },
                    label: '普通模式',
                    trailing: themeState.themeModeName == 'light'
                        ? const Icon(Icons.check)
                        : null,
                  ),
                  StxCell(
                    onTap: () {
                      themeState.changeThemeMode('dart');
                    },
                    label: '深色模式',
                    trailing: themeState.themeModeName == 'dart'
                        ? const Icon(Icons.check)
                        : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
