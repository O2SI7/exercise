//named parameter - 이름이 있는 파라미터 (순서가 중요하지 않다.)
//required를 붙히면 된다. 

void main() {
  addNum(x: 10, y: 20, z: 30);
  addNum(y: 20, z: 30, x: 10);
}

addNum({required int x, required int y, required int z}) {
  print('x : $x');
  print('y : $y');
  print('z : $z');
}
