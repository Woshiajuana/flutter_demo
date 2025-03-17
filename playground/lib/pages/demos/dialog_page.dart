import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              EasyLoading.showToast('选中了：选项$value');
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: 'A',
                  child: Text('选项A'),
                ),
                const PopupMenuItem(
                  value: 'B',
                  child: Text('选项B'),
                ),
                const PopupMenuItem(
                  value: 'C',
                  child: Text('选项C'),
                ),
              ];
            },
          ),
        ],
      ),
      body: StxScrollView(
        placeholder: true,
        children: [
          StxCellGroup(
            children: [
              StxCell(
                onTap: () => _handleShowDialog(context),
                label: 'showDialog',
                description: '弹出一个对话框，一般搭配 AlertDialog (包含标题、内容和按钮) 使用',
                showArrow: true,
              ),
              StxCell(
                onTap: () => _handleShowGeneralDialog(context),
                label: 'showGeneralDialog',
                description: '弹出自定义弹窗，可以完全控制对话框的外观和动画',
                showArrow: true,
              ),
              StxCell(
                onTap: () => _handleShowCupertinoDialog(context),
                label: 'showCupertinoDialog',
                description: 'iOS风格的对话框',
                showArrow: true,
              ),
              StxCell(
                onTap: () => _handleShowAboutDialog(context),
                label: 'showAboutDialog',
                description: '显示应用的关于弹窗',
                showArrow: true,
              ),
              StxCell(
                onTap: () => _handleShowTimePicker(context),
                label: 'showTimePicker',
                description: '弹出时间选择器',
                showArrow: true,
              ),
              StxCell(
                onTap: () => _handleShowDatePicker(context),
                label: 'showDatePicker',
                description: '弹出日期选择器',
                showArrow: true,
              ),
              StxCell(
                onTap: () => _handleShowSearch(context),
                label: 'showSearch',
                description: '弹出搜索框',
                showArrow: true,
              ),
              StxCell(
                onTap: () => _handleShowModalBottomSheet(context),
                label: 'showModalBottomSheet',
                description: '底部弹窗',
                showArrow: true,
              ),
              StxCell(
                onTap: () => _handleShowSnackBar(context),
                label: 'showSnackBar',
                description: '从屏幕底部显示一个短暂的消息提示',
                showArrow: true,
              ),
              StxCell(
                onTap: () => _handleShowLicensePage(context),
                label: 'showLicensePage',
                description: '显示应用的许可证页面',
                showArrow: true,
              ),
              StxCell(
                onTap: () => _handleShowMenu(context),
                label: 'showMenu',
                description: '在指定位置显示一个菜单',
                showArrow: true,
              ),
              const StxCell(
                label: 'Tooltip',
                description: '当用户长按或悬停在某个元素上，显示一个简短的提示信息',
                trailing: Tooltip(
                  message: 'xxx',
                  child: Icon(Icons.help_outline),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _handleShowDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('标题'),
          content: const Text('内容内容内容...'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('确认'),
            ),
          ],
        );
      },
    );
  }

  void _handleShowGeneralDialog(BuildContext context) {
    showGeneralDialog<int>(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation),
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("showGeneralDialog",
                      style: TextStyle(fontSize: 14)),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("确定"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _handleShowCupertinoDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('标题'),
          content: const Text('内容内容内容...'),
          actions: [
            CupertinoDialogAction(
              child: const Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            CupertinoDialogAction(
              child: const Text("确定"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void _handleShowAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: "Flutter Demo",
      applicationVersion: "1.0.0",
      applicationIcon: const FlutterLogo(),
      applicationLegalese: "© 2025 Flutter Demo",
    );
  }

  void _handleShowTimePicker(BuildContext context) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then(
      (value) => EasyLoading.showToast('选择的时间为：$value'),
    );
  }

  void _handleShowDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    ).then((value) => EasyLoading.showToast('选择的时间为：$value'));
  }

  void _handleShowSearch(BuildContext context) {
    //
  }

  void _handleShowModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('菜单1'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('菜单2'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('取消'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleShowSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("showSnackBar"),
        action: SnackBarAction(
          label: "确定",
          onPressed: () {
            // do something
          },
        ),
      ),
    );
  }

  void _handleShowLicensePage(BuildContext context) {
    showLicensePage(
      context: context,
      applicationName: "Flutter Demo",
      applicationVersion: "1.0.0",
      applicationIcon: const FlutterLogo(),
    );
  }

  void _handleShowMenu(BuildContext context) {
    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(0, 405, 0, 0),
      items: [
        const PopupMenuItem(
          value: 1,
          child: Text("菜单1"),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text("菜单2"),
        ),
        const PopupMenuItem(
          value: 3,
          child: Text("菜单3"),
        ),
      ],
    ).then((value) {
      print("选择的菜单值为：$value");
    });
  }
}
