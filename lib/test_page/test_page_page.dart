import 'package:flutter/material.dart';

class TestPagePage extends StatefulWidget {
  const TestPagePage({Key? key}) : super(key: key);

  @override
  State<TestPagePage> createState() => _TestPagePageState();
}

class _TestPagePageState extends State<TestPagePage> {
  List<Widget> list = <Text>[];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestPagePage'),
        centerTitle: true,
      ),
      body: ListView(
        children: list,
      ),
    );
  }
}
