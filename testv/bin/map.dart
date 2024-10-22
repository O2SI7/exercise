//Map은 두가지를 기억.
// 맵 자체를 맵핑을 해서 새로운 맵으로 만들때
// key,values 값을 .toList() 형태로 바꿀수 있다.

void main() {
  Map<String, String> game = {
    'Maple land': '메이플랜드',
    'Pubg': '배그',
    'RhythmGame': '리듬게임',
  };

  String woards = woard('나이스 Game');

  final result =
      game.map((key, value) => MapEntry('$woards $key', '게임이름 $value'));

  print(game);
  print(result);

  final keys = game.keys.map((x) => 'gg $x').toList();
  final values = game.keys.map((x) => '굿겜 $x').toList();
  print(keys);
  print(values);
}

String woard(String name) => '$name';
