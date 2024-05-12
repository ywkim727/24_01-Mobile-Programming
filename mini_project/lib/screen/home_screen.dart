import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Column(
        children: [
          //로고
          Expanded(
            child: logo(),
          ),
          //설명
          Expanded(
            child: guide(),
          ),
          //이미지
          Expanded(
            child: image(),
          ),
          SizedBox(height: 20),
          //입력칸
          Expanded(
            child: input(),
          ),
          //버튼
          Expanded(
            child: button(),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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

class guide extends StatelessWidget {
  const guide({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
              child: Text(
                '목표가 있는데 뭘 해야하는지 모른다구요?\n OOO 되는 법/하는 법 으로 입력하면\n 3가지 단계로 알려드릴께요!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green[900],
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

class input extends StatelessWidget {
  const input({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),  // 내부 패딩 추가
                child: Container(
                  width: 250,  // TextField의 최대 너비 설정
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'OOO 되는 법/하는 법 입력!',
                    ),
                  ),
                ),
              ),
            );
  }
}

class button extends StatelessWidget {
  const button({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: Text('물어보기!'),
              ),
            );
  }
}