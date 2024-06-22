import 'package:flutter/material.dart';
import 'package:mini_project/screen/home_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SecondScreen extends StatefulWidget {
  final String query;
  const SecondScreen({
    super.key,
    required this.query,
  });

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String resultText = "Loading...";

  @override
  void initState() {
    super.initState();
    callChatGPT(widget.query);
  }

  void callChatGPT(String query) async {
    const apiKey = ''; // 실제 API 키로 대체하세요
    const url = 'https://api.openai.com/v1/chat/completions'; // 엔드포인트 업데이트

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey'
        },
        body: jsonEncode({
          'model': 'gpt-3.5-turbo', // 모델명 업데이트
          'messages': [{'role': 'user', 'content': query + '3가지를 간단하게 한 문장당 20자 이내로 요약해서 알려줘'}], // 대화형 요청 구조
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        print(utf8.decode(response.bodyBytes));
        
        setState(() {
          // 결과를 줄바꿈으로 분리하고, 각 항목의 첫 번째 줄만 추출
          var lines = data['choices'][0]['message']['content'].trim().split('\n');
          resultText = lines.map((line) => line.split(':')[0].trim()).join('\n\n');
        });
      } else {
        setState(() {
          resultText = "Error: ${response.body}";
        });
      }
    } catch (e) {
      setState(() {
        resultText = "Error: ${e.toString()}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: const Text(
          '소라고동님의 답변',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.green[100],
      ),
      body: Column(
          children: [
            //로고
            Expanded(
              child: logo(title: widget.query),
            ),
            //설명
            Expanded(
              child: guide(resultText),
            ),
            //버튼
            Expanded(
              child: button(),
            )
          ],
      ),
    );
  }
}

class logo extends StatelessWidget {
  final String title;
  const logo({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class guide extends StatelessWidget {
  final String text;
  const guide(this.text,{
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        child: Text('Home'),
      ),
    );;
  }
}