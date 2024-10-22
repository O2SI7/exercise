// Where는 주로 List나 다른 반복 가능한 컬렉션에서 특정 조건에 맞는 요소들을 추출할 때 사용됩니다.

void main() {
  List<Map<String, String>> people = [
    {'name': '짱구', 'group': '떡잎방범대'},
    {'name': '철수', 'group': '떡잎방범대'},
    {'name': '훈이', 'group': '떡잎방범대'},
    {'name': '맹구', 'group': '방범대'},
    {'name': '유리', 'group': '방범대'},
  ];

  print(people);

  final ddugrip = people.where((x)=> x['group'] == '떡잎방범대').toList();
  final notddugrip = people.where((x)=> x['group'] == '방범대').toList();
  print(ddugrip);
  print(notddugrip);
}
