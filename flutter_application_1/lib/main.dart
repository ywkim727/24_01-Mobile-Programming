import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello, Flutter!'),
          backgroundColor: Colors.redAccent,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 50,
              height: 50,
              color: Colors.red,
            ),
            Container(
              width: 50,
              height: 100,
              color: Colors.green,
            ),
            Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            ),
          ],
        ),
      )
    );
  }
}
