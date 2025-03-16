import 'package:flutter/material.dart';
import 'package:playground/widgets/stx_cell.dart';
import 'package:playground/widgets/stx_cell_group.dart';

class CellPage extends StatelessWidget {
  const CellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cell 单元格'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const StxCellGroup(
              title: '基础用法',
              children: [
                StxCell(
                  label: '单元格',
                  value: '内容',
                ),
                StxCell(
                  label: '单元格',
                  value: '内容',
                  description: '描述信息',
                ),
              ],
            ),
            StxCellGroup(
              title: '进阶用法',
              children: [
                StxCell(
                  label: '可点击',
                  value: '内容',
                  showArrow: true,
                  onTap: () {
                    print('点击了我');
                  },
                ),
                const StxCell(
                  icon: Icon(Icons.access_time_filled_rounded),
                  label: '单元格',
                  value: '内容',
                  showArrow: true,
                ),
                const StxCell(
                  icon: Icon(Icons.access_time_filled_rounded),
                  label: '单元格',
                  value: '内容',
                  trailing: Icon(
                    Icons.search,
                  ),
                ),
                const StxCell(
                  label: '单元格',
                  value: '内容',
                  description: '描述信息',
                  showArrow: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
