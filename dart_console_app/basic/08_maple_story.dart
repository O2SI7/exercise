import 'dart:io';
import 'dart:math';

class Info {
  int? hp;
  int? attack;

  String? name;

  Info(this.hp, this.attack, this.name);
}

void main() {
  print('[✨  가위 바위 보의 제왕 게임 ✨]');
  print('[안녕하세요!  가위 바위 보의 제왕 게임에 오신 것을 환영합니다. ]');
  print('[당신은 이 마을의 마지막 희망, 위대한 용사입니다. ⚔️ ]');
  print('[마을을 위협하는 몬스터를 물리치고 평화를 되찾아 주세요! ]');

  showMenu();

  bool keepUsingIt = true;
  while (keepUsingIt) {
    final command = getUserInput(['1', '2', '3']);

    switch (command) {
      case '1':
        gameStart();
        break;
      case '2':
        gameRule();
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
  print('\n지금 바로 모험을 시작하세요!');
  print('1. 게임 시작');
  print('2. 게임 설명');
  print('3. 종료');
  print('\n원하시는 작업 번호를 입력하세요:');
}

gameStart() {
  print('[⚔️ 몬스터 등장!]');
  int monsterHp = 50 + Random().nextInt(51);
  int monsterAk = 5 + Random().nextInt(11);
  Info user = Info(100, 20, 'hero');

  print('- 몬스터 정보');
  print('- 체력: $monsterHp');
  print('- 공격: $monsterAk');
  print('\n[💪당신의 상태]');
  print('- 체력: ${user.hp}');
  print('- 공격: ${user.attack}');

  print('\n[⚔️ 전투 시작 ⚔️]');
}

gameRule() {
  print('[📜 게임 설명 📜]');
  print('- 당신은 체력 100, 공격력 20을 가진 용사입니다. 💪');
  print('- 몬스터는 체력 50~100, 공격력 5~15를 가지고 있습니다. 🐉');
  print('- 한 번씩 서로 공격하며 싸웁니다. 🔄');
  print('- 공격 후, 체력 회복 아이템이나 도망칠 기회가 주어질 수 있습니다.');
  print('\n최종 목표');
  print('- 몬스터를 모두 물리치고 마을의 평화를 되찾으세요! 🌟');
  print('\n행운을 빕니다! 🍀');
  print('\n메인 메뉴로 돌아갑니다...');
  showMenu();
}

String getUserInput(List<String> allowCommandList) {
  String? command;

  command = stdin.readLineSync();
  while (!allowCommandList.contains(command)) {
    print('유효하지 않은 명령입니다. 다시 입력해주세요');
    command = stdin.readLineSync();
  }

  return command!;
}
