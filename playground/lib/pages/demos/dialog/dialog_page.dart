import 'package:flutter/material.dart';
import 'package:playground/config/index.dart';
import 'package:playground/widgets/stx_cell.dart';
import 'package:playground/widgets/stx_cell_group.dart';
import 'package:playground/widgets/stx_scroll_view.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('弹窗'),
      ),
      body: StxScrollView(
        placeholder: true,
        children: [
          StxCellGroup(
            children: [
              StxCell(
                onTap: () =>
                    Navigator.of(context).pushNamed(RouteNames.dialogBuiltIn),
                label: '内置弹窗',
                showArrow: true,
              ),
              StxCell(
                onTap: () =>
                    Navigator.of(context).pushNamed(RouteNames.dialogDropdown),
                label: '下拉菜单弹窗',
                showArrow: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
