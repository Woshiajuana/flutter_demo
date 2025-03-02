import 'package:flutter/material.dart';
import 'package:playground/config/index.dart';
import 'package:playground/widgets/stx_cell.dart';
import 'package:playground/widgets/stx_cell_group.dart';
import 'package:playground/widgets/stx_scroll_view.dart';

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
      body: StxScrollView(
        children: [
          StxCellGroup(
            title: '其他',
            children: [
              StxCell(
                onTap: () {
                  Navigator.of(context).pushNamed(RouteNames.settings);
                },
                icon: const Icon(Icons.settings),
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
