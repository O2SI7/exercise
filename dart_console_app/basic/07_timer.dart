import 'dart:io' show stdin, stdout;

//async,await 한 쌍사용
//await 붙은작업은 해당작업이 끝날때까지 기다렸다가 시작

bool checkConditionA() {
  print('A called!');
  return true;
}

bool checkConditionB() {
  print('B called!');
  return false;
}

bool checkConditionC() {
  print('C called!');
  return false;
}

Future<void> main(List<String> arguments) async {
  // if (checkConditionA() || checkConditionB()) {}

  if (arguments.isNotEmpty && arguments.length == 1 && (arguments.first == '--help' || arguments.first == '-h')) {
    print('TODO: help msg 출력');
    return;
  }

  print('n안녕하세요! 저는 시간 요정 ‘타이메리(Timery)’입니다.');
  print('오늘 당신의 시간을 관리해 드릴게요! 🕒\n\n');

  bool keepUsingIt = true;

  showMenu();

  while (keepUsingIt) {
    final command = getUserInput([/*'0',*/ '1', '2', '3']);

    switch (command) {
      case '1':
        await setTimer();
        break;
      case '2':
        setAlarm();
        break;
      case '3':
        print('[🚪 프로그램 종료 🚪]\n');
        print('시간 요정 타이메리가 물러갑니다. 오늘도 시간을 잘 활용하셨나요? 🕒');
        print('다음에 또 만나요. 👋');
        keepUsingIt = false;
        break;
      default:
    }
  }
}

void showMenu() {
  print('\n1.타이머 설정');
  print('2.알람 설정');
  print('3.프로그램 종료');
  print('\n원하시는 작업 번호를 입력하세요:');
}

Future<void> askUserSetTimerAgain() async {
  while (true) {
    print("\n다음 작업을 선택해주세요!");
    print("1. 다시 타이머 설정");
    print("2. 메인 메뉴로 돌아가기");
    print("작업 번호를 입력하세요: ");
    String? input = stdin.readLineSync();

    if (input == '1') {
      await setTimer();
      break;
    } else if (input == '2') {
      showMenu();
      break;
    } else {
      print("잘못된 입력입니다. 다시 시도해주세요.");
    }
  }
}

Future<void> askUserSetAlarmAgain() async {
  while (true) {
    print("\n다음 작업을 선택해주세요!");
    print("1. 알람 다시 설정");
    print("2. 메인 메뉴로 돌아가기");
    print("작업 번호를 입력하세요: ");
    String? input = stdin.readLineSync();

    if (input == '1') {
      setAlarm();
      break;
    } else if (input == '2') {
      showMenu();
      break;
    } else if (input == '3') {
      break;
    } else {
      print("잘못된 입력입니다. 다시 시도해주세요.");
    }
  }
}

Future<void> setTimer() async {
  print('타이머 시간을 입력하세요!');
  final String? input = stdin.readLineSync();
  final int? seconds = int.tryParse(input ?? '');

  if (seconds == null || seconds < 0) {
    print('다시 입력해주세요');
    return setTimer();
  }
  print('입력한 시간 : $seconds\n');

  print('[💡 확인] $seconds초 타이머를 시작합니다. 준비되셨나요? (Y/N): \n');
  final String? userChoice = stdin.readLineSync()?.toUpperCase();

  if (userChoice == 'Y') {
    print('타이머가 시작됩니다! 🎉');

    for (var i = seconds; i > 0; i--) {
      print('$i');
      await Future.delayed(Duration(seconds: 1));
    }

    print('[딩동! $seconds초가 지났습니다. 🎉]\n');
    print('[⏰ 타이머 완료! ⏰]');

    await askUserSetTimerAgain();
  }

  // Timer? qwe = Timer.periodic(
  //   Duration(seconds: 1),
  //   (timer) {
  //     print(seconds + 1 - timer.tick);
  //   },
  // );

  // await Future.delayed(Duration(seconds: seconds), () {qwe.cancel();});
}

void setAlarm() {
//TODO:1)알려줘야됨

  print('[⏰ 알람 설정 ⏰]\n');
  print('알람을 설정할 시간을 입력하세요! (HH:mm 형식, 24시간제)');

  int? h;
  int? m;
  while (h == null || m == null) {
    final input = stdin.readLineSync()!;
    final hMin = input.split(':');

    try {
      //TODO:2)유저한테 시간 입력 받아야됨

      // 발생할 수 있는 에러  FormatError
      //                   RangeError
      h = int.parse(hMin[0]);
      m = int.parse(hMin[1]);
    } catch (e) {
      print('⛔[오류] 시간과 분을 다시 입력해주세요 ⛔\n');
    }
//TODO:3)오류처리 해야됨

    if (h != null && m != null && (h < 0 || h >= 24 || m < 0 || m >= 60)) {
      print('⛔[오류] 시간과 분을 다시 입력해주세요 ⛔\n');
    }
  }
//TODO:4)잘 받았으면 다시 알려줘야됨
  print('입력한 시간: $h시 $m분');

  print('\n[✅ 확인 완료] 알람이 설정되었습니다! 🎉');
  print('알람이 울리면 당신께 알려드릴게요. 잊지 말고 기다려 주세요! 😊\n');
  final now = DateTime.now();
//TODO:5)현재시간과 차이 구해야됨
  final inputTime = now.copyWith(hour: h, minute: m);
  final timeLeft = inputTime.difference(now);

  print('⏰ ${timeLeft.inSeconds}초 뒤 알람울림 ⏰'); //설정한 시간과 현재시간의 차이 (초)

//TODO:6)현재시간과 차이 구해야됨
  Future.delayed(timeLeft, () {}).then((_) {
    stdout.flush(); // Ensure the output is flushed to the console
    stdout.write('[🔔 알람 알림 🔔]\n');
    stdout.write('딩동! 지금은 $h시$m분 입니다. ⏰');
    stdout.write('일어나세요! 해야 할 일이 기다리고 있어요! 💪😊]');
    stdout.flush(); // Ensure the output is flushed to the console
  });

//TODO:7)현재시간과 차이 구해야됨
  askUserSetAlarmAgain(); //알람메뉴후에, -> 유저한테또묻기
}

/// 유저인풋을 받는 함수. [allowCommandList] 에서 허용할 문자열을 지정할 수 있음.

String getUserInput(List<String> allowCommandList) {
  String? command;

  command = stdin.readLineSync();
  while (!allowCommandList.contains(command)) {
    print('유효하지 않은 명령입니다. 다시 입력해주세요');
    command = stdin.readLineSync();
  }

  return command!;
}
