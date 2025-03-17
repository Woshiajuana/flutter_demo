import 'package:flutter/material.dart';
import 'package:playground/config/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    print('Home Page initState');
  }

  @override
  Widget build(BuildContext context) {
    print('Home Page Build');

    return Scaffold(
      appBar: AppBar(
        title: const Text('演练场'),
      ),
      body: ListView.separated(
        itemCount: DemoConfig.data.length,
        separatorBuilder: (context, index) => const Divider(
          height: 0,
          thickness: 0,
        ),
        itemBuilder: _itemBuilder,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    var item = DemoConfig.data[index];
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(item.path);
      },
      title: Text(
        item.title,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: Text(item.subtitle),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16,
      ),
    );
  }
}
