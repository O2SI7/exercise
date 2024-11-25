import 'dart:io';
import 'dart:math'; // sqrt를 위해 필요

Future<void> main(List<String> arguments) async {
  // 도움말 처리
  if (arguments.contains('-h') || arguments.contains('--help')) {
    print('=== 계산기 도움말 ===');
    print('사용법: 계산기를 실행하여 숫자와 연산자를 입력하세요.');
    print('지원 연산:');
    print('  +  덧셈');
    print('  -  뺄셈');
    print('  *  곱셈');
    print('  /  나눗셈');
    print('  1/x  역수 계산');
    print('  x^2  제곱');
    print('  sqrt  제곱근');
    print('종료하려면 "exit"를 입력하세요.');
    return;
  }

  double? previousResult;

  print('=== Dart 계산기 앱 ===');
  print('종료하려면 "exit"를 입력하세요.');

  while (true) {
    // 이전 결과를 보여줌
    if (previousResult != null) {
      print('이전 결과: $previousResult');
    }

    // 첫 번째 숫자 입력
    stdout.write('첫 번째 숫자를 입력하세요: ');
    String? firstInput = stdin.readLineSync();
    if (firstInput == null || firstInput.toLowerCase() == 'exit') {
      print('계산기를 종료합니다.');
      break;
    }
    double? firstNumber = parseDouble(firstInput) ?? previousResult;

    if (firstNumber == null) {
      print('잘못된 입력입니다. 숫자를 입력하세요.');
      continue;
    }

    // 연산자 입력
    stdout.write('수행할 연산을 입력하세요 (+, -, *, /, 1/x, x^2, sqrt): ');
    String? operator = stdin.readLineSync();
    if (operator == null || operator.toLowerCase() == 'exit') {
      print('계산기를 종료합니다.');
      break;
    }

    // 두 번째 숫자 입력 (단항 연산자는 생략)
    double? secondNumber;
    if (!['1/x', 'x^2', 'sqrt'].contains(operator)) {
      stdout.write('두 번째 숫자를 입력하세요: ');
      String? secondInput = stdin.readLineSync();
      if (secondInput == null || secondInput.toLowerCase() == 'exit') {
        print('계산기를 종료합니다.');
        break;
      }
      secondNumber = parseDouble(secondInput);
      if (secondNumber == null) {
        print('잘못된 입력입니다. 숫자를 입력하세요.');
        continue;
      }
    }

    // 계산 수행
    try {
      double result = calculate(firstNumber, operator, secondNumber);
      print('결과: $result');
      previousResult = result;
    } catch (e) {
      print('에러: $e');
    }
  }
}

double calculate(double num1, String operator, [double? num2]) {
  switch (operator) {
    case '+':
      return num1 + (num2 ?? 0);
    case '-':
      return num1 - (num2 ?? 0);
    case '*':
      return num1 * (num2 ?? 1);
    case '/':
       if (num2 == 0) throw Exception('0으로 나눌 수 없습니다.');
      return num1 / (num2 ?? 1);
    case '1/x':
       if (num1 == 0) throw Exception('0의 역수는 정의되지 않습니다.');
      return 1 / num1;
    case 'x^2':
      return num1 * num1;
    case 'sqrt':
       if (num1 < 0) throw Exception('음수의 제곱근은 정의되지 않습니다.');
      return sqrt(num1);
    default:
      throw Exception('지원하지 않는 연산자입니다.');
  }
}

double? parseDouble(String input) {
  try {
    return double.parse(input);
  } catch (_) {
    return null;
  }
}
