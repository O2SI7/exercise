import 'dart:io';
import 'dart:math';

import '04_unit_convertor.dart';

int comRandom = Random().nextInt(100) + 1; //컴퓨터 랜덤숫자
int turn = 0; //게임 진행 횟수
int maxGame = 10; // 도전 기회
int inputUser = 0; // 유저입력숫자

Future<void> main(List<String> arguments) async {
  printWelcomeMessage();
  game();
}

void printWelcomeMessage() {
  print('[🎲 숫자 추측 게임 🎲]');
  print('1부터 100 사이의 무작위 숫자를 맞혀보세요!');
  print('각각의 시도 이후에 힌트를 드립니다. 😊');
  print('최대 10번의 기회가 주어집니다. 🎯\n\n');
  print('게임을 시작합니다!');
}

int getUserInput() {
  int? inputNumber = int.tryParse(stdin.readLineSync()!);

  while (inputNumber == null) {
    print('숫자만 입력 할 수 있습니다. 다시 적어주세요.');
    inputNumber = int.tryParse(stdin.readLineSync()!);
  }

  return inputNumber;
}

void game() {
  int turn = 0;
  int comRandom = Random().nextInt(100) + 1;
  while (turn < maxGame) {
    turn++;
    print('[턴: $turn]');
    if (turn == maxGame) {
      print(' [☠️ 게임 오버 ☠️]');
      print('기회를 모두 소진했습니다. 😔');
      print('정답은 $comRandom이었습니다.\n');
      reset();

      break;
    }
    print('숫자를 입력하세요:');
    final inputUser = getUserInput();

    if (comRandom == inputUser) {
      print('[🎉 정답입니다! 🎉]');
      print('축하합니다! 정답은 $comRandom입니다! 🎯');
      if (comRandom == inputUser) {
        return levelUp();
      }
      reset();
      break;
    } else if (inputUser < 0 || inputUser > 100) {
      print('[❌ 오답입니다!]');
      print('힌트 : 문제를 다시 읽으세요 ㅋㅋ');
      print('\n\n다시 시도하세요!');
    } else if (comRandom > inputUser) {
      print('[❌ 오답입니다!]');
      print('힌트 : 너무 낮습니다! 📉');
      print('\n\n다시 시도하세요!');
    } else if (comRandom < inputUser) {
      print('[❌ 오답입니다!]');
      print('힌트 : 너무 높습니다! 📈');
      print('\n\n다시 시도하세요!');
    }
  }
}

void game2() {
  int turn = 0;
  int comRandom = Random().nextInt(500) + 1;
  while (turn < maxGame) {
    turn++;
    print('[턴: $turn]');
    if (turn == maxGame) {
      print(' [☠️ 게임 오버 ☠️]');
      print('기회를 모두 소진했습니다. 😔');
      print('정답은 $comRandom이었습니다.\n');
      reset();

      break;
    }
    print('숫자를 입력하세요:');
    final inputUser = getUserInput();

    if (comRandom == inputUser) {
      print('[🎉 정답입니다! 🎉]');
      print('축하합니다! 정답은 $comRandom입니다! 🎯');
      if (comRandom == inputUser) {
        return levelUp2();
      }
      reset();
      break;
    } else if (inputUser < 0 || inputUser > 500) {
      print('[❌ 오답입니다!]');
      print('힌트 : 문제를 다시 읽으세요 ㅋㅋ');
      print('\n\n다시 시도하세요!');
    } else if (comRandom > inputUser) {
      print('[❌ 오답입니다!]');
      print('힌트 : 너무 낮습니다! 📉');
      print('\n\n다시 시도하세요!');
    } else if (comRandom < inputUser) {
      print('[❌ 오답입니다!]');
      print('힌트 : 너무 높습니다! 📈');
      print('\n\n다시 시도하세요!');
    }
  }
}

void game3() {
  int turn = 0;
  int comRandom = Random().nextInt(1000) + 1;
  while (turn < maxGame) {
    turn++;
    print('[턴: $turn]');
    if (turn == maxGame) {
      print(' [☠️ 게임 오버 ☠️]');
      print('기회를 모두 소진했습니다. 😔');
      print('정답은 $comRandom이었습니다.\n');
      reset();

      break;
    }
    print('숫자를 입력하세요:');
    final inputUser = getUserInput();

    if (comRandom == inputUser) {
      print('[🎉 정답입니다! 🎉]');
      print('축하합니다! 정답은 $comRandom입니다! 🎯');
      print('ㅇㅈ고수');
      print('ㅅㄱ리셋');
      break;
    } else if (inputUser < 0 || inputUser > 1000) {
      print('[❌ 오답입니다!]');
      print('힌트 : 문제를 다시 읽으세요 ㅋㅋ');
      print('\n\n다시 시도하세요!');
    } else if (comRandom > inputUser) {
      print('[❌ 오답입니다!]');
      print('힌트 : 너무 낮습니다! 📉');
      print('\n\n다시 시도하세요!');
    } else if (comRandom < inputUser) {
      print('[❌ 오답입니다!]');
      print('힌트 : 너무 높습니다! 📈');
      print('\n\n다시 시도하세요!');
    }
  }
}

void reset() {
  while (true) {
    print('게임을 다시 시작하려면 Y를 입력하세요.');
    print('게임을 종료하려면 N을 입력하세요.');
    final inputchoice = stdin.readLineSync();
    if (inputchoice == 'Y') {
      print('[🔄 게임 초기화 🔄]');
      print('새로운 숫자를 생성합니다. 다시 시작합니다! 🎲\n');
      print('1부터 100 사이의 무작위 숫자를 맞혀보세요! 😊');
      return game();
    } else if (inputchoice == 'N') {
      break;
    }
  }
}

void levelUp() {
  while (true) {
    print('게임을 다시 시작하려면 Y를 입력하세요.');
    print('게임을 종료하려면 N을 입력하세요.');
    final inputchoice = stdin.readLineSync();
    if (inputchoice == 'Y') {
      print('[🔄 게임 초기화 🔄]');
      print('[🎲 난이도 中 🎲]');
      print('[게임을 시작하지');
      print('1부터 500 사이의 무작위 숫자를 맞혀보세요!');
      print('새로운 숫자를 생성합니다. 다시 시작합니다! 🎲\n');
      return game2();
    } else if (inputchoice == 'N') {
      break;
    }
  }
}

void levelUp2() {
  while (true) {
    print('게임을 다시 시작하려면 Y를 입력하세요.');
    print('게임을 종료하려면 N을 입력하세요.');
    final inputchoice = stdin.readLineSync();
    if (inputchoice == 'Y') {
      print('[🔄 게임 초기화 🔄]');
      print('[🎲 난이도 上 🎲]');
      print('[게임을 시작하지');
      print('1부터 1000 사이의 무작위 숫자를 맞혀보세요!');
      print('새로운 숫자를 생성합니다. 다시 시작합니다! 🎲\n');
      return game3();
    } else if (inputchoice == 'N') {
      break;
    }
  }
}
