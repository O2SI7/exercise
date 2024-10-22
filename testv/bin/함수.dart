//반환타입 함수명(매개변수){}
void main() {
  int result = addNumbers(5, 7);
  print(result);
//--------------------------------------

  //optional parameter 23번라인
  //print에 출력 할 값을 넣으면 그 값이 출력, 적지 않을 시 선언 해둔 값이 출력 
  print(addThreeNumbers(3, 4));
  print(addThreeNumbers(3, 4, 5));
//---------------------------------------

  String greeting = greet('User');
  print(greeting);

//---------------------------------------
}

int addNumbers(int a, int b) {
  return a + b;
}

//optional parameter - 있어도 되고 없어도 되는 파라미터
int addThreeNumbers(int a, int b, [int c = 10]) {
  return a + b + c;
}

String greet(String name) {
  
  return 'Hello, $name!';
}
