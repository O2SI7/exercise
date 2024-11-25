import 'dart:io';

//TODO: 이전에 만들었던 퀴즈앱을 CLI 버전으로 만들기

// Ver 2에서는 다음 기능이 추가 되었으면 좋겠다.
// 1. 1,2,3,4의 입력이 아닌 경우 다시 물어보기
//  1-1 입력을 받는다.
//  1-2 입력이 유효한지(1,2,3,4 중에 하나인지) 검사한다.
//  1-3 유효하다면, 해당값을 저장한다.
//  1-4 유효하지 않다면, 다시 1-1로 간다
// 2. 문제를 다 풀고나서 몇점인지, 어느 문제를 틀렸는지 알려주기.

List<String> userAnswers = [];

Future<void> main(List<String> arguments) async {
  print('안녕하세요. Flutter에 관한 퀴즈 앱 입니다. ');
  print('문제를 보고 알맞은 답을 적어주세요.');

  for (final question in questions) {
    question.playQuiz();
  }

  for (final question in questions) {
    if (userAnswers[questions.indexOf(question)] == question.answers[0]) {
      print('${questions.indexOf(question) + 1}번 문제: 정답입니다.');
    } else {
      print('${questions.indexOf(question) + 1}번 문제: 오답입니다.');
      print('제출된 답: ${userAnswers[questions.indexOf(question)]}');
      print('실제 정답: ${question.answers[0]}');
    }
  }
}

class QuizQusetions {
  QuizQusetions(this.text, this.answers) {
    shuffledAnswers = List.of(answers);
    shuffledAnswers.shuffle();
  }

  final String text;
  final List<String> answers;
  late List<String> shuffledAnswers;

  void playQuiz() {
    _printQuiz();
    userAnswers.add(_getUserAnswer());
  }

  void _printQuiz() {
    print(text);
    for (var answer in shuffledAnswers) {
      print('${shuffledAnswers.indexOf(answer) + 1}. $answer');
    }
  }

  String _getUserAnswer() {
    while (true) {
      String? answer = stdin.readLineSync();
      //  1-2 입력이 유효한지(1,2,3,4 중에 하나인지) 검사한다.
      if (answer == '1' || answer == '2' || answer == '3' || answer == '4') {
        //  1-3 유효하다면, 해당값을 저장한다.
        return shuffledAnswers[int.parse(answer!) - 1];
      }
      //  1-4 유효하지 않다면, 다시 1-1로 간다
      print('유효하지 않은 답입니다. 정답을 다시 입력해주세요.');
    }
  }
}

final questions = [
  QuizQusetions(
    'What are the main building blocks of Flutter UIs?',
    [
      'Widgets',
      'Components',
      'Blocks',
      'Functions',
    ],
  ),
  QuizQusetions('How are Flutter UIs built?', [
    'By combining widgets in code',
    'By combining widgets in a visual editor',
    'By defining widgets in config files',
    'By using XCode for iOS and Android Studio for Android',
  ]),
  QuizQusetions(
    'What\'s the purpose of a StatefulWidget?',
    [
      'Update UI as data changes',
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that does not depend on data',
    ],
  ),
  QuizQusetions(
    'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    [
      'StatelessWidget',
      'StatefulWidget',
      'Both are equally good',
      'None of the above',
    ],
  ),
  QuizQusetions(
    'What happens if you change data in a StatelessWidget?',
    [
      'The UI is not updated',
      'The UI is updated',
      'The closest StatefulWidget is updated',
      'Any nested StatefulWidgets are updated',
    ],
  ),
  QuizQusetions(
    'How should you update data inside of StatefulWidgets?',
    [
      'By calling setState()',
      'By calling updateData()',
      'By calling updateUI()',
      'By calling updateState()',
    ],
  ),
];
