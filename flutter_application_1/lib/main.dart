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
        body: Container(
          width: 100,
          height: 100,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(150),
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(
              color: Color.fromARGB(255, 0, 0, 0),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            color: Colors.green,
          ),
        )
      ),
    );
  }
}
