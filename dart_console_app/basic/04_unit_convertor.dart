import 'dart:io';

//TODO: 단위 환산기 만들기
//섭씨 <-> 화씨 변환기
//킬로그램 <-> 파운드 <-> 온스 변환기
//미터 <-> 피트 <-> 야드 <-> 인치 <-> 마일 변환기

///
///
/// [단위 변환기]
/// 1. 섭씨 <-> 화씨
/// 2. 킬로그램 <-> 파운드 <-> 온스
/// 3. 미터 <-> 피트 <-> 야드 <-> 인치 <-> 마일
/// 변환하려는 항목을 선택하세요: 1
///
/// 섭씨(C) 또는 화씨(F) 중 입력값의 단위를 선택하세요 (C/F): C
/// 변환하려는 값을 입력하세요: 25
/// 결과: 25°C -> 77°F
///
/// [단위 변환기]
/// 변환하려는 항목을 선택하세요: 1
///
/// 섭씨(C) 또는 화씨(F) 중 입력값의 단위를 선택하세요 (C/F): F
/// 변환하려는 값을 입력하세요: 100
/// 결과: 100°F -> 37.78°C
///
///
///
Future<void> main(List<String> arguments) async {
  while (true) {
    printWelcome();

    final command = getUserInput(['1', '2', '3', 'exit']);
    if (command == '1') {
      executeTempConversion();
    } else if (command == '2') {
      executeMassConversion();
    } else if (command == '3') {
      executeLenthConversion();
    } else if (command == 'exit') {
      break;
    }
  }
}

void printWelcome() {
  print('[단위 변환기]');
  print('1.온도 : 섭씨 <-> 화씨');
  print('2.질량 : 킬로그램 <-> 파운드 <-> 온스');
  print('3.길이 : 미터 <-> 피트 <-> 야드 <-> 인치 <-> 마일');
  print('변환하려는 항목을 선택하세요: ');
}

String getUserInput(List<String> allowCommandList /** [1, 2, 3] */) {
  String? command;

  command = stdin.readLineSync();
  while (!allowCommandList.contains(command)) {
    print('유효하지 않은 명령입니다. 다시 입력해주세요');
    command = stdin.readLineSync();
  }

  //얘는 리턴이 항상 1, 2, 3중 하나임을 보장함
  return command!;
}

void executeLenthConversion() {
  print('1.미터(m)\n2.피트(ft)\n3.야드(yd)\n4.인치(inch)\n5.마일(mi)');
  final q = getUserInput(['1', '2', '3', '4', '5']);
  if (q == '1') {
    //미터 (m)
    //convertMeters();
    print(' 값 입력 : ');
    final m = double.parse(stdin.readLineSync()!);
    final ft = (m * 3.28084); //피트 값
    final yd = (m * 1.09361); //야드 값
    final inch = (m * 39.3701); //인치 값
    final mi = (m / 1609.344); //마일 값
    print('변환 된 피트 값 : $ft\n변환 된 야드 값 : $yd');
    print('변환 된 인치 값 : $inch\n변환 된 마일 값 : $mi');
  } else if (q == '2') {
    //피트 (ft)
    //convertFeets();
    print(' 값 입력 : ');
    final ft = double.parse(stdin.readLineSync()!);
    final m = (ft / 3.28084); //미터 값
    final yd = (ft / 3); //야드 값
    final inch = (ft * 12); //인치 값
    final mi = (ft / 5280); //마일 값
    print('변환 된 미터 값 : $m\n변환 된 야드 값 : $yd');
    print('변환 된 인치 값 : $inch\n변환 된 마일 값 : $mi');
  } else if (q == '3') {
    //야드(yd)
    print(' 값 입력 : ');
    final yd = double.parse(stdin.readLineSync()!);
    final m = (yd / 1.09361); //미터 값
    final ft = (yd / 3); //피트 값
    final inch = (yd * 36); //인치 값
    final mi = (yd / 0.00056818); //마일 값
    print('변환 된 미터 값 : $m\n변환 된 피트 값 : $ft');
    print('변환 된 인치 값 : $inch\n변환 된 마일 값 : $mi');
  } else if (q == '4') {
    //인치(in)
    print(' 값 입력 : ');
    final inch = double.parse(stdin.readLineSync()!);
    final m = (inch / 39.3701); //미터 값
    final ft = (inch / 12); //피트 값
    final yd = (inch / 36); //야드 값
    final mi = (inch / 63360); //마일 값
    print('변환 된 미터 값 : $m\n변환 된 피트 값 : $ft');
    print('변환 된 야드 값 : $yd\n변환 된 마일 값 : $mi');
  } else if (q == '5') {
    //마일(mi)
    print(' 값 입력 : ');
    final mi = double.parse(stdin.readLineSync()!);
    final m = (mi * 1609.344); //미터 값
    final ft = (mi * 5280); //피트 값
    final yd = (mi * 1760); //야드 값
    final inch = (mi * 63360); //인치 값
    print('변환 된 미터 값 : $m\n변환 된 피트 값 : $ft');
    print('변환 된 야드 값 : $yd\n변환 된 인치 값 : $inch');
  }
}

void executeMassConversion() {
  print('1.킬로그램(kg)\n2.파운드(lb)\n3.온스(oz)');
  final q = getUserInput(['1', '2', '3']);
  if (q == '1') {
    //킬로그램
    print('무게 입력 : ');
    final weight = double.parse(stdin.readLineSync()!);
    final lb = (weight * 2.20462); //파운드 값
    final oz = (weight * 35.274); //온스 값
    print('변환 된 파운드 값 : $lb\n변환 된 온스 값 : $oz');
  } else if (q == '2') {
    // 파운드일떄
    print('무게 입력 : ');
    final lb = double.parse(stdin.readLineSync()!);
    final weight = (lb / 2.20462); //킬로그램 값
    final oz = (lb * 16); //온스 값
    print('변환 된 킬로그램 값 : $weight\n변환 된 온스 값 : $oz');
  } else if (q == '3') {
    // 온스일때
    print('무게 입력 : ');
    final oz = double.parse(stdin.readLineSync()!);
    final weight = (oz / 35.274); //킬로그램 값
    final lb = (oz / 16); //파운드 값
    print('변환 된 킬로그램 값 : $weight\n변환 된 파운드 값 : $lb');
  }
}

void executeTempConversion() {
  print('섭씨(C) 또는 화씨(F) 중 입력값의 단위를 선택하세요 (C/F)');
  final inputTemperatureType = getUserInput(['C', 'F']);
  if (inputTemperatureType == 'C') {
    //TODO: 섭씨->화씨
    print('섭씨온도 입력:');
    final inputTemperature = double.parse(stdin.readLineSync()!);
    final fahrenheit = inputTemperature * 9 / 5 + 32;
    // 변환, 출력
    print('섭씨 $inputTemperature도 -> 화씨 $fahrenheit ');
  } else if (inputTemperatureType == 'F') {
    //TODO: 화씨->섭씨
    print('화씨온도 입력:');
    final inputTemperature = double.parse(stdin.readLineSync()!);
    final celsius = (inputTemperature - 32) * 5 / 9;
    print('화씨 $inputTemperature도 -> 섭씨 $celsius ');
  }
}
