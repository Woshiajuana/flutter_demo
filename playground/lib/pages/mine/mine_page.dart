import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Text('我的'),
      ),
    );
  }
}
