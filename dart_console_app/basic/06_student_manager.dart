import 'dart:io';

import '04_unit_convertor.dart';

String? name, age, color, animal;
List<UserInfo> data = [];

class UserInfo {
  UserInfo({
    required this.name,
    required this.age,
    required this.color,
    required this.animal,
  });

  final String name;
  final String age;
  final String color;
  final String animal;

  bool contains(String query) =>
      name.contains(query) || age.contains(query) || color.contains(query) || animal.contains(query);
}

Future<void> main(List<String> arguments) async {
  print('[✨ 간단한 데이터 관리 프로그램 ✨]');
  print('안녕하세요! 당신만의 데이터 관리 프로그램에 오신 것을 환영합니다. 📋');
  print('저는 데이터 요정 데이티(Daty)예요. 오늘 어떤 데이터를 관리해 드릴까요?');

  bool keepUsingIt = true;
  while (keepUsingIt) {
    menu();
    final command = getUserInput(['1', '2', '3', '4', '5']);
    switch (command) {
      case '1':
        addData();
        break;
      case '2':
        searchData();
        break;
      case '3':
        deleteData();
        break;
      case '4':
        listData();
        break;
      case '5':
        print('[🚪 프로그램 종료 🚪]');
        print('프로그램을 종료합니다. 오늘도 데이터 요정 데이티와 함께해 주셔서 감사합니다! 🌟');
        print('다음에 또 뵈어요. 👋');

        keepUsingIt = false;
        break;
      default:
    }
  }
}

void menu() {
  print('1. 데이터 추가');
  print('2. 데이터 검색');
  print('3. 데이터 삭제');
  print('4. 전체 데이터 보기');
  print('5. 프로그램 종료');
}

void addData() {
  print('[📌 데이터 추가 📌]');
  print('추가하고 싶은 데이터를 입력하세요. 데이터 사이에 공백으로 구분합니다.');
  print('| 이름 | 나이 | 좋아하는 색깔 | 좋아하는 동물 |');

  String? userInput;
  List<String> inputs = [];
  do {
    userInput = stdin.readLineSync()!;
    inputs.addAll(userInput.split(' '));
  } while (4 != userInput.length);

  data.add(UserInfo(
    name: inputs[0],
    age: inputs[1],
    color: inputs[2],
    animal: inputs[3],
  ));

  print('잠시만요... 데이터를 추가 중입니다...✨\n');
  print('[✅ 데이터 추가 완료 ✅]\n');
  print('현재 데이터 목록: $data');
  askRestart();
}

void searchData() {
  print('[🔍 데이터 검색 🔍]');
  print('찾고 싶은 데이터를 입력하세요');
  String query = stdin.readLineSync()!;

  for (final userInfo in data) {
    if (userInfo.contains(query)) {
      print('[🎯 검색 결과 🎯] :\n');
      print(userInfo);
      print('\n데이터가 맞나요? 🎉\n');
      return;
    }
  }

  print('\n❌ 데이터가 없습니다 : $query❌\n');
}

void deleteData() {
  print('[🗑️ 데이터 삭제 🗑️]');
  print('삭제하고 싶은 데이터를 입력하세요 (예시: 이름): 이슬기');
  String query = stdin.readLineSync()!;
  print('데이터를 삭제 중입니다... 💥\n');

  for (final userInfo in data) {
    if (userInfo.contains(query)) {
      data.remove(userInfo);
      print('\n[✅ 데이터 삭제 완료 ✅]');
      return;
    }
  }

  print('\n❌ 데이터가 없어서 삭제할 수 없습니다 : $query❌\n');
}

void listData() {
  print('[📂 전체 데이터 보기 📂]');
  print('현재 저장된 데이터 목록입니다:');

  for (final userInfo in data) {
    print('이름 : ${userInfo.name}');
    print('나이 : ${userInfo.age}');
    print('좋아하는색 : ${userInfo.color}');
    print('좋아하는동물 : ${userInfo.animal}');
  }

  print('데이터가 정리되어 있어요! ✨');
}

void askRestart() {
  print('더 추가하시겠어요? (Y/N)');
  String? input = stdin.readLineSync();

  if (input == 'Y') {
    addData();
  } else if (input != 'Y' || input != 'N') {
    print('다시 입력해주세요\n');
    askRestart();
  }
}
