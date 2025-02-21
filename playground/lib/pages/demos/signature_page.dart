import 'package:flutter/material.dart';

class SignaturePage extends StatefulWidget {
  const SignaturePage({super.key});

  @override
  State<SignaturePage> createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  void _handleSignature() {
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('手写签名'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _handleSignature,
              child: const Text('点我签名'),
            ),
          ],
        ),
      ),
    );
  }
}
