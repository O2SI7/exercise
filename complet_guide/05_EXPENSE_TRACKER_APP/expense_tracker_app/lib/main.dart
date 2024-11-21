import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'; < 플루터기능 추가
import 'package:expense_tracker_app/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(110, 139, 89, 255),
);
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized(); 
  // 플루터엔진과 위젯프레임워크간의 바인딩을 초기화(시스템을 연결 사용준비)
  // 비동기작업 초기화, 방향 잠금 설정

  // SystemChrome.setPreferredOrientations([
  // 앱에서 허용할 기기의 방향(세로/가로 모드) 설정

    // DeviceOrientation.portraitDown,    << 정방향 세로모드
  // ]).then((fn){
runApp(
    MaterialApp(
      themeMode: ThemeMode.system,// 시스템에 모드를 설정함
      // them: < 라이트모드로 자동설정
      // ThemeMode.dark < 항상 다크모드
      // ThemeMode.light < 항상 라이트모드
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        //ThemeData().copyWith()로 복제후에 스타일 설정할수있음
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
      ),
      // themeMode: ThemeMode.system, < 사용자설정
      home: const Expenses(),
    ),
  );
  // });
  
}
