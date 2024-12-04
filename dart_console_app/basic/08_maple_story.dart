import 'dart:io';

int main() {
  bool stay = true;

  showMenu();

  while (stay) {
    final command = getUserInput(['1', '2', '3']);

    switch (command) {
      case '1':
        bool gameResult = true;
        while (gameResult) {
          gameResult = startGame();

          if (gameResult == false) {
            //TODO: 죽었을 때 처리
            break;
          }
        }
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

  return 0;
}

bool startGame() {
  print('start');

  // while(/**죽을때까지 || 3번 이길때까지*/)
  while (isEndCondition()) {
    startRound();
  }

  return gameResult();
}

bool gameResult() {
  return true;
}

enum RoundResult {
  win,
  draw,
  lose,
}

void startRound() {
  final userChoice = getUserInput(['', '', '']);
  final monsterChoice = getMonsterChoice();

  final roundResult = battle(userChoice, monsterChoice);

  if (roundResult == RoundResult.win) {
    //TODO:처리
  } else if (roundResult == RoundResult.draw) {
    //TODO:처리
  } else /** if(roundResult == BattleResult.lose) */
  {
    //TODO:처리
  }
}

battle(String userChoice, monsterChoice) {}

getMonsterChoice() {}

bool isEndCondition() {
  return true;
}

void showDescription() {
  print('showDescription');
}

void showMenu() {}

String getUserInput(List<String> allowCommandList) {
  String? command;

  command = stdin.readLineSync();
  while (!allowCommandList.contains(command)) {
    print('유효하지 않은 명령입니다. 다시 입력해주세요');
    command = stdin.readLineSync();
  }

  return command!;
}
