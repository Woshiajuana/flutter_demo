import 'package:flutter/material.dart';
import 'package:playground/widgets/stx_dropdown_dialog.dart';
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
                _buildTabItem(text: '城市', onTap: _showDialog),
                _buildVerticalDivider(),
                _buildTabItem(text: '品牌', onTap: _showDialog),
                _buildVerticalDivider(),
                _buildTabItem(text: '车况', onTap: _showDialog),
                _buildVerticalDivider(),
                _buildTabItem(text: '更多', onTap: _showDialog),
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

  void _showDialog(GlobalKey anchorKey) {
    showStxDropdownDialog(
      anchorKey: anchorKey,
      builder: (context) {
        return Container(
          width: double.infinity,
          height: 100,
          color: Colors.white,
          child: const SingleChildScrollView(
            child: Text('弹窗弹窗菜单弹窗菜单弹窗菜单菜单'),
          ),
        );
      },
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
        child: SizedBox(
          height: 44,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}
