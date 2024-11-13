import 'package:flutter/material.dart';
import 'package:rolldiceapp/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer.purple(
          //Color.fromARGB(255, 241, 52, 52),
          //Color.fromARGB(66, 52, 157, 255)
            ),
      ),
    ),
  );
} 
//괄호 닫은다음 쉼표찍어주기 = 포맷으로 자동으로 나눠준다.

// runApp() 최상위 위젯을 화면에 표시하고 앱을 실행하는 함수 
// const MaterialApp은 플루터에서 앱의 최상위 위젯을 설정해주는 객체라고 생각
// Scaffold = 표훈화된 기본구조( 가장 큰 컨테이너 생각)
// home: Scaffold , body: Center , child: Text('Hello World')
// 홈화면의 기본구조를 잡아주고, 바디에 들어가는 내용을 센터로 속성을 주고,
// 그속성에 속한 텍스트를 뿌려준다 

