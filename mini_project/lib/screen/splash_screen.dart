import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mini_project/screen/home_screen.dart'; // 메인 화면으로 사용할 HomeScreen을 import 합니다.

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {  // 3초 후에 HomeScreen으로 이동합니다.
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: const Column(
        children: [
          //로고
          Expanded(
            child: logo(),
          ),
          SizedBox(height: 20),
          //이미지
          Expanded(
            child: image(),
          ),
          SizedBox(height: 20),
          //입력칸
          Expanded(
            child: welcome(),
          )
        ],
      )
    );
  }
}

class logo extends StatelessWidget {
  const logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green[300]!,
                      blurRadius: 15,
                      spreadRadius: 4,
                    )
                  ]
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.help,
                        color: Colors.white,
                      ),
                      SizedBox(width: 12),
                      Text(
                        '마법의 소라고동 봇',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
  }
}

class image extends StatelessWidget {
  const image({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
              child: Image.asset(
                'assets/main.jpeg',
              ),
            );
  }
}

class welcome extends StatelessWidget {
  const welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
              child: Text(
                'Welcome!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.green[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
  }
}