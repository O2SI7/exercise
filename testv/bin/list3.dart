void main() {
  List<String> abcmart = [
    'Nike',
    'Vans',
    'Lacoste',
  ];

  //일반 반환형 함수
  final newabcmart = abcmart.map((x) {
    return '브랜드 : $x';
  });

  print(abcmart);
  print(newabcmart.toList());

  //에로우 함수
  final newabcmart2 = abcmart.map((x) => '브랜드 : $x');
  print(newabcmart2.toList());

  print(abcmart == abcmart); //true
  print(abcmart == newabcmart); // flase
  print(newabcmart == newabcmart2); // flase Map을 쓰면 새로운 List가 생성되어 리스트 안에 값은 같으나 다른 List이다.

  //[1.png, 2.png, 3,png, 4.png, 5.png]
  String num = '12345';
  final parsed = num.split('').map((x) => '$x.png').toList();
  print(parsed);
}


