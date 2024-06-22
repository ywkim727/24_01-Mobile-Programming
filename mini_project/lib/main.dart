import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_project/screen/home_screen.dart';
import 'package:mini_project/screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // 초기화

  // 시스템 UI 스타일 설정
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.green[100], // 네비게이션 바 색상 설정
    systemNavigationBarIconBrightness: Brightness.dark, // 아이콘 색상을 어둡게 설정
    statusBarColor: Colors.green[100], // 상태 바 색상 설정 (옵션)
  ));

  // 애플리케이션 실행
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans', 
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
