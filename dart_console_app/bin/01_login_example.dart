import 'dart:io';

final users = {
  'jose1234': '123123',
  'o2si': 'abcd1234',
};

void main(List<String> arguments) {
  while (true) {
    print('무엇을 하시겠습니까?');
    print('1.로그인');
    print('2.회원가입');

    final command = stdin.readLineSync();

    //로그인
    if (command == '1') {
      print('아이디를 입력하세요');
      final id = stdin.readLineSync();
      print('패스워드를 입력하세요');
      final pw = stdin.readLineSync();

      //users에 아이디가 존재하지 않는다면 -> 아이디가 존재하지 않습니다.
      //users에 아이디가 존재하나, 비밀번호가 일치하지 않는다면 -> 비밀번호가 틀렸어요
      //users에 아이디가 존재하고, 해당 아이디에 맞는 비밀번호라면 -> 로그인 성공

      if (users.containsKey(id)) {
        if (users[id] == pw) {
          print('로그인 성공');
        } else {
          print('비밀번호가 일치하지 않아요');
        }
      } else {
        print('아이디가 존재하지 않습니다.');
      }
    } else if (command == '2') {
      String? id, pw;

      while (id == null) {
        print('아이디를 입력하세요');
        id = stdin.readLineSync();
      }

      while (pw == null) {
        print('패스워드를 입력하세요');
        pw = stdin.readLineSync();
      }

      users[id] = pw;
      print('회원가입 완료!');
    } else {
      print('존재하지 않는 명령입니다.');
    }
  }
}
