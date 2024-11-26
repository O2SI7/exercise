import 'dart:io';

// 변환 함수
//  * 공식 = 화 > 섭 (?F - 32) x5/9 = 섭
//  * 공식 = 섭 > 화 (?C x 9/5) + 32 = 화
double celsiusToFahrenheit(double celsius) {
  return celsius * 9 / 5 + 32;
}

double fahrenheitToCelsius(double fahrenheit) {
  return (fahrenheit - 32) * 5 / 9;
}

//TODO: 단위 환산기 만들기
//섭씨 <-> 화씨 변환기
//킬로그램 <-> 파운드 <-> 온스 변환기
//미터 <-> 피트 <-> 야드 <-> 인치 <-> 마일 변환기

/**
   * 섭씨 -> Celsius
   * 화씨 -> Fahrenheit
   * 공식 = 화 > 섭 (?F - 32) x5/9 = 섭
   * 공식 = 섭 > 화 (?C x 9/5) + 32 = 화 
   * 
   * // 킬로그램-> 파운드
  // 파운드(Ib) = 킬로그램(kg) * 2.20462 
  // 파운드-> 킬로그램
  // 킬로그램(kg) = 파운드(Ib)  / 2.20462 

  // 파운드 -> 온스 
  // 온스(oz) = 파운드(Ib) * 16
  // 온스 -> 파운드
  //파운드(Ib) = 온스(oz) / 16

  // 킬로그램 -> 온스 
  // 온스(oz) = 킬로그램(kg) * 35.274
  // 온스 -> 킬로그램 
  // 킬로그램(kg) = 온스(oz) / 35.274 

// 미터 → 피트 
// 피트(ft) = 미터(m) × 3.28084
// 피트 → 미터
// 미터(m) = 피트(ft) ÷ 3.28084

// 미터 → 야드
// 야드(yd) = 미터(m) × 1.09361
// 야드 → 미터
// 미터(m) = 야드(yd) ÷ 1.09361
 
// 미터 → 인치
// 인치(in) = 미터(m) × 39.3701
// 인치 → 미터 
// 미터(m) = 인치(in) ÷ 39.3701

// 미터 → 마일
// 마일(mi)= 미터 (m) ÷ 1609.344
// 마일 → 미터 
// 미터(m) = 마일(mi) × 1609.344

// 피트 → 인치
// 인치(in) = 피트(ft) × 12
// 인치 → 피트
// 피트(ft) = 인치(in) ÷ 12

// 피트 → 야드 
// 야드(yd) = 피트(ft) ÷ 3
// 야드 → 피트
// 피트(ft) = 야드(yd) × 3

// 마일 → 피트
// 피트(ft) = 마일(mi) × 5280
// 피트 → 마일
// 마일(mi) = 피트(ft) ÷ 5280
   * 
   * [단위 변환기]
   * 1. 섭씨 <-> 화씨
   * 2. 킬로그램 <-> 파운드 <-> 온스
   * 3. 미터 <-> 피트 <-> 야드 <-> 인치 <-> 마일
   * 변환하려는 항목을 선택하세요: 1
   * 
   * 섭씨(C) 또는 화씨(F) 중 입력값의 단위를 선택하세요 (C/F): C
   * 변환하려는 값을 입력하세요: 25
   * 결과: 25°C -> 77°F
   * 
   * [단위 변환기]
   * 변환하려는 항목을 선택하세요: 1
   * 
   * 섭씨(C) 또는 화씨(F) 중 입력값의 단위를 선택하세요 (C/F): F
   * 변환하려는 값을 입력하세요: 100
   * 결과: 100°F -> 37.78°C
   * 
   */
Future<void> main(List<String> arguments) async {
  print('[단위 변환기]');
  print('1.섭씨 <-> 화씨');
  print('2.킬로그램 <-> 파운드 <-> 온스');
  print('3.미터 <-> 피트 <-> 야드 <-> 인치 <-> 마일');
  print('변환하려는 항목을 선택하세요: ');
  final command = stdin.readLineSync();

  if (command == '1') {
    //TODO: 온도 환산
    print('섭씨(C) 또는 화씨(F) 중 입력값의 단위를 선택하세요 (C/F)');
    final inputTemperatureType = stdin.readLineSync();

    if (inputTemperatureType == 'C') {
      //TODO: 섭씨->화씨
      // if (a == 'C') {
      //   print('변환하려는 값을 입력하세요:');
      //   final num = stdin.readLineSync();
      // }
      //  * 공식 = 화 -> 섭           (?F - 32) x5/9 = 섭
      //  * 공식 = 섭 -> 화               (?C x 9/5) + 32 = 화
      print('섭씨온도 입력:');
      final inputTemperature = double.parse(stdin.readLineSync()!);
      final fahrenheit = inputTemperature * 9 / 5 + 32;
      print('섭씨 $inputTemperature도 -> 화씨 $fahrenheit ');

      // 변환, 출력
    } else if (inputTemperatureType == 'F') {
      //TODO: 화씨->섭씨
      print('화씨온도 입력:');
      final inputTemperature = double.parse(stdin.readLineSync()!);
      final celsius = (inputTemperature - 32) * 5 / 9;
      print('화씨 $inputTemperature도 -> 섭씨 $celsius ');
    } else {
      //TODO: 없는 커맨드
    }
  } else if (command == '2') {
    print('TODO: 질량 환산');


  }else if(command =='2'){
    print('1.킬로그램 2.파운드 3.온스 선택 :');
        final q = stdin.readLineSync();
        if(q == '1'){
          //킬로그램
          print('무게 입력 : ');
          final weight = stdin.readLineSync();
          
          
        }else if(q == '2'){
          // 파운드일떄
        }else if(q == '3'){
        // 온스일때
        }
  }else if(command =='3'){
    
  
    


}

}
