import 'package:flutter/material.dart';

void main() {
  runApp(
     MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                 Color.fromARGB(255, 112, 76, 212),
                 Color.fromARGB(255, 175, 58, 58),
              ],
            ),
          ),
          child: const Center(
            child: Text('Hello World!'),
          ),
        ),
      ),
    ),
  );
} //괄호 닫은다음 쉼표찍어주기 = 포맷으로 자동으로 나눠준다

// runApp() 최상위 위젯을 화면에 표시하고 앱을 실행하는 함수 
// const MaterialApp은 플루터에서 앱의 최상위 위젯을 설정해주는 객체라고 생각
// Scaffold = 표훈화된 기본구조( 가장 큰 컨테이너 생각)
// home: Scaffold , body: Center , child: Text('Hello World')
// 홈화면의 기본구조를 잡아주고, 바디에 들어가는 내용을 센터로 속성을 주고,
// 그속성에 속한 텍스트를 뿌려준다 
