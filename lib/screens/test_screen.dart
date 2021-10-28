import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  static String id = 'Test_Screen';
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Text('Anuj Randi'),
      ),
    );
  }
}
