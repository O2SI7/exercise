import 'dart:io';
import 'dart:math';

import '05.5_num_guess.dart';
import '08_maple_story.dart';

class Info {
  int hp;
  int attack;

  Info(this.hp, this.attack);
}

Info user = Info(100, 20);
Info monster = Info(0, 0);
int victory = 0;

void main(List<String> arguments) {
  bool stay = true;
  print('[✨  가위 바위 보의 제왕 게임 ✨]');
  print('[안녕하세요!  가위 바위 보의 제왕 게임에 오신 것을 환영합니다. ]');
  print('[당신은 이 마을의 마지막 희망, 위대한 용사입니다. ⚔️ ]');
  print('[마을을 위협하는 몬스터를 물리치고 평화를 되찾아 주세요! ]');
  showMenu();

  while (stay) {
    final command = getUserInput(['1', '2', '3']);

    switch (command) {
      case '1':
        startGame();
        break;
      case '2':
        showDescription();
        break;
      case '3':
        print('[🚪 프로그램 종료 🚪]\n');
        print('시간 요정 타이메리가 물러갑니다. 오늘도 시간을 잘 활용하셨나요? 🕒');
        print('다음에 또 만나요. 👋');
        stay = false;
        break;
      default:
    }
  }

  return;
}

void showDescription() {
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

startGame() {
  monster.hp = 50 + Random().nextInt(51);
  monster.attack = 5 + Random().nextInt(11);
  print('[⚔️ 몬스터 등장!]');

  print('- 몬스터 정보');
  print('- 체력: ${monster.hp}');
  print('- 공격: ${monster.attack}');
  print('\n[💪당신의 상태]');
  print('- 체력: ${user.hp}');
  print('- 공격: ${user.attack}');

  battle();
}

void showMenu() {
  print('\n지금 바로 모험을 시작하세요!');
  print('1. 게임 시작');
  print('2. 게임 설명');
  print('3. 종료');
  print('\n원하시는 작업 번호를 입력하세요:');
}

battle() {
  bool dkdkdk = true;
  while (dkdkdk) {
    print('\n[⚔️ 전투 시작 ⚔️]');
    print('다음 행동을 선택하세요');
    print('1. 가위\n2. 바위\n3. 보');
    String? userChoice = stdin.readLineSync(); // > 유저 가위바위보 값
    int? choice = int.tryParse(userChoice ?? '');

    if (choice == null || choice < 1 || choice > 3) {
      print('다시 입력해주세요. (1, 2, 3) ');
      continue;
    }

    final monsterChoice = Random().nextInt(3) + 1;
    print("몬스터 선택 : $monsterChoice");

    if ((choice == 1 && monsterChoice == 3) ||
        (choice == 2 && monsterChoice == 1) ||
        (choice == 3 && monsterChoice == 2)) {
      attack();
    } else if (choice == monsterChoice) {
      defend();
    } else {
      mattack();
    }
    if (monster.hp <= 0) {
      print('전투 승리');

      victory++;
      print('키햐ㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑㅑ이겼다$victory');
      if (victory >= 3) {
        print('키햐ㅑㅑㅑㅑ 잘한다잉 ㅊㅋㅊㅋ 졸업');
        gameReset();
        break;
      }
      break;
    } else if (user.hp <= 0) {
      print('너죽음 ㅅㄱ');
      gameReset();
      break;
    }
  }
  showMenu();
}

void gameReset() {
  // Ouser.hp = 100;
  user = Info(100, 20);
  monster.hp = 50 + Random().nextInt(51);
  monster.attack = 5 + Random().nextInt(11);
  victory = 0;
}

attack() {
  print('내가 가위바위보를 이겼다. ( 내가 공격한다 )');
  print('몬스터 체력 : ${monster.hp}');
  int damage = user.attack;
  monster.hp = max(monster.hp - damage, 0);
  // monster.hp -= damage;
  print('공격했습니다 몬스터에게 $damage데미지를 입혔습니다.');
  print('몬스터의 남은체력 : ${monster.hp}입니다');
}

defend() {
  print('가위바위보 비겼다');
  print('몬스터의 남은체력 : ${monster.hp}');
  print('유저의 남은체력 : ${user.hp}');
}

mattack() {
  print('내가 가위바위보를 졌다. ( 몬스터가 공격한다 )');
  print('유저 체력 : ${user.hp}');
  int damage = monster.attack;
  user.hp = max(user.hp - damage, 0);
  // user.hp -= damage;
  print('몬스터가 $damage만큼의 데미지를 가했습니다.');

  print('유저의 남은체력 : ${user.hp}');
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
