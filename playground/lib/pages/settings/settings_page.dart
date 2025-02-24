import 'package:flutter/material.dart';
import 'package:playground/config/index.dart';
import 'package:playground/widgets/stx_cell.dart';
import 'package:playground/widgets/stx_cell_group.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StxCellGroup(
              title: '界面和显示',
              children: [
                StxCell(
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteNames.settingsLanguage);
                  },
                  label: '语言设置',
                  value: '跟随系统',
                  showArrow: true,
                ),
                StxCell(
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteNames.settingsTheme);
                  },
                  label: '主题设置',
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
