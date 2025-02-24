import 'package:flutter/material.dart';
import 'package:playground/utils/extensions/l10n_extension.dart';
import 'package:playground/widgets/stx_cell.dart';
import 'package:playground/widgets/stx_cell_group.dart';

class ThemeSettingsPage extends StatelessWidget {
  const ThemeSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    value: true,
                    onChanged: (v) {},
                  ),
                ),
              ],
            ),
            StxCellGroup(
              title: '手动选择',
              children: [
                StxCell(
                  onTap: () {
                    //
                  },
                  label: '普通模式',
                ),
                StxCell(
                  onTap: () {
                    //
                  },
                  label: '深色模式',
                  trailing: const Icon(Icons.check),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
