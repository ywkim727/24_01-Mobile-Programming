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
        body: const Center(
            child: Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 20
                ),
                children: [
                  TextSpan(
                    text: 'Lorem Ipsum is ',
                  ),
                  TextSpan(
                    text: 'simply',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  TextSpan(
                    text: ' dummy text',
                  ),
                ]
              )
            )
          )
        ),
      );
  }
}
