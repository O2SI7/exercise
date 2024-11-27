import 'dart:io';
import 'dart:math';

import '04_unit_convertor.dart';

int comRandom = Random().nextInt(100) + 1; //컴퓨터 랜덤숫자
int turn = 0; //게임 횟수
int maxGame = 10;
int inputUser = 0; // 유저입력숫자
Future<void> main(List<String> arguments) async {
 
    
    printWelcomeMessage();
    game();

   
    // print('게임을 다시 시작하려면 Y를 입력하세요.');
    // print('게임을 종료하려면 N을 입력하세요.');
    // final inputchoice = stdin.readLineSync();
    //   if (inputchoice == 'Y') {
    //     return game();
    //   } else if (inputchoice == 'N') {
    //     print('ㅂ2ㅂ2');
    //     break;
    //   }
  
}

void printWelcomeMessage() {
  print('[🎲 숫자 추측 게임 🎲]');
  print('1부터 100 사이의 무작위 숫자를 맞혀보세요!');
  print('각각의 시도 이후에 힌트를 드립니다. 😊');
  print('최대 10번의 기회가 주어집니다. 🎯\n\n');
  print('게임을 시작합니다!');
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
      print('정답은 $comRandom이었습니다.');
      break;
    }
    print('숫자를 입력하세요:');
    final inputUser = int.parse(stdin.readLineSync()!);
    if (comRandom == inputUser) {
      print('[🎉 정답입니다! 🎉]');
      print('축하합니다! 정답은 $comRandom입니다! 🎯');

      print('게임을 다시 시작하려면 Y를 입력하세요.');
      print('게임을 종료하려면 N을 입력하세요.');
      final inputchoice = stdin.readLineSync();
      if (inputchoice == 'Y') {
        print('[🔄 게임 초기화 🔄]');
        print('1부터 100 사이의 무작위 숫자를 맞혀보세요! 😊');
        return game();
      } else if (inputchoice == 'N') {
        break;
      }

      break;
    } else if (comRandom > inputUser) {
      print('[❌ 오답입니다!]');
      print('힌트 : 너무 낮습니다! 📉');
      print('\n\n다시 시도하세요!');
    } else if (comRandom < inputUser) {
      print('[❌ 오답입니다!]');
      print('힌트 : 너무 높습니다! 📉');
      print('\n\n다시 시도하세요!');
    }
  }
}
