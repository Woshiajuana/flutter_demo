import 'package:flutter/material.dart';
import 'package:playground/common/configs/case_config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('演练场'),
      ),
      body: ListView.separated(
        itemCount: CaseConfig.data.length,
        separatorBuilder: (context, index) => Divider(
          indent: 16,
          endIndent: 16,
          color: Colors.grey[200],
        ),
        itemBuilder: _itemBuilder,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    var item = CaseConfig.data[index];
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(item.path);
      },
      title: Text(
        item.title,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: item.subtitle != null ? Text(item.subtitle!) : null,
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16,
      ),
    );
  }
}
