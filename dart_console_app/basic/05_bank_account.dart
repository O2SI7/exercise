import 'dart:io';

import '04_unit_convertor.dart';

Future<void> main(List<String> arguments) async {
  


  while (true) {
    printWelcomeMessage();

    final command = getUserInput(['1', '2', '3', '4', '5', '6']);
    switch (command) {
      case '1':
        createAccount();
        break;
      case '2':
        deposit();
        break;
      case '3':
        withdraw();
        break;
      case '4':
        checkBalance();
        break;
      case '5':
        transactionHistory();
        break;
      case '6':
        exit();
        break;
      default:
    }
  }
}

double money = 0;
double money2 = 0;

void printWelcomeMessage() {
  print(' 안녕하세요! 저희 은행에 오신 것을 환영합니다.');
  print(' 오늘도 돈으로 행복해지는 하루 되세요! 💰.');
  print(' 1. 새 계좌 만들기.');
  print(' 2. 입금하기.');
  print(' 3. 출금하기.');
  print(' 4. 잔액 조회.');
  print(' 5. 거래 내역 확인.');
  print(' 6. 프로그램 종료.');
  print(' 원하시는 작업 번호를 입력하세요.');
}

void createAccount() {
  print('✨새 계좌 만들기✨\n축하드립니다! 당신만의 계좌를 개설합니다.🎉');
  print('당신의 이름을 입력해주세요.');
  final name = stdin.readLineSync();
  print('좋아요! $name님, 이제부터 부자 되는 길에 함께 하겠습니다.');
  print('초기 입금액을 입력 해주세요.\n(₩):');
  money = double.parse(stdin.readLineSync()!);
  
  print('[🎊 계좌 생성 완료 🎊]:');
  print('$name님, 계좌가 개설되었습니다.');
  print('계좌 정보: .');
  print('- 예금주: $name');
  print('- 계좌번호: 1234-5678-9012');
  print('- 잔액: ₩$money');
}

void deposit() {
  
  print('[✨ 입금하기 ✨]');
  print('입금액을 입력해주세요.\n(₩):');
  money2 = double.parse(stdin.readLineSync()!);
  print('잔액에 ₩$money2을 추가합니다... 💵');
  print('[✅ 입금 완료 ✅]');
  print('현재 잔액은 ₩${money+money2}입니다.');
  
}

void withdraw() {}

void checkBalance() {}

void transactionHistory() {}

void exit() {}

void plus() {
  
}