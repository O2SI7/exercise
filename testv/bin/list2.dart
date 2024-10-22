//형변환

void main(){
  List<String> abcmart = ['a','b','c','c'];

  print(abcmart);
  print(abcmart.asMap()); //list가 map으로 바뀌어 key 와 value값을 보여줌.
  print(abcmart.toSet()); //set은 중복제거 

  Map abcmartMap = abcmart.asMap();

  print(abcmartMap.keys.toList()); //map을  list 형식으로 받을 수 있다.
  print(abcmartMap.values);

  Set abcmartSet =Set.from(abcmart);
  print(abcmartSet.toList());
  print(abcmartSet);
  
   
}