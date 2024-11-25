import 'dart:io';

//TODO: 이전에 만들었던 퀴즈앱을 CLI 버전으로 만들기


Future<void> main(List<String> arguments) async {

    print('안녕하세요. Flutter에 관한 퀴즈 앱 입니다. ');
    print('문제를 보고 알맞은 답을 적어주세요.');
    
    
    print('What are the main building blocks of Flutter UIs?\n1.Widgets\n2.Components\n3.Blocks\n4.Functions');
    String? answersZ = stdin.readLineSync();
    
    print('How are Flutter UIs built?\n1.By combining widgets in code\n2.By combining widgets in a visual editor\n3.By defining widgets in config files\n4.By using XCode for iOS and Android Studio for Android');
    String? answersO = stdin.readLineSync();
    
    print('What\'s the purpose of a StatefulWidget?\n1.Update UI as data changes\n2.Update data as UI changes\n3.Ignore data changes\n4.Render UI that does not depend on data');
    String? answersT = stdin.readLineSync();
    
    print('Which widget should you try to use more often: StatelessWidget or StatefulWidget?\n1.StatelessWidget\n2.StatefulWidget\n3.Both are equally good\n4.None of the above');
    String? answersTH = stdin.readLineSync();
    
    print('What happens if you change data in a StatelessWidget?\n1.The UI is not updated\n2.The UI is updated\n3.The closest StatefulWidget is updated\n4.Any nested StatefulWidgets are updated');
    String? answersF = stdin.readLineSync();
    
    print('How should you update data inside of StatefulWidgets?\n1.By calling setState()\n2.By calling updateData()\n3.By calling updateUI()\n4.By calling updateState()');
    String? answersFi = stdin.readLineSync();
    
    if (answersZ !=null && answersZ.isNotEmpty && answersO !=null && answersT !=null && answersTH !=null && answersF !=null && answersFi !=null) {
      print('0번째 적은 답 : $answersZ');
      print('1번째 적은 답 : $answersO');
      print('2번째 적은 답 : $answersT');
      print('3번째 적은 답 : $answersTH');
      print('4번째 적은 답 : $answersF');
      print('5번째 적은 답 : $answersFi');
    }else{
      print('모든 답을 적어주세요.');
    }
  



}


class QuizQusetions {
  const QuizQusetions(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
const questions = [
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
