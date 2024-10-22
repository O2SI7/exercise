//List와 같지만 중복된 값은 배제
void main(){
  Set gameSet ={'배그','메랜','리겜','리겜'};

  final newSet =gameSet.map((x)=> '게임이름: $x').toSet();

  print(newSet);
}