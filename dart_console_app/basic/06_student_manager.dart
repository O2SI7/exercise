import 'dart:io';

import '04_unit_convertor.dart';

String? name, age, color, animal;
List<Map<String, dynamic>> data = [];
final Map<String, dynamic> user = {};

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

    final command = getUserInput(['1', '2', '3', '4', '5']);
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
  String? name = stdin.readLineSync();
  String? age = stdin.readLineSync();
  String? color = stdin.readLineSync();
  String? animal = stdin.readLineSync();

  Map<String, String> a = {
    '이름': name!,
    '나이': age!,
    '좋아하는 색': color!,
    '좋아하는 동물': animal!,
  };

  data.add('');

  print('잠시만요... 데이터를 추가 중입니다...✨\n');
  print('[✅ 데이터 추가 완료 ✅]');
  print('현재 데이터 목록');
  print('$a');
  print('더 추가하시겠어요? (Y/N): Y');
  print('추가하고 싶은 데이터를 입력하세요.');
  //String? name = stdin.readLineSync(); 추가문
  print('잠시만요... 데이터를 추가 중입니다...✨\n');
  print('[✅ 데이터 추가 완료 ✅]');
  print('현재 데이터 목록');
  //print('현재 데이터 목록'); 현재까지 추가한 목록 나와야함.
  print('더 추가하시겠어요? (Y/N)');
  //String? name = stdin.readLineSync(); 추가문

  //스페이스바 입력시 나가짐 수정
  // if (input == null || input.isEmpty) {
  //   print('다시 입력해주세요\n');
  //   return;
  // }
}

void dataSearch() {
  print('[🔍 데이터 검색 🔍]');
  print('찾고 싶은 데이터를 입력하세요 (예시: 이름): 김똑똑');
//String? input = stdin.readLineSync();
  print('데이터를 검색 중입니다... 🧐\n');
  print('[🎯 검색 결과 🎯]');
//print('');결과값 보여줘야함
  print('데이터가 맞나요? 🎉');
}

void datadelete() {
  print('[🗑️ 데이터 삭제 🗑️]');
  print('삭제하고 싶은 데이터를 입력하세요 (예시: 이름): 이슬기');
//String? input = stdin.readLineSync();
  print('데이터를 삭제 중입니다... 💥');
  print('[✅ 데이터 삭제 완료 ✅]');
  print('현재 데이터 목록:');
//print(''); 결과값 보여줘야함
  print('삭제가 완료되었습니다! 👏');
}

void dataFullSearch() {
  print('[📂 전체 데이터 보기 📂]');
  print('현재 저장된 데이터 목록입니다:');
  //print(''); 결과값 보여줘야함
  print('데이터가 정리되어 있어요! ✨');
}
