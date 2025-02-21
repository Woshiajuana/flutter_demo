import 'package:flutter/material.dart';
import 'package:playground/widgets/stx_cell.dart';
import 'package:playground/widgets/stx_cell_group.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  void initState() {
    super.initState();
    print('Mine Page initState');
  }

  @override
  Widget build(BuildContext context) {
    print('Mine Page Build');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('我的'),
      ),
      body: Column(
        children: [
          const StxCellGroup(
            children: [
              StxCell(
                icon: Icon(Icons.settings),
                label: '账号与安全',
                showArrow: true,
              ),
            ],
          ),
          StxCellGroup(
            title: '其他',
            children: [
              StxCell(
                onTap: () {
                  print('点击了我');
                },
                icon: const Icon(Icons.settings),
                label: '账号与安全',
                value: '请设置密码',
                showArrow: true,
              ),
              const StxCell(
                icon: Icon(Icons.settings),
                label: '账号安全',
                description: '账号安全问题不可忽视',
                showArrow: true,
                value: '请设置密码',
              ),
              const StxCell(
                icon: Icon(Icons.settings),
                label: '设置',
                showArrow: true,
              ),
              const StxCell(
                icon: Icon(Icons.settings),
                label: '设置',
                showArrow: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
