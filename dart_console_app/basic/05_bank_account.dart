import 'dart:convert';
import 'dart:io';
import '04_unit_convertor.dart';

List<String> history = [];
//List<String> users = []; 추가 한것

//key: 이름, value: 잔액
final Map<String, int> accounts = {};
String? currentUser;

// 1. 사용자 없이 입금이 가능함  resolved
// 2. 음의 금액 (마이너스 금액)이 입/출금 될 수 있음 resolved
// 3. 새로 계좌를 만들면 history를 날리자. resolved
// 3-1 왜냐하면, 새로 계좌를 만든 다른 사람이 이전사람의 기록을 보면 안되니까. resolved
// 4. 새로 계좌를 만들면 이전 계좌에 checkout할 수 없을까?
// 4-1. 로그인 할때 뭘쓸까? => 이름을 쓰자

Future<void> main(List<String> arguments) async {
  while (true) {
    printWelcomeMessage();

    final command = getUserInput(['0', '1', '2', '3', '4', '5', '6']);
    switch (command) {
      case '0':
        checkoutAccount();
        break;
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

      default:
    }
    if (command == '6') {
      print('[✨ 프로그램 종료 ✨]');
      print('// ${history[0]}님, 저희 은행을 이용해주셔서 감사합니다. 💖');
      print('오늘도 행복한 하루 되세요! 다음에 또 만나요. 🙋‍♀️');

      break;
    }
  }
}

void printWelcomeMessage() {
  print(' 안녕하세요! 저희 은행에 오신 것을 환영합니다.');
  print(' 오늘도 돈으로 행복해지는 하루 되세요! 💰.');
  print(' 0. 기존 계좌 로그인 하기.');
  print(' 1. 새 계좌 만들기.');
  print(' 2. 입금하기.');
  print(' 3. 출금하기.');
  print(' 4. 잔액 조회.');
  print(' 5. 거래 내역 확인.');
  print(' 6. 프로그램 종료.');
  print(' 원하시는 작업 번호를 입력하세요.');
}

void checkoutAccount() {
  if (accounts.isEmpty) {
    print('[✨ 만들어진 계좌가 없습니다..✨]');
    print('[✨ 계좌를 만들어주세요 ✨]');
    return createAccount();
  }
  print('[✨ 기존 계좌를 적어주세요.✨]');

  final name = stdin.readLineSync(encoding: Encoding.getByName('utf-8')!)!;
  if (accounts.containsKey(name)) {
    print('로그인 성공');
    currentUser = name;
  } else {
    print('로그인 실패');
  }
}

void createAccount() {
  print('✨새 계좌 만들기✨\n축하드립니다! 당신만의 계좌를 개설합니다.🎉');
  print('당신의 이름을 입력해주세요.');
  final name = stdin.readLineSync(encoding: Encoding.getByName('utf-8')!)!;
  print('좋아요! $name님, 이제부터 부자 되는 길에 함께 하겠습니다.');
  print('초기 입금액을 입력 해주세요.\n(₩):');
  final money = int.parse(stdin.readLineSync()!);

  print('[🎊 계좌 생성 완료 🎊]:');
  print('$name님, 계좌가 개설되었습니다.');

  print('계좌 정보: .');
  print('- 예금주: $name');
  print('- 계좌번호: 1234-5678-9012'); //TODO: randomly generate
  print('- 잔액: ₩$money');

  // 3. 새로 계좌를 만들면 history를 날리자.
  history.clear();

  history.add("이름 : $name\n초기입금액 : $money");

  //만듦
  accounts[name] = money;
  //만든걸로 로그인
  currentUser = name;
}

void deposit() {
  print('[✨ 입금하기 ✨]');
  if (currentUser == null) {
    print('계좌정보가 없습니다.');
    return;
  }
  print('입금액을 입력해주세요.\n(₩):');
  final money = int.parse(stdin.readLineSync()!);
  if (money <= 0) {
    print('[❌ 입금 실패 ❌]');
    return deposit();
  }
  accounts[currentUser!] = accounts[currentUser!]! + money;

  print('잔액에 ₩$money을 추가합니다... 💵');
  print('[✅ 입금 완료 ✅]');
  print('현재 잔액은 ₩$money입니다.');
  print('고객님, 저축하는 모습이 아름다워요! 😍');

  history.add("입금액 : $money");
}

void withdraw() {
  while (true) {
    print('[✨ 출금하기 ✨]');
    if (currentUser == null) {
      print('❌ 계좌정보가 없습니다. ❌');
      return;
    }
    print('출금액을 입력해주세요.\n(₩):');
    final money = int.parse(stdin.readLineSync()!);
    if (money <= 0) {
      print('[❌ 출금 실패 ❌]');
      return withdraw();
    }

    final balance = accounts[currentUser!]!;

    if (balance < money) {
      print('[앗! 잔액이 부족합니다. 💔]');
      print('현재 잔액: ₩$balance');
      print('출금 요청 금액: ₩$money');

      print('[❌ 출금 실패 ❌]');
      print('고객님, 잔액이 부족합니다. 다시 확인해주세요!');
      print('혹시 대출이 필요하신가요? 농담입니다. 😅');
      history.add("출금 시도액 : $money");
    } else if (balance >= money) {
      accounts[currentUser!] = accounts[currentUser!]! - money;
      print('출금 금액. (₩):$money');
      print('남은 금액. (₩):$money');
      print('고객님, 큰돈 쓰셨네요! 어디에 쓰시나요? 쇼핑? 여행? 😎');
      history.add("출금액 : $money");
      break;
    }
  }
}

void checkBalance() {
  if (currentUser == null) {
    print('❌ 계좌정보가 없습니다. ❌');
    return;
  }
  print('$currentUser님의 계좌 잔액은 ₩${accounts[currentUser]}입니다');
  print('아직 돈이 넉넉하네요! 조금 더 저축하면 목표에 도달할 수 있어요! 🌟');

  history.add("현재잔액 : ${accounts[currentUser]}");
}

void transactionHistory() {
  print('[✨ 거래 내역 확인 ✨]');
  for (var his in history) {
    print(his);
  }
}
