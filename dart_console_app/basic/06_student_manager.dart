import 'dart:io';

import '04_unit_convertor.dart';

String? name, age, color, animal;
List<Map<String, dynamic>> data = [];

Future<void> main(List<String> arguments) async {
  print('[✨ 간단한 데이터 관리 프로그램 ✨]');
  print('안녕하세요! 당신만의 데이터 관리 프로그램에 오신 것을 환영합니다. 📋');
  print('저는 데이터 요정 데이티(Daty)예요. 오늘 어떤 데이터를 관리해 드릴까요?');

  while (true) {
    print('1. 데이터 추가');
    print('2. 데이터 검색');
    print('3. 데이터 삭제');
    print('4. 전체 데이터 보기');
    print('5. 프로그램 종료');

    final command = getUserInput([
      '1',
      '2',
      '3',
      '4',
      '5',
    ]);
    switch (command) {
      case '1':
        dataAdd(data);
        break;
      case '2':
        dataSearch();
        break;
      case '3':
        datadelete();
        break;
      case '4':
        dataFullSearch();
        break;
      default:
    }
    if (command == '5') {
      print('[🚪 프로그램 종료 🚪]');
      print('프로그램을 종료합니다. 오늘도 데이터 요정 데이티와 함께해 주셔서 감사합니다! 🌟');
      print('다음에 또 뵈어요. 👋');

      break;
    }
  }
}

void dataAdd(data) {
  print('[📌 데이터 추가 📌]');
  print('추가하고 싶은 데이터를 입력하세요');
  print('| 이름 | 나이 | 좋아하는 색깔 | 좋아하는 동물 |');
  String? input = stdin.readLineSync();



  //스페이스바 입력시 나가짐 수정
  if (input == null || input.isEmpty) {
    print('다시 입력해주세요\n');
    return ;
  }
}

void dataSearch() {}

void datadelete() {}

void dataFullSearch() {}

void off() {}
