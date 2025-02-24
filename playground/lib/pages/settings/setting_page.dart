import 'package:flutter/material.dart';
import 'package:playground/widgets/stx_cell.dart';
import 'package:playground/widgets/stx_cell_group.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            StxCellGroup(
              children: [
                StxCell(
                  label: '语言设置',
                  value: '跟随系统',
                ),
                StxCell(
                  label: '主题设置',
                  value: '跟随系统',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
