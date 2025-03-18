import 'package:flutter/material.dart';
import 'package:playground/widgets/stx_scroll_view.dart';

class DropdownDialogPage extends StatelessWidget {
  const DropdownDialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('下拉菜单弹窗'),
      ),
      body: Column(
        children: [
          Container(
            height: 44,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            child: Row(
              children: [
                _buildTabItem(text: '城市'),
                _buildVerticalDivider(),
                _buildTabItem(text: '品牌'),
                _buildVerticalDivider(),
                _buildTabItem(text: '车况'),
                _buildVerticalDivider(),
                _buildTabItem(text: '更多'),
              ],
            ),
          ),
          const Expanded(
            flex: 1,
            child: StxScrollView(
              children: [
                Text('1'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      width: 1,
      height: 16,
      color: Colors.grey,
    );
  }

  Widget _buildTabItem({
    required String text,
    Function(GlobalKey anchorKey)? onTap,
  }) {
    GlobalKey anchorKey = GlobalKey();
    return Expanded(
      key: anchorKey,
      flex: 1,
      child: GestureDetector(
        onTap: () => onTap?.call(anchorKey),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
